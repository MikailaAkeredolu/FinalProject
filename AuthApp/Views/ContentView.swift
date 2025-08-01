//
//  ContentView.swift

import SwiftUI


//Fact Model
struct Fact: Codable{
    let text: String
}


struct ContentView: View {
    
   @ObservedObject var mainViewModel: MainViewModel
    
    @State private var fact: String = "Get Fact"
    @State private var isLoading = false
    
    
    var body: some View {
        
        TabView{
        
        ZStack {
            
            Color.yellow.ignoresSafeArea()
            
            VStack{
                
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .frame(width: 150, height: 150)
            
            Text(fact)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
                    .padding()
            
            Button(action: fetchFact){
                Text("Get new fact")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
            }.padding(.horizontal)
            
                if isLoading{
                    ProgressView()
                }
                //
                
                //signout button
                
                Button(action: {
                    mainViewModel.signOut()
                }){
                    Label("", systemImage: "heart.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(.black)
                      
                }
                
//                Button{
//                    mainViewModel.signOut()
//                } label:{
//
//                    Text("Sign out")
//                        .padding()
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .background(Color.red)
//                        .cornerRadius(10)
//                }.padding()
        }
            
        
        }.tabItem{
            Image(systemName: "house.fill")
            Text("Home")
        }
            
        ProfileView(profileViewModel: mainViewModel)
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
            
      } //end of tabview
    } //end of body
    
   
    //Function goes below here
    func fetchFact(){
        
        isLoading = true
        
        let url = URL(string: "https://uselessfacts.jsph.pl/random.json?language=en")!
        
        URLSession.shared.dataTask(with: url){ data,
            response, error in
            DispatchQueue.main.async{
                isLoading = false
            }
            
            guard let data = data, error == nil else{
                DispatchQueue.main.async{
                    fact = "failed to load"
                }
                
                return
            }
            
            do{
               let decoded = try JSONDecoder().decode(Fact.self, from: data)
                
                DispatchQueue.main.async{
                    fact = decoded.text
                }
                
            }catch{
                DispatchQueue.main.async{
                    fact = "failed to parse fact"
                }
            }
            
        }
        .resume()
    }
    
    
    
    
}


//New struct for profileView
struct ProfileView: View {
    
    @ObservedObject var profileViewModel: MainViewModel
    
    var body: some View {
       
        ZStack{
            Color.green
            
            UserProfileView(mainViewModel: profileViewModel)
        }
        
    }
}



#Preview {
    ContentView(mainViewModel: MainViewModel())
}

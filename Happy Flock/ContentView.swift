//
//  ContentView.swift
//  Happy Flock
//
//  Created by Norman A. Toro Vega on 10/17/20.
//

import SwiftUI

var twitterBlueStandard = Color(UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1))

struct ContentView: View {
        var body: some View {
            NavigationView {
                NavigationLink(destination: TopicsView()) {
                    VStack(alignment: .leading) {
                                                        
                                                        
                    TitleView()
                                                        
                    VStack(alignment: .leading) {
                        InformationDetailView(title: "Browse Favorites", subTitle: "Check out happy tweets from those you follow and more!", imageName: "star")

                        InformationDetailView(title: "Personalize Preferences", subTitle: "Select categories that you want to hear from!", imageName: "good")

                        InformationDetailView(title: "Tweet Happier, Tweet Healthier", subTitle: "Enjoy happier tweets at the palm of your hand!", imageName: "chart")
                    }
                    
                    Spacer(minLength: 30)
                    
                    HStack {
                        Spacer()
                        Text("Get Started").customButton()
                        Spacer()
                    }
               }.padding(.horizontal)

                }.navigationBarTitle("").buttonStyle(PlainButtonStyle())
        }
    }
}

struct TitleView: View {

    var body: some View {
        HStack {
            Spacer()
            VStack {
                HStack {
                    Image("Logo").resizable().scaledToFit().frame(width: 80, height: 80)
                    Spacer()
                }
                Text("Welcome to").fontWeight(.black)
                    .font(.system(size: 40)).foregroundColor(.black)

                Text("HappyFlocks!")
                    .fontWeight(.black)
                    .font(.system(size: 40))
                    .foregroundColor(twitterBlueStandard)
            }.padding(.top, -100).padding(.bottom, 30)
            Spacer()
        }
    }
}

struct InformationDetailView: View {
    var title: String = "title"
    var subTitle: String = "subTitle"
    var imageName: String = ""

    var body: some View {
        HStack(alignment: .center) {
            Image(imageName).resizable().scaledToFit().frame(width: 80, height: 80).padding(.horizontal)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.title).bold()
                    .foregroundColor(.primary)
                    .accessibility(addTraits: .isHeader).padding(.trailing, 50)

                Text(subTitle)
                    .font(.system(size: 18))
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true).padding(.trailing, 50)
            }
        }
        .padding(.top)
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(twitterBlueStandard))
            .padding(.bottom)
    }
}

extension View {
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}

struct TopicsView: View {
    var body: some View {
        
            NavigationLink(destination: HomeView()) {
                VStack(alignment: .leading) {
                                                    
                    Text("Follow your")
                        .fontWeight(.black)
                        .font(.system(size: 40))
                        .foregroundColor(.black)
                    
                    Text("favorite topics!")
                        .fontWeight(.black)
                        .font(.system(size: 40))
                        .foregroundColor(twitterBlueStandard)
                                                    
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        RoundedRectangle(cornerRadius: 20).frame(width: 170, height: 90)
                        RoundedRectangle(cornerRadius: 20).frame(width: 170, height: 90)
                        Spacer()
                    }.padding(.vertical, 20)
                    
                    
                }
                
                Spacer(minLength: 30)
                
                HStack {
                    Spacer()
                    Text("Next").customButton()
                    Spacer()
                }
           }.padding(.horizontal)

            }.navigationBarTitle("").buttonStyle(PlainButtonStyle())
        }
}

struct HomeView: View {
    var body: some View {
        TabView {
            TodayView()
                .tabItem {
                Image(systemName: "house")
                    Text("Today")
                    
                    
            }
            ProfileView()
                .tabItem {
                Image(systemName: "person.circle")
                    Text("Profile")
            }
            HappyView()
                .tabItem {
                Image(systemName: "square.and.pencil")
                    Text("#BeHappy")
            }
        }
        
        
    }
}

struct TodayView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image("Logo").resizable().scaledToFit().frame(width: 80, height: 80)
                Spacer()
            }

            HStack {
                Spacer()
                Text("Today's Happy Tweets").font(.largeTitle).bold()
                    .padding()
                Spacer()
            }
            TweetView()
            
            Spacer()
        }.padding(.top, -60)
    }
}

struct TweetView: View {
    var screenName: String = "Norman A. Toro Vega 🎙"
    var tweetText: String = "Lorem ipsum Dolor Sit Amet Avec Lorem Ipsum. Lorem! Ipsum #TweetTweet"
    var imageName: String = "TestImage"
    
    var body: some View {
        // Tweet Component
        HStack {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.init(UIColor.white))
                    .frame(width: 395, height: 130).shadow(radius: 7)
                
                VStack {
                    // Profile Picture + Text
                    HStack {
                        Image(imageName).resizable().scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 3))
                            .shadow(radius: 4).frame(width: 80, height: 80)
                        
                        VStack(alignment: .leading) {
                            Text(screenName).font(.title2).bold()
                            Text(tweetText)
                        }.padding()
                    }
//                    // Button Interaction
//                    HStack {
//                        Text("BUTTON_GOES HERE_(?)")
//                    }
                }.padding(.leading, 10).padding(.trailing, 2).padding(.top, 0)
            }
            Spacer()
        }
    }
}

struct ProfileView: View {
    var profileName: String = "HappyFlock"
    var imageName: String = "TestImage"
    var username: String = "normant_"
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image("Logo").resizable().scaledToFit().frame(width: 80, height: 80)
                Spacer()
            }

            VStack() {
                HStack {
                    Text("Hello,").font(.largeTitle).bold()
                    Spacer()
                }
                HStack {
                    Text(profileName + "!").font(.largeTitle).bold().foregroundColor(twitterBlueStandard)
                    Spacer()
                }
            }.padding(.leading, 10)
            
            HStack {
                Spacer()
                Image(imageName).resizable().scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 4).frame(width: 250, height: 250)
                Spacer()
            }.padding(.top, 30)
            
            HStack {
                Spacer()
                Text("@" + username).font(.system(size: 30)).bold().foregroundColor(.gray)
                Spacer()
            }

            Spacer()
        }.padding(.top, -60).padding(.horizontal)
        
        
        
    }
}

struct HappyView: View {
    @Environment(\.openURL) var openURL
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image("Logo").resizable().scaledToFit().frame(width: 80, height: 80)
                    Spacer()
                }

                HStack {
                    Spacer()
                    Text("Spread the happiness!").font(.largeTitle).bold()
                        .padding()
                    Spacer()
                }
                TweetView(screenName: "HappyTweets at BostonU", tweetText: "Having a great time at #UltraHacks! 😁🎉", imageName: "Sprinkles")

                HStack {
                    Spacer()
                    
                    
                    Button(action: newHappyTweet) {
                        Text("Tweet Happy Thingz!").customButton()
                        
                    }

                    Spacer()
                }.padding(.top, 30).padding(.bottom, 15)
                
                Text("Check this out!").font(.largeTitle).bold().padding(.horizontal)
                
                Text("It’s okay to take a step back and enjoy the good in life! That’s what HappyFlock is all about! So before you tweet again, here’s something to think about :D").font(.system(size: 23)).padding(.horizontal).padding(.top, 10).padding(.bottom, 15)
                
                Group {
                    HStack {
                        Spacer()
                        Image("Big1").resizable().scaledToFit().frame(width: 40, height: 40)
                        Text("Be an umbrella on a rainy day!").font(.system(size: 23))
                        Spacer()
                    }.padding(.horizontal, 15)
                    
                    HStack {
                        Spacer()
                        Image("Tweetstorm").resizable().scaledToFit().frame(width: 350, height: 350)
                        Spacer()
                    }
                }.padding(.bottom, 25)
                
                Group {
                    HStack {
                        Spacer()
                        Image("Big2").resizable().scaledToFit().frame(width: 40, height: 40)
                        Text("Start where you are! Use what you have! Do what you can!").font(.system(size: 23))
                        Spacer()
                    }.padding(.horizontal, 15)
                    
                    HStack {
                        Spacer()
                        Image("Launch").resizable().scaledToFit().frame(width: 350, height: 350)
                        Spacer()
                    }
                }.padding(.bottom, 25)
                
                Group {
                    HStack {
                        Spacer()
                        Image("Big3").resizable().scaledToFit().frame(width: 40, height: 40)
                        Text("Love yourself even if you look like a burnt chicken nugget!").font(.system(size: 23))
                        Spacer()
                    }.padding(.horizontal, 15)
                    
                    HStack {
                        Spacer()
                        Image("Mention").resizable().scaledToFit().frame(width: 350, height: 270)
                        Spacer()
                    }
                }.padding(.bottom, 25)


                Spacer()
                
            }.padding(.top, -60)
        }
    }
    
    func newHappyTweet() {
        guard let url = URL(string: "twitter://post?message=%23HappyTweets") else {
            return
        }
        openURL(url)
    }
}

func getTweets() {
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

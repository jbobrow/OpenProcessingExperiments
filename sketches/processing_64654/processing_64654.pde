

void SetupTwitter(){
  smooth();
 
  if (connected){
    Twitter twitter = new Twitter();
    for (int party = 0; party < 3; party++){
      try{
        Query query = new Query(searchTerms[party]);
        QueryResult result = (QueryResult) twitter.search(query);
 
        java.util.List tweets = result.getTweets();
        println(tweets.size());
        Tweet t = (Tweet) tweets.get(0);
        lastId[party] = t.getId();
        println(lastId[party]);
        gt[party] = t.getText();
        gf[party] = t.getFromUser();
        gn[party] = t.getProfileImageUrl();
       
      }
      catch (Exception e){
        System.out.println(e);
      }
    }
  }
 
//  for (int i = 0; i < 3; i++){
//    target[i]=height-12;
//  }
 
  startTime = hour() + ":" + trim(nfs(minute(),2));
}




void FetchTwitterMsgs(){
  
   now = second();

   
   maximum = max(y[0],y[1],y[2]);
   total = y[0]+y[1]+y[2];
 
  //every 3 seconds this gets the tweets
  if (now!= lastSecond && now%3==0){
    //do a new twitter search since the last ID
    if (connected){
      Twitter twitter = new Twitter();
      for (int party = 0; party < 3; party++){
        try{
          
          Query query = new Query(searchTerms[party]);
          
          //returns tweets with status ids greater than the given id
          query.setSinceId(lastId[party]);
          
          //QueryResult is A data interface representing search API response
          QueryResult result = (QueryResult) twitter.search(query);
          
          java.util.List tweets = result.getTweets();
          //println(tweets.size());
          if (tweets.size()>0){
            Tweet t = (Tweet) tweets.get(0);
            //guess it must be sorted so that the 0th is the most recent
            lastId[party] = t.getId();
            //gt is the text of the 0th tweet
            gt[party] = t.getText();
            //gf us user profile name
            gf[party] = t.getFromUser();
            //gn is the URL of the profile image for the 0th tweeter
            gn[party] = t.getProfileImageUrl();
            //println(gf[party]);
            //println(lastId[party]);
            y[party]+=tweets.size();   // height/6 replaces 100
          }
        }
        catch (Exception e){
          System.out.println(e);
        }
      }
    }
    else{
      //if it fails it just makes up random numbers!
      for (int i = 0; i < 3; i++){
        y[i]+= int(random(10));
      }
    }
  }
 
  lastSecond = now;
  
  
  
}

void DisplayProfilePics(){
   
  //following does the displaying
  for (int i = 0; i < 2; i++){    
    
    
    profile = loadImage(gn[i], "png");
    profile.resize(width/6, height/4); // .25 replaces 150
    image(profile,(2*i+1)*width/6-width*.094,height-height*.467); //.094 replaces 100, .467 replaces 280

  }
  
  if(gn[2]!=null){
          profile = loadImage(gn[2], "png");
          profile.resize(width/6, height/4); // .25 replaces 150
          image(profile,(2*2+1)*width/6-width*.094,height-height*.467); //.094 replaces 100, .467 replaces 280
    }
}



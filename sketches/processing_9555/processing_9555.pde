
import twitter4j.org.json.*;
import twitter4j.*;
import twitter4j.http.*;
import twitter4j.examples.*;

PFont font;
PFont font2;

int y[] = new int[3];
float target[] = new float[3];

String[] LABEL = {
  "CON","LAB","LIBD"
};

String searchTerms[] = {
  "conservatives OR conservative OR tory OR tories OR conservative","labour OR uklabour",
  "libdems OR libdem OR liberal+democrats OR liberal+democrat OR lib+dem OR lib+dems"
};

color[] clr = {
  color(51,51,153),color(204,0,0),color(255,153,0)};

color bg = color(250,255,250);

int now;
int lastSecond;
String startTime;

long lastId[] = new long[3];

boolean connected = true;

void setup(){
  size(400,400); 
  smooth();
  font = loadFont("TrebuchetMS-26.vlw");
  font2 = loadFont("TrebuchetMS-Italic-22.vlw");

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
      }
      catch (Exception e){
        System.out.println(e);
      }
    }
  }

  for (int i = 0; i < 3; i++){
    target[i]=height-12; 
  }

  startTime = hour() + ":" + trim(nfs(minute(),2));

  textAlign(CENTER);
  noStroke();
  background(255);
}


void draw(){

  now = second();

  background(bg);

  int maximum = max(y[0],y[1],y[2]);
  int total = y[0]+y[1]+y[2];

  fill(0,200);
  textFont(font,26);
  text("The Twitter Party Race",width/2,45);
  textFont(font2,22);
  String label = "tweets between " + startTime + " and " + hour() + ":" + trim(nfs(minute(),2));
  text(label,width/2,75);

  for (int i = 0; i < 3; i++){
    if (y[i]!=0) target[i] = 0.95*target[i]  + 0.05*map(y[i],0,maximum,height,height/3);

    fill(clr[i]);
    rect(i*width/3+4,target[i],width/3-8,height-target[i]-4);

    fill(0,200);
    int percent = 0;
    if (total > 0) percent = int((100*y[i])/total);
    textFont(font,26);
    text(LABEL[i], (2*i+1)*width/6,height-78);
    textFont(font2,22);
    String display =  percent + "%\n"+ y[i] + " tweets";
    text(display, (2*i+1)*width/6,height-46);
  }

  //every 3 seconds
  if (now!= lastSecond && now%3==0){
    //do a new twitter search since the last ID
    if (connected){
      Twitter twitter = new Twitter();
      for (int party = 0; party < 3; party++){
        try{ 
          Query query = new Query(searchTerms[party]);
          query.setSinceId(lastId[party]);
          QueryResult result = (QueryResult) twitter.search(query);
          java.util.List tweets = result.getTweets();
          //println(tweets.size());
          if (tweets.size()>0){
            Tweet t = (Tweet) tweets.get(0);
            lastId[party] = t.getId();
            //println(lastId[party]);
            y[party]=min(100*height,y[party]+tweets.size());
          }
        }
        catch (Exception e){
          System.out.println(e);
        }
      }
    }
    else{
      for (int i = 0; i < 3; i++){
        y[i]+= int(random(10));
      } 
    }
  }

  lastSecond = now;

}



































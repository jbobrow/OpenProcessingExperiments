
Introducing Plus+ Membership!
Enjoy the next level for your sketches
while supporting OpenProcessing
Bigger uploads, no ads,
custom license & private sketches
login - sign up browse classrooms collectionsbooksgo plus+jobs             
fullscreen
electionrace_online.pde
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
 code
 tweaks (0)
about this sketch
twitter uk election 1837     views May 7, 2010
This sketch is running as Java applet, exported from Processing.

how to attribute?
license
   



why?
advertisement

 

Advertise HereAdvertise Here
 Daniel Soltis


Twitter Party Race
 Add to Faves 2 
Tweak!
Download
Embed
Tracks and compares volume of tweets about the Conservatives, Labour, and Lib Dems, from the start of the sketch for as long as it runs.

A bit of a dodgy startup when embedded, at least on my computer.

 Varun Rau  
13 Oct 2011 Hi, I was trying to make a small Twitter sketch, but it I get an error that says that a Twitter object cannot be instantiated, yet I noticed that in your sketch you do instantiate a Twitter object. How did you do that?
 ilam   
10 Nov 2011 Hello- trying to add another column of incoming feed subject besides the 3 topics, but don't know where it is in the code. I've tried making the background larger, but it just distorts the the x, y screen. Thanks!
You need to login/register to comment.

About OpenProcessing
OpenProcessing is an online community platform devoted to sharing and discussing Processing sketches in a collaborative, open-source environment.

 Download Processing
Terms of Service - Privacy Policy

Get in Touch
To contact, send an email to:
info@openprocessing.org



Follow OpenProcessing on Twitter!
Blog - Feedback forum

 

License & Credits
Sketches and source code of free membership users are licensed under CC and GNU GPL.

  

Plus+ member sketches may include a different license.

 
Most icons by somerandomdude.
Syntax highlighting and Processing brush under LGPL 3.

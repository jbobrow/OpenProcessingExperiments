
//Homework #12
//Tyler Porten (tporten) copyright 2012
//Data from Facebook Statistics, respective activities on facebook
//in the span of 20 minutes


int [] stats = { 1000000, 1484000, 1972000, 2716000, 
                 2716000, 1323000, 1851000, 1587000 };
String [] words = {"Links Shared", "Event Invites", "Friend Requests Accepted",
                   "Photos Uploaded", "Messages Sent", "Tagged Photos",
                   "Status Updates", "Wall Posts"};
                 
                 
PFont f;                 
float leftEdge, rightEdge, topEdge, bottomEdge;
int minStat, maxStat;

void setup(){
 size(1200, 500); 
 background(255);
 f = loadFont ("courier.vlw");
 textFont(f);
 textSize(10);
 textAlign(CENTER, CENTER);
 smooth();
 rectMode(CORNERS);
 
 
 leftEdge = 100;
 rightEdge = width - 10;
 topEdge = 20;
 bottomEdge = height - 20; 
 
 minStat = min(stats) - 1000000;
 maxStat = max(stats) + 500000;

}

void draw(){
  background(255);
 plotStats();
 windowSetup(); 
 mouseMoved();
}

void plotStats(){
 fill(90, 99, 255);
 stroke(90, 99, 255);
 strokeWeight(4);
  for (int i = 0; i < stats.length; i++){
   float x = map (i, 0, stats.length, leftEdge, rightEdge);
   float y = map (stats[i], maxStat, minStat, topEdge, bottomEdge);
   //point(x, y);
   text(words[i], x, bottomEdge + 10);
   fill(90, 99, 255);
   text(stats[i], x, y - 10);
   fill(90, 99, 255);
   noStroke();
   rect(x-50, y, x+50, bottomEdge);
  } 

} 
  
void windowSetup(){
  pushStyle();
  fill(90, 99, 255);
  textSize(20);
 text("What Happens on Facebook in 20 Minutes", width/2, topEdge); 
  
  popStyle();
  
}

void mouseMoved(){
  pushStyle();
   fill(84, 237, 225);
   textSize(16);
   textAlign(CORNER);
 if (mouseX < width/8){
   text("Links Shared", mouseX, mouseY-5);
 }
   else if (mouseX < (2*width)/8){
     text("Event Invites", mouseX, mouseY-5);
   }
    else if (mouseX < (3*width)/8){
     text("Friend Requests Accepted", mouseX, mouseY-5);
   }
    else if (mouseX < (3.8*width)/8){
     text("Photos Uploaded", mouseX, mouseY-5);
   }
   else if (mouseX < (4.7*width)/8){
     text("Messages Sent", mouseX, mouseY-5);
   }
   else if (mouseX < (5.5*width)/8){
     text("Tagged Photos", mouseX, mouseY-5);
   }
   else if (mouseX < (6.5*width)/8){
     text("Status Updates", mouseX, mouseY-5);
   }
   else if (mouseX < (8*width)/8 ){
     text("Wall Posts", mouseX, mouseY-5);
   }
 popStyle();
}


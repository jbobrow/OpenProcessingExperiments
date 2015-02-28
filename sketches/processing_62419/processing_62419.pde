
PImage head;
PImage tail;
PFont font;

float rand=random(1);
int total, heads, tails, headstreak, tailstreak;

void setup(){
  background(255);
  size(500,500);
  smooth();
  textAlign(CENTER);
  imageMode(CENTER);
  head = loadImage("head.jpg");
  tail = loadImage("tail.jpg");
  font=loadFont("HelveticaNeue-24.vlw");
  textFont(font);
  total=0;
  heads=0;
  tails=0;
  fill(0);
  text("Click Anywhere to Flip the Coin!",width/2,height/2);
}

void draw(){
}

void mousePressed(){
  
  background(255);
  
  rand=random(1);
  if(rand>0.5) {
    image(head,width/2,height/2);
    total+=1;
    heads+=1;
    headstreak+=1;
    tailstreak=0;
  } else {
    image(tail,width/2,height/2);
    total+=1;
    tails+=1;
    tailstreak+=1;
    headstreak=0;
  }
  
  fill(0);
  text("Total: "+total+", Heads: "+heads+", Tails: "+tails,width/2,33);
  text("Head Streak: "+headstreak+", Tail Streak: "+tailstreak,width/2,height-18);
}


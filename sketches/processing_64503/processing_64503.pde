
String word = "FOLLOWER";

float xpos, ypos;

void setup(){
  size(500,500);
  xpos =width/2; // give variable value
  ypos =height/2;
  PFont font = loadFont ("AkzidenzGroteskBE-XBdCnIt-48.vlw");
  textFont(font);
  smooth();
  textAlign(LEFT);
}

void draw(){
  background(255);
  
  for(int i=0; i<=width; i+=80){ //repeating the whole width
  
  
  pushMatrix(); // so it doesn't accumulate on itself from the forloop; isolates each rectangle
  float angle = atan2(mouseY,mouseX-i); //y,x <--tricking atan2
  translate(i,0);
  rotate(angle);
  fill(0);
  text(word,0,0); //origin,  width & height
  popMatrix();
    }
  }



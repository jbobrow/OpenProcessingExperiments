
float angle=9;// variable for angle
PFont font;
PImage img;

void setup(){
  img = loadImage("skywheel.png"); 
  size(600,400);
  smooth();

}
 
void draw(){
  image (img, 0,0);
   frameRate(79);
  fill(255,20);
  
  rect(0,0,750,width);
 
  angle=angle+10;
     translate(340,220); //offset
     rotate(angle-9); //rotate as angle-1 value
     fill(250);
 textSize(47);
 strokeWeight(8);
text("Skywheel",80,40);
   fill(150,3,3,90);// mean postal code move with your mouse

}


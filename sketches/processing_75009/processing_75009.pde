
int s = 5;
int o = 5;
PImage img;


void setup(){
  size(538, 600);
  background(255);
  img = loadImage("manwoman.jpg");

}
  
  void draw(){

  background(255);
  image(img, 0, 0);
  
  //sise
  fill(255);
  ellipse(110, 200, s, s);
  ellipse(180, 200, s, s);
  
  fill(0);
  ellipse(110, 200, 5, 5);
  ellipse(180, 200, 5, 5);
  
  //eyes
  fill(255);
  ellipse(380, 60, o, o);
  ellipse(410, 60, o, o);
  
  fill(0);
  ellipse(380, 60, 2, 2);
  ellipse(410, 60, 2, 2);
  
  if (mousePressed == true && s<=70){
    s = s + 1;
  }  
else {
  s = 1;
}
  
  if (mousePressed == true && o<=30){
    o = o + 1;
}
 else {
o = 1;   
  }
  
}



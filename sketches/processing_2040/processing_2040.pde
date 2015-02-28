

float matiz=random(245);


void setup(){
  size(500,500);
  background(255);
 

}
void draw(){
  
   colorMode(HSB,100);
  smooth();
  translate(width/2,height/2);
  rotate(radians(10)+random(50));
  stroke(matiz+random(10),30+random(155),150 +random(55));
  strokeWeight(5+random(10));
  
  float posX=-width*2;
  float posY=-height*2;
  line(0,0,posX+random(50),posY+random(50));
  frameRate(5);
  //saveFrame("screen");
}







String text = "♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥";

float xpos, ypos;
 
void setup(){
  size(500,500);
  xpos =width/20; // give variable value
  ypos =height/20;
 

  smooth();
  textAlign(LEFT);
}
 
void draw(){
  background(255);
   
  for(int i=0; i<=width; i+=10){ 
   
   
  pushMatrix(); 
  float angle = atan2(mouseY,mouseX-i); 
  translate(i,0);
  rotate(angle);
   fill(255,random(255),random(42,255));
  text(text,0,0); 
  popMatrix();
    }
  }




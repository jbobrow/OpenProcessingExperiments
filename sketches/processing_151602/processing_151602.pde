
void setup (){
  size (500, 500);
}

void draw (){
  background (0);
  
  float farbwinkelRot = map(mouseY, 0, 250, 250, 0);
  float farbwinkelBlau = map(mouseY/2, 0, 25, 100, 0);
  float farbwinkelGruen = map(mouseX/4, 0, 100, 100, 0);
  
  //rotes Rechteck
  
  if (second() > 800) {
    background (0);
  }
  
 else {
    stroke(255);
    fill(farbwinkelRot, 0, 0, 150);
    rect (0, 0, second(), 500);
 }
 
    stroke(255);
    fill(farbwinkelBlau, 9, 50, 211);
    rect (0, 0, 500, second());
    
   if (second() < 200) {
    fill(farbwinkelGruen, 100, 100, 255);
    rect(500, 500, -second()*9, -second()*9);
   }


}

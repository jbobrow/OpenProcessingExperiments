
/* ======================================================
Aurthor: Farbod Fathalipouri
Student ID: 373457
Natural System Studio, University of Melbourne
  
NO COPYRIGHT!
welcome to copy, modify and distribute any way you want!
======================================================  */
//===============SETUP=============
int d=0;

void setup(){
  size (screen.width,screen.height);
  background(150);

}

void draw(){

}
void mousePressed(){
  ellipseMode(CENTER);
  fill(255);
  stroke(0);
  float a = random(255);
  float b = random(255);
  float c = random(255);
  fill((int)a,(int)b,(int)c);
  ellipse(mouseX,mouseY,height/4,height/4);
/*float a = random(255);
  float b = random(255):
  float c = random(255);*/
  //smaller circle and its shade
  // fill(0);
  //rotate(random(TWO_PI));
  fill(0);
  ellipse(mouseX+(mouseX/30),mouseY,height/10,height/12);
  fill(255);
  ellipse(mouseX,mouseY,height/12,height/12);
  
  d++;
  
  println("Number of amigos Invading is:"+d);
}
/*void mouseClicked(){
  int d=1;
  println("Number of amigos waiting are;"+d);
  d++;
}*/


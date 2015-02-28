
void setup () {
  background(252,252,31);
  size(600,600);
 // noLoop ();
  smooth ();
  

}
int value = 0;
void draw () {


 
  
fill(254, 238, 231);
strokeWeight(3);
ellipse(284, 267, 330, 330);


fill(value);
ellipse(225,289,30,27);

ellipse(348,295,44,44);

fill(255, 0, 0);
strokeWeight(3);
ellipse(288, 365, 134, 51);

fill(255,255,255);
rect(259,344,24,21);

fill(255,255,255);
ellipse(228,289,10,10);

fill(255,255,255);
ellipse(353,300,10,10);
strokeWeight(2);
  stroke(0);
line(216,236,251,270);  
line(312,274,351,250);

fill(mouseX,150,mouseY,150);
triangle(201, 74, 281, 216, 358, 76);

  
if(mousePressed){


float a=random(250); 
float b=random(255); 
float c=random(150); 


stroke(mouseX,100,mouseY,100);
fill(constrain(mouseX,mouseY,a),b,c); 
strokeWeight(13); 
ellipse(pmouseX,pmouseY,60,60); 


}
}
void mouseDragged() 
{
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}
void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}
void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  println(e);
}


void keyPressed(){ 
setup(); 


  
}



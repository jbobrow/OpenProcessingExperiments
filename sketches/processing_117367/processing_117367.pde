
float angle;
  float angle0;

void setup() {
  size(800,600);
  background(255);

 angle=0;
 angle0=.2;
 
}
void draw() {
  
 
 //rotate(angle0);
 
 stroke(mouseX,mouseY,100,random(155));
 
  pushMatrix();
  translate(width/2,height/2);

  
  for(int i=0; i<=2000; i+=50){
      rotate(angle-i);
  
  line(i,0,mouseX,mouseY);
  
  }
  
  popMatrix();
 

angle+=PI/30;
 }

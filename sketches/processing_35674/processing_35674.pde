
void setup() {	
  size(300, 300);
  background(87,86,129);
  frameRate(35);
}	

int x = 15;

void draw(){
  //volcano
  fill(129,105,86);
  quad(50, 300, 135, 150, 165, 150,250,300);
  //smoke
  noFill();
  stroke(0);
 ellipse(mouseX,mouseY, x,x);
 //lava
 stroke(227,58,11);
 line(mouseX,mouseY,150,150);
 }
//lava partical
void mousePressed(){
  fill(255,0,0);
  ellipse(mouseX,mouseY,10,10);
  
 }
 
void mouseReleased(){
  stroke(255,0,0);		
  line(mouseX,mouseY,150,150);	
   }	
 
 





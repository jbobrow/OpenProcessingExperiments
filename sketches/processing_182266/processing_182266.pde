
float angolo;
float due;
float tre;


void setup() 
{
size (800,600);
background (255);
angolo = 0;  
due = 0;  
tre= 0;
}
void draw()
{
rectMode(CENTER);
background(255);
pushMatrix();
translate(width/2,height/2);
rotate(angolo);
  stroke(0,255,0);
  fill (0,255,0);
  rect(0,0,50,200);
  angolo = angolo + PI/44;
  popMatrix();
  
  pushMatrix();
  translate(200,200);
  rotate(due);
  stroke(255,0,0);
  fill(255,0,0);
  ellipse (0,0,70,170);
  due = due + PI/200; 
  popMatrix();
  
   pushMatrix();
  translate(600,380);
  rotate(tre);
  stroke(0,0,255);
  fill(0,0,255);
  ellipse (0,0,100,170);
  tre+= PI/100;
  popMatrix();
  

}

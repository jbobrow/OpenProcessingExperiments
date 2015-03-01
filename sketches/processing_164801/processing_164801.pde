
int counter;
void setup(){
  size(600,400);
  background(0,0,0);
  counter=0;
}

void draw()
{
  fill(0,0,0,30);
  rect(0,0,600,400);
  counter=counter+1;
  if(counter>15) counter=0;
  if(mouseButton==RIGHT){
  stroke(mouseX,(255),random(100,255));
     rect(mouseX,mouseY,random(-20,20),random(-20,20));
  }
  stroke(mouseX,(255),random(100,255));
  if(!mousePressed){
       stroke(255,255,255);
  triangle(mouseX,mouseY,50,0,0,50);
  triangle(mouseX,mouseY,550,400,600,350);
  triangle(mouseX,mouseY,550,0,600,50);
  triangle(mouseX,mouseY,50,400,0,350);
  rect(mouseX,mouseY,random(-20,20),random(-20,20));
  }

}

void mouseDragged(){
  if(counter==10){
    if(mouseButton==LEFT){
    stroke(mouseX,random(100,255),(255));
    noFill();
    ellipse(mouseX+random(-20,20),mouseY+random(-20,20),80,80);
    ellipse(mouseX+random(-30,15),mouseY+random(-15,15),50,50);
    ellipse(mouseX+random(30,18),mouseY+random(-20,12),30,30);}}

}

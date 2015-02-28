
int a=30;
void setup(){
size(500,500);
noCursor();

 
}

void draw(){
  background(0,0,250);
  strokeWeight(5);
  fill(250,250,0);
ellipse(mouseX,mouseY,width*0.35,height*0.35);
fill(0);
ellipse(mouseX-30,mouseY-20,a,a);
ellipse(mouseX+30,mouseY-20,a,a);
noFill();
arc(mouseX,mouseY,120,120,0,PI);
}




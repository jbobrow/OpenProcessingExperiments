
void setup(){
size (500,500);
}
void draw(){
if (mousePressed == true){
    rect(0,0,600,600);
  ellipse(pmouseX,pmouseY,200,200);
  ellipse(mouseX+50,mouseY-20,30,30);
  ellipse(mouseX-50,mouseY-20,30,30);
  arc(mouseX,mouseY+50,60,30,0,PI);
    }
   else {
     rect(0,0,600,600);
  ellipse(mouseX,mouseY,200,200);
  ellipse(mouseX+50,mouseY-20,30,30);
  ellipse(mouseX-50,mouseY-20,30,30);
  arc(mouseX,mouseY+50,60,30,PI,TWO_PI);}
}

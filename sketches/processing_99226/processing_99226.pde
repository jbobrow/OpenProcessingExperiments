
void setup(){
size (600,600);
background (255);
}
void draw (){
 stroke(0,60);
 noFill();
bezier(200,200,mouseX,mouseY,mouseX,mouseY,400,300);
}


void setup (){
size (400,400);
smooth ();
}
 
void draw (){
if(mousePressed){
triangle (mouseX,mouseY,mouseX+10,mouseY-25,mouseX+20,mouseY);
}
else{


rect (mouseX,mouseY,20,20);
}
}

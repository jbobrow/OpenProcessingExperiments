
void  setup(){
size (600,600);
}
void draw(){
background(255);
rectMode(CENTER);
fill(0);
rect(width/2, height/2, 150, 150);
itsHere = wheresMouse(mouseX,mouseY,150,450);
if  (itsHere == true) {
background(0,255,0);
fill(0);
rect(width/2, height/2, 300, 300);
}else{
background(255);
fill(0);
rect(width/2, height/2, 300, 300);
}
}
boolean itsHere = false;

boolean wheresMouse(mouseX, mouseY, float min, float max){
if (mouseX > min && mouseX < max && mouseY > min && mouseY < max){
   return true;
}else{
   return false;
}
}

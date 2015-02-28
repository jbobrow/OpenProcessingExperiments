
int x =20;
int click =0;

void setup() {

  size(700, 400);
  background(255);
  //fill( 251,0,0,80);
}
void draw() {

  
  if (mouseX < 700) {
    fill(251,0,80); 
    rect(mouseY,mouseX,x,x);
  }
 // if (mouseX>233 && mouseX<466){
    //fill(0);
  //}
 //if (mouseX>466 && mouseX<700){
   //fill(251,102,0);
//}
 if (mouseY <700){
  ellipse(mouseX,mouseY,x,x);
}
}




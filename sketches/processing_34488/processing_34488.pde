
int x =10;
int click =0;

void setup() {

  size(700, 400);
  background(255);
  //fill( 251,0,0,80);
}
void draw() {
  
  rect (0,0,700,400);
  fill(255, 5);


 // fill(255)
  
  if (mouseX < 700) {
    //fill(251,0,80); 
  }
  //if (mouseX>233 && mouseX<466){
    //fill(0);
 // }
 // if (mouseX>466 && mouseX<700){
   // fill(251,102,0);
  //}
 
  ellipse(mouseX,mouseY,x,x);
 
}




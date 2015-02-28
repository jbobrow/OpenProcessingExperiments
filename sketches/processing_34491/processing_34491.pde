
//int x =10;
//int click =0;
float rotation =0;
float spin = 0;

void setup() {

  size(700, 400);
  background(255);
  //fill( 251,0,0,80);
  stroke (100,103,254);
  strokeWeight(4);
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
 
  //ellipse(mouseX,mouseY,x,x);
  rotation = 0;
  //background(0);
  //pushMatrix();
  translate(mouseX, mouseY);
  rotate(radians(spin));
  spin = spin +1;
  
  while(rotation<360){
    //pushMatrix();
    
    rotate (radians(rotation));
    line (0,0,100,100);
    rotation = rotation+10;
    line (0,0,100,100);
    
    rotation = rotation+20;
  }
 
}




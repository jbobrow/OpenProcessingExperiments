
//Lillie Ferris
//liferris
//October 2012

float x, y, wd, ht, diam, gamestate, fill; 
//int value = 225;

void setup (){
  size (600, 600); 
  background(255);
  smooth();
  diam = 50;
  wd = width;
  ht = height;
  noStroke();
  fill(20);

}

void draw (){
  background(255);
  x = diam+5;
  
  while(x < width){
    
    y = diam+5;
  
    while (y < height){
      if (dist(x, y, mouseX, mouseY) < diam*.5){
        fill(255);
      }else { 
        fill(225);
      }
    
     ellipse(x,y, diam, diam);
     
     y += diam+5;
    }
    x+=diam+5;
  }
} //ending draw
  
  //  ellipse(x, 100, diam, diam);
//  ellipse(x, 160, diam, diam);
//  ellipse(x, 220, diam, diam);
//  ellipse(x, 280, diam, diam);
//  ellipse(x, 340, diam, diam);
//  ellipse(x, 400, diam, diam);
//  ellipse(x, 460, diam, diam);
//  ellipse(x, 520, diam, diam);
// 
//  void dissapear (){
//    if (mousePressed){
//      fill = 255;
//    }else{
//      fill(225);
//    }
    
  
//void mouseMoved() {
//  value = value + 5;
//  if (value > 255) {
//    value = 0;
//  }
//}
  
// void mouseMoved(){
// frameRate (10);
// if (value <= 225){
//   value = 255;
// }}

//void whiteOut(){
////for(float 500); 
//
//  if(mousePressed && dist(x, y, mouseX, mouseY) < .5*diam ){
//    fill(255);
//    
// }else{
//  fill (225); } 
//  

  /*
  while(y < 500){
  noStroke(); 
  y = y + 60;
  ellipse(x, y, diam, diam);
  float y = 10;
  ellipse(x, y, diam, diam);
*/
 // }



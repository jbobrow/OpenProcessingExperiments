
void setup() {
  size (800, 600);
  background (214,6,6, 10);
  smooth();
  //noStroke();
  
}
  
void draw () {
  
  for (int i = 30; i < 800; i = i+8) {
  for (int j = 0; j < 800; j = j+5) {
    point(i, j);
  } 
  }  
    
//  fill(150,8);
//  rect(30,150,width/2,height/2);
  
  
//  for (int i = 0; i < 800; i++){
  //   rect(i,i,mouseX,mouseY);
   
  // }
 
 mouseClicked ();
   fill (mouseX, mouseY, 80);
   ellipse (mouseX, mouseY,50, 200);
  
  
}

  
  


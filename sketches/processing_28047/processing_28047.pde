
/* Mut – Angst, Laura Dreßler, HTW Berlin */
 
int x = 500;
int y = 500;
  
void setup() {
 size(500, 500);
 smooth();
background(0);

}
 
void draw() {
if(mousePressed){
   noStroke();  
   fill(200,20);
   ellipse(mouseX, 450, 30, 30);

  }
  
  else{
   stroke(1); 
   fill(255);
   ellipse(mouseX, mouseY, 60, 60);
  }


}


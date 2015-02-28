
boolean show_grid = false; 
int bg = 100; // my grid of 8 cols

float theta, c;

void setup() {
  size(800, 800);
  background(0);
  //noFill();
  //frameRate(1);
  
  theta=PI/width/2;
  colorMode(HSB);
  
  
} 

void draw() {
  
  //background(0);
  
  if(show_grid) {  //this is for the toggle on mouse press to show grid
    stroke(255, 255, 0);
 
      while (bg < width) {
      line(0+bg, 0, bg, height);
      bg = bg + 100;
      } 
   } 

  fill(c, 255, 255);
  noStroke();
  theta++;
  rect(bg*(int)random(8), bg*(int)random(8), bg*(int)random(8), bg*(int)random(8));
  c = (sin(theta*.001)*255) % 255;

}


void mousePressed() {
  
  show_grid = !show_grid; //not sure why I can't toggle this and t pauses everything? 
  
}

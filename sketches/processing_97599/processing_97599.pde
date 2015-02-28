
// This Program will create my first and last name 
// with these functions, so it's just really simple,
// not too really hard to do.
int tinto = 0;
void setup(){
  size(1275, 350); // manipulates the size of the screen
  background(0); // sets the background color to black
}
void draw(){
  draw_name(tinto);
 if(tinto < 255){
  tinto = tinto + 1; 
 }
}
void draw_name(int colorname){
  // J Symbol of Jerry 
  fill(0,colorname ,0);
  rect(50, 50, 150, 50);
  rect(100, 105, 50, 150);
  rect(20, 210, 75, 45);
  // E Symbol of Jerry 
  fill(0, colorname, 0);
  rect(200, 105, 50, 150);
  rect(255, 105, 50, 35);
  rect(255, 160, 50, 35);
  rect(255, 220, 50, 35); 
  // R Symbol of Jerry 
  fill(0, colorname, 0);
  rect(325, 105, 50, 150);
  rect(380, 105, 50, 35);
  // R Symbol #2 of Jerry 
  fill(0, colorname, 0);
  rect(450, 105, 50, 150);
  rect(505, 105, 50, 35);
  // Y Symbol of Jerry 
  fill(0 ,colorname, 0);
  rect(565, 105, 50, 75);
  rect(620, 145, 80, 35);
  rect(705, 105, 50, 75);
  rect(635, 185, 50, 75);
  // A Symbol of Au
  fill(0, 0, colorname);
  rect(775, 105, 50, 150);
  rect(775, 50, 200, 50);
  rect(925, 105, 50, 150);
  rect(833, 150, 85, 50);
  // U Symbol of Au
  fill(0, 0, colorname);
  rect(1005, 105, 50, 150);
  rect(1060, 205, 100, 50);
  rect(1165, 105, 50, 150);
}



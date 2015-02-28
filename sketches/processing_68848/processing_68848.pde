
void setup(){
size(300, 300);
background(178, 255, 112);
}

void draw (){
  noStroke();
  /* hoodie */
  fill(177, 191, 180);
  ellipse(150,110,180,215);
  
  fill(177, 191, 180);
  ellipse(150, 282, 200, 180);
  
  fill(190, 206, 193);
  ellipse(140, 232, 76, 93);
  ellipse(160, 232, 76, 93);
  
  fill(217, 237, 221);
  rect(110, 210, 5, 100);
  rect(186, 210, 5, 100);
 
  fill(203, 217, 206);
  ellipse(120, 212, 65, 45);
  ellipse(180, 212, 65, 45);
  
  /* neck */
  fill(225, 197, 132);
  triangle(121, 210, 179, 210, 150, 282);
  
  /* head base */
  fill(239, 216, 162);
  ellipse(150, 120, 160, 195);
  
  /* cheeks */
  fill(249, 223, 163);
  ellipse(98, 146, 45, 45);
  ellipse(203, 146, 45, 45);
  
  /* mouth */
  fill(181, 127, 108);
  ellipse(150, 179, 33, 7);
  
  /* eyes base */
  fill(255, 239, 200);
  ellipse(110, 110, 45, 32);
  ellipse(185, 110, 45, 32);
  
  /* pupils */
  fill(96, 84, 72);
  ellipse(110, 112, 20, 20);
  ellipse(185, 112, 20, 20);
  
  fill(239, 216, 162);
  ellipse(110, 95, 55, 32);
  fill(239, 216, 162);
  ellipse(185, 95, 55, 32);
  
  /* eye brow right */
  fill(118, 89, 60);
  ellipse(185, 93, 45, 32);
  fill(239, 216, 162);
  ellipse(185, 96, 52, 28);
  
  /* hair fringe */
  fill(118, 89, 60);
  ellipse(148, 50, 113, 70);
  triangle(50, 115, 100, 39, 154, 80);
  triangle(112, 107, 155, 24, 214, 63);
  triangle(149, 106, 174, 18, 218, 63);
  
}

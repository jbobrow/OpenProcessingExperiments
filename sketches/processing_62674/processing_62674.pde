
void setup()
{
  size(640, 480);
  background(203, 198, 166);
  smooth();
  noStroke();
  
   fill(140, 143, 128); //two gray bars
   rect(110, 0, 50, 380);
   rect(275, 0, 50, 225);
   
   fill(125, 123, 104);
   rect(360, 0, 60, 65); //short dark gray top
   
   fill(40, 68, 141); // short purple top
   rect(330, 0, 50, 30);
   
   fill(169, 137, 78); // dark yellow quad top
   quad(420, 0, 490, 0, 495, 50, 420, 25);
   
   fill(213, 219, 214); // white quad lower
   quad(330, 285, 370, 285, 520, 405, 490, 415);
   
   fill(185, 57, 55); //red behind tri
   quad(390, 245, 435, 260, 440, 285, 415, 285);
   fill(3, 115, 81); //green behind tri
   quad(394, 270, 439, 285, 444, 310, 401, 310);
   
   
   
   
   fill(202, 211, 216); // flag next to bar white
   quad(160, 20, 240, 100, 240, 180, 160, 150);
   fill(185, 57, 55); //red
   quad(160, 100, 240, 155, 240, 195, 160, 150);
   fill(5, 90, 154); //blue
   quad(160, 150, 240, 195, 240, 230, 160, 200);
   
   fill(40, 75, 49); //2nd flag green
   quad(280, 150, 300, 170, 300, 270, 280, 260);
   fill(202, 211, 216); //2nd flag white
   quad(300, 170, 320, 185, 320, 280, 300, 270);
   fill(185, 57, 55); //2nd flag red
   quad(320, 185, 340, 200, 340, 290, 320, 280);
   
   
   
  
  fill(239, 183, 48); // bottom yellow
  triangle(300, 480, 640, 400, 640, 480);
  
  fill(113, 128, 171); // purple rect
  rect(510, 320, 180, 40);
  
  fill(3, 115, 81); // right green triangle
  triangle(520, 280, 560, 300, 540, 350);
  
   fill(185, 57, 55); // right red triangle
   triangle(450, 250, 490, 270, 470, 320);

   fill(202, 211, 216); // right white triangle
   triangle(380, 230, 425, 263, 400, 310);
   
   fill(0); // right black tri upper
   triangle(380, 320, 430, 350, 400, 400);
   
   fill(0); // right black tri lowest
   triangle(430, 430, 475, 460, 450, 510);
   
   fill(3, 115, 81); // right green tri lower
   triangle(370, 400, 410, 425, 390, 470);
  
   fill(202, 211, 216); // right white tri lower
   triangle(290, 370, 330, 395, 310, 440);
   
   fill(185, 57, 55); // left red tri lower
   triangle(210, 345, 250, 370, 230, 415);
      
   fill(0); // left black tri lower
   triangle(100, 330, 140, 355, 120, 400);
       
   fill(202, 211, 216); // left white tri lower
   triangle(30, 300, 70, 325, 50, 370);
   
   fill(202, 211, 216); // left white tri lowest
   triangle(50, 400, 90, 425, 70, 470);

   fill(0); // left black tri lowest
   triangle(125, 420, 165, 445, 145, 490);
   
   fill(3, 115, 81); // left green tri lowest
   triangle(210, 440, 250, 465, 230, 510);
   
   fill(202, 211, 216); // left white tri higher
   triangle(155, 240, 195, 265, 175, 320);
   
   fill(3, 115, 81); // left green tri higher
   triangle(230, 265, 270, 290, 250, 340);
   
   fill(202, 211, 216); // left white tri higher
   triangle(310, 290, 350, 315, 330, 365);
   
   
   fill(219, 109, 49); // orange W
   quad(480, 0, 505, 0, 540, 140, 530, 180);
   quad(555, 0, 580, 0, 530, 180, 515, 125);
   
   quad(550, 0, 575, 0, 610, 140, 600, 220);
   quad(625, 0, 650, 0, 600, 200, 585, 125);
   
   fill(185, 57, 55); //red right upper corner
   rect(615, 0, 25, 30);
   
   fill(207, 67, 51); //red right slant tri
   triangle(580, 240, 630, 240, 550, 300);
   fill(37, 123, 160); //light blue right slant tri
   triangle(640, 270, 640, 290, 550, 300);
   
   
   
   fill(187, 45, 51); // upper left corner
   rect(10, 0, 75, 155);
   fill(202, 211, 216);
   triangle(50, 0, 70, 0, 60, 50);
   triangle(0, 50, 80, 90, 0, 90);
   triangle(0, 80, 80, 160, 0, 160);
   

   fill(75, 33, 36); // brown cross bar
   quad(0, 40, 490, 100, 490, 120, 0, 60);
   
   fill(77, 142, 191); // blue cross bar
   quad(120, 0, 135, 0, 60, 480, 45, 480);
   
   
   
   
   
}
   


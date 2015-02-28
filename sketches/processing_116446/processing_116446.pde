
int rect1;
int rect2;
int x;
int y; 
//setting up my integers 

void setup() {
  size(600, 300);
  
  
}
void draw() {
  noStroke();
  fill(0);
  background(255);
  
//backgrond white
  
 
  
 
   ellipse(width/2, height/2, 350, 350); 


  rect1 = width/2; //'rect' refers to the ellipse shape-- 
                   //never changed the name when I changed the shape
  rect2 = height/2;
  x = mouseX;
  y = mouseY; //set x and y to the location of the mouse 
  stroke(0);  //stroke = black 
  strokeWeight(3);
 
  
  //row one-- lines from left to right (mostly) 
  line(20,0, 20, 60);
  line(45,40, 45, 100); 
  line (45,100, 20, 100);
  line (0,80, 20, 80); 
 
  line (25, 100, 25, 200); 
  
  line (45,100, 45, 250); 
  
  line (10, 250, 10, 200);
  line (10, 220, 25, 220);
  
  
  line (45, 220, 45, 250); 
  line (25, 100, 25, 280);
  
  //row two-- lines from left the right (mostly) 
  
  line(60,0, 60, 60);
  line(70,100, 70, 80);
  
  line (45, 50, 70, 50); 
  
  line(85,40, 85, 100); 
  line (85,100, 68, 100); 
  
 
  line (65, 100, 65, 250); 
  line (65, 100, 65, 300);
  
 
  
  //row three

  line(115,20, 115, 200); 
  line (135,100, 80, 100); 
  
  line (85, 50, 120, 50); 
  
   line (105, 100, 105, 250); 
  line (125, 100, 125, 300);
  line (0,80, 150, 80); 
  
  //******************************************
  
  
  //inside the ellipse 
  stroke(255);  //stroke color  now white 
    
    //row one-- from left to right (mostly)
  line(155,0, 155, 60);
  line(175,40, 175, 100); 
  line (175,100, 150, 100);
  line (0,80, 150, 80); 
 
  line (155, 100, 155, 200); 
  
  line (175,100, 175, 250); 
  
  line (200, 250, 200, 200);
  line (200, 220, 195, 220);
  
  
  line (155, 220, 155, 250); 
  line (155, 100, 155, 280);
  
  //row two-- fom left to right (mostly) 
  
  line(190,0, 190, 60);
  line(200,100, 200, 80);
  
  line (155, 50, 210, 50); 
  
  line(225,40, 225, 100); 
  line( 225,100, 200, 100); 
  
 
  line (215, 100, 215, 350); 
  line (65, 100, 65, 300);
  
  //row three (from left to right (mostly) 

  line(245,20, 245, 50); 
  line (265,100, 211, 100); 
  
 //row four from left to right (mostly) 
  
  
 
  line(295,0, 295, 70);
  line(315,0, 315, 50);
  
  line(355, 100, 355, 15);
  line(385, 0, 385, 80); 
   
  line (235,100, 390, 100);
 
 line (390,100,390, 500); 
 
  line (285, 100, 285, 200); 
  
  line (325,100, 325, 250); 
  
  line (390, 100, 500, 100);
  
  line(390, 78, 500, 78); 
  
  
  //*************************************
// To the right of the ellipse 
  stroke(0); //stroke black again 
  
  //row one 
  line(455,0, 455, 60);
 
  line (390,100,390, 500); 
  
 
  line (455, 100, 455, 200); 
  
  line (475,100, 475, 250); 
  
  line (500, 250, 500, 200);
  line (500, 220, 495, 220);
  
  
  line (455, 220, 455, 250); 
  line (455, 100, 455, 280);
  
  //row two
  
  line(490,0, 490, 60);
  line(500,100, 500, 80);
  
  line (455, 50, 510, 50); 
  
  line(525,40, 525, 100); 
 
  line(525,100, 525, 300); 
 
  
  
 
  line (515, 100, 515, 350); 
  line (465, 100, 465, 300);
  
   line(565,100, 565, 50);
   line(400,220,600,220); 
  
  line(585, 200, 585, 0);
  
  
  
  //row three

  line(545,20, 545, 50); 
  line (565,100, 511, 100); 
   line (390,100,390, 500); 
   
   
   //*****************************************
   
   if (dist(rect1, rect2, x, y)>175) { //fill the ellipse black
    fill(255);                         //if the distance from
                                        //the center points (width/2, height/2)
                                        //is greater than 175 pixels 
    noStroke(); 
   ellipse(width/2, height/2, 350, 350); 

   } 
  
  
    
  

  
}

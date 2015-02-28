
/*
Sam Wood
CSE 1341
Lab 2
9/15/10
*/

void setup(){
  size(425, 400);
  background(255);
  stroke(0);
  smooth();
  

// creating gradient background
  float c1 = 100;
  float c2 = 100;
  float c3 = 100;
  float c4 = 197;
  float c5 = 173;
  float c6 = 203;
  
  color dark = color(c1, c2, c3);
  color light = color(c4, c5, c6);
  
  float x1 = 0;
  float y1 = 0;
  float x2 = width;
  float y2 = 0;
  
  for(int i=0; i<height; i+=1) {
    stroke(c1, c2, c3);
    strokeWeight(1);
    line(x1, y1, x2, y2);
    y1++;
    y2++;
    c1+=0.19;
    c2+=0.15;
    c3+=0.20;
    
  }
  
  // creating leaves in background
   strokeWeight(5);
   x1 = 30;
   y1 = 400;
   x2 = 95;
   y2 = 300;
   c1 = 227;
   c2 = 252;
   c3 = 184;
   c4 = 50;
   stroke(c1, c2, c3, c4);
   
   for(int i=0; i<10; i++) {
     line(x1, y1, x2, y2);
     x1+=-2;
     x2+=-2;
   }
   
   x1 = 300;
   y1 = 400;
   x2 = 475;
   y2 = 150;
   c4 = 30;
   stroke(c1, c2, c3, c4);
   
   for(int i=0; i<20; i++) {
     line(x1, y1, x2, y2);
     x1+=-2;
     x2+=-2;  
   }
    
   x1 = 380;
   y1 = 400;
   x2 = 240;
   y2 = 100;
   c1 = 183;
   c2 = 224;
   c3 = 113;
   c4 = 20;
   
   stroke(c1, c2, c3, c4);
   
   for(int i=0; i<12; i++) {
     line(x1, y1, x2, y2);
     x1+=-2;
     x2+=-2;
   }
   
   x1 = 240;
   y1 = 96;
   x2 = 150;
   y2 = 0;
   
   for(int i=0; i<12;i++) {
     line(x1, y1, x2, y2);
     x1+=-2;
     x2+=-2;
   }
   
   x1 = 175;
   y1 = 400;
   x2 = 300;
   y2 = 225;
   c1 = 128;
   c2 = 173;
   c3 = 52;
   c4 = 50;
   
   stroke(c1, c2, c3, c4);
   
   for(int i=0; i<12; i++) {   
     line(x1, y1, x2, y2);
     x1+=2;
     x2+=2;
   }
   
   x1 = 300;
   y1 = 223;
   x2 = 425;
   y2 = 155;
     
   for(int i=0; i<12; i++) {
     line(x1, y1, x2, y2);
     x1+=2;
     x2+=2;
   }
 
   strokeWeight(1);
   
  // creating leaf that caterpillar is on

  fill(91, 152, 28);
   noStroke();
   quad(30, 400, 280, 155, 300, 155, 165, 400);
   
   stroke(169, 240, 94);
   strokeWeight(3);
   curve(300, 275, 90, 400, 290, 155, 300, 275);
   
   strokeWeight(2);
      
  // creating body of caterpillar 
    x1 = 100;
    y1 = 250;
    x2 = 130;
    y2 = 220;
    float x3 = 170;
    float y3 = 260;
    float x4 = 140;
    float y4 = 290;
    
  
   for(int i=0; i<4; i++) { 
     stroke(0);
     fill(237, 240, 90);
     quad(x1, y1, x2, y2, x3, y3, x4, y4);
     x1+=30;
     y1+=-30;
     x2+=30;
     y2+=-30;
     x3+=30;
     y3+=-30;
     x4+=30;
     y4+=-30;
   }
   
   x1 = 110;
   y1 = 240;
   x2 = 120;
   y2 = 230;
   x3 = 160;
   y3 = 270;
   x4 = 150;
   y4 = 280;
  
   for(int i=0; i<4; i++) {
     fill(0);
     quad(x1, y1, x2, y2, x3, y3, x4, y4);
     x1+=30;
     y1+=-30;
     x2+=30;
     y2+=-30;
     x3+=30;
     y3+=-30;
     x4+=30;
     y4+=-30;
     
   }
   
   fill(237, 240, 90);
   // bottom-left segments of caterpillar
   quad(80, 280, 100, 250, 140, 290, 125, 305);
   quad(80, 315, 80, 280, 125, 305, 120, 315);
   quad(110, 340, 80, 315, 120, 315, 123, 320);
   
   //top-right segments of caterpillar
   ellipse(325, 155, 40, 40);
   quad(220, 130, 255, 110, 270, 165, 260, 170);
   quad(255, 110, 295, 103, 275, 162, 270, 165);
   quad(295, 103, 340, 115, 295, 162, 275, 162);
   quad(340, 115, 345, 155, 298, 162, 295, 162);
   
   fill(0);
   // bottom-left stripes of caterpillar
   quad(89, 269, 95, 259, 135, 294, 130, 298);
   quad(80, 305, 80, 295, 124, 308, 122, 312);
   quad(100, 331, 90, 323, 120, 315, 123, 320);
   
   // top-right stripes of caterpillar
   quad(230, 125, 240, 120, 270, 165, 263, 169);
   quad(267, 108, 277, 106, 275, 162, 270, 165);
   quad(308, 106, 320, 110, 295, 162, 285, 162);
   quad(342, 130, 343, 140, 310, 161, 307, 160);
   quad(344, 159, 342, 164, 310, 161, 307, 160);
   
   // feet of caterpillar
   x1 = 145;
   y1 = 285;
   x2 = 160;
   y2 = 270;
   x3 = 165;
   y3 = 285;
     
   for(int i=0; i<4; i++) {
     stroke(0);
     fill(0);
     triangle(x1, y1, x2, y2, x3, y3);
     x1+=30;
     y1+=-30;
     x2+=30;
     y2+=-30;
     x3+=30;
     y3+=-30;
   }
   
   x1 = 157;
   y1 = 281;
       
   for(int i=0; i<4; i++) {
     noStroke();
     fill(175, 175, 175);
     ellipse(x1, y1, 7, 7);
     x1+=30;
     y1+=-30; 
   }
   // creating antenna of caterpillar
   noFill();
   stroke(0);
   strokeWeight(2);
   curve(80, 265, 80, 302, 35, 310, 35, 265);
   arc(335, 182, 90, 90, TWO_PI-PI/2, TWO_PI);
   arc(390, 182, 20, 20, PI/2, PI);
   arc(340, 178, 90, 90, TWO_PI-PI/2, TWO_PI);
   arc(395, 178, 20, 20, PI/2, PI);
   
  }



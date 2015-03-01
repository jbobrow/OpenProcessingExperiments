
int i = 0;
int j = 0;
int k = 0;
int l = 0;
float x;
float z;
float t;
float y;
float u;
boolean wake = false;
boolean sleep = true;
int value1 = 0;
int value2 = 0;
int value3 = 0;
int value4 = 0;
int value5 = 0;
int value6 = 0;
int value7 = 0;
int value8 = 0;


void setup(){
     size (750, 500);     
     frameRate(4);
}
    

void draw(){
  
  //cel
     fill(value1, value2, value3);
     stroke(0);
     rect(0, 0, 750, 500);
     
  //terra
    fill(value4, value5, value6);
    noStroke();
    ellipse(248, 464, 700, 300);
    ellipse(567, 427, 700, 300);
    
  //botó sol
    fill(246, 216, 75);
    ellipse(728, 478, 30, 30);
     
  //botó lluna
     fill(188, 187, 184);
     arc(18, 478, 30, 30, 0, PI+QUARTER_PI);
     
  //pota esquerra
     stroke(0);
     strokeWeight(1);
     fill(50);
     beginShape();
     vertex(357, 395);
     vertex(358, 412);
     vertex(351, 422);
     vertex(349, 433);
     vertex(363, 438);
     vertex(377, 432);
     vertex(376, 422);
     vertex(372, 417);
     vertex(372, 395);
     endShape();
     
  //pota dreta
     beginShape();
     vertex(386, 393);
     vertex(388, 415);
     vertex(383, 423);
     vertex(383, 432);
     vertex(391, 436);
     vertex(402, 435);
     vertex(408, 426);
     vertex(402, 415);
     vertex(400, 393);
     endShape();
     
  //cos
     noStroke();
     fill(0);
     ellipse(315, 317, 52, 52);
     ellipse(311, 360, 52, 52);
     ellipse(337, 376, 52, 52);
     ellipse(343, 294, 42, 42);
     ellipse(378, 290, 57, 57);
     ellipse(412, 300, 52, 52);
     ellipse(430, 335, 57, 57);
     ellipse(433, 370, 52, 52);
     ellipse(397, 380, 42, 42);
     ellipse(359, 384, 42, 42);
     ellipse(343, 327, 52, 52);
     
     fill(255);
     ellipse(315, 317, 50, 50);
     ellipse(311, 360, 50, 50);
     ellipse(337, 376, 50, 50);
     ellipse(343, 294, 40, 40);
     ellipse(378, 290, 55, 55);
     ellipse(412, 300, 50, 50);
     ellipse(430, 335, 55, 55);
     ellipse(433, 370, 50, 50);
     ellipse(397, 380, 40, 40);
     ellipse(359, 384, 40, 40);
     ellipse(343, 327, 50, 50);
     
  //cabell
     fill(0);
     ellipse(364, 290, 23, 23);
     ellipse(381, 280, 28, 28);
     ellipse(397, 290, 23, 23);
     fill(255);
     ellipse(364, 290, 20, 20);
     ellipse(381, 280, 25, 25);
     ellipse(397, 290, 20, 20);
     
  //orella esquerra
     stroke(0);
     strokeWeight(1);
     fill(50);
     beginShape();
     vertex(358, 301);
     vertex(346, 303);
     vertex(331, 307);
     vertex(317, 317);
     vertex(309, 328);
     vertex(308, 336);
     vertex(312, 342);
     vertex(326, 340);
     vertex(339, 331);
     vertex(357, 312);
     endShape();
     
     strokeWeight(0.5);
     line(351, 311, 339, 312);
     line(339, 312, 327, 320);
     line(327, 320, 316, 327);
     line(316, 327, 310, 336);
     
  //orella dreta
     strokeWeight(1);
     beginShape();
     vertex(394, 301);
     vertex(416, 303);
     vertex(430, 307);
     vertex(445, 317);
     vertex(451, 328);
     vertex(452, 334);
     vertex(448, 338);
     vertex(435, 337);
     vertex(420, 330);
     vertex(399, 313);
     endShape();
     
     strokeWeight(0.5);
     line(400, 307, 412, 308);
     line(412, 308, 429, 313);
     line(429, 313, 443, 324);
     line(443, 324, 448, 329);
     
  //cara
     strokeWeight(1);
     stroke (0);
     fill(50);
     
     beginShape();
     curveVertex(381, 290);
     curveVertex(382, 291);
     curveVertex(388, 292);
     curveVertex(401, 302);
     curveVertex(407, 319);
     curveVertex(411, 358);
     curveVertex(399, 380);
     curveVertex(377, 386);
     curveVertex(358, 381);
     curveVertex(344, 358);
     curveVertex(352, 319);
     curveVertex(358, 302);
     curveVertex(373, 292);
     curveVertex(379, 291);
     curveVertex(381, 290);
     endShape();
     
  //nas
     noFill();
     ellipse(364, 373, 5, 5);
     ellipse(392, 373, 5, 5);
     
  //mur
     fill(159, 124, 69);
     rect(0, 373, 750, 20);
     rect(0, 414, 750, 20);
     rect(152, 353, 20, 100);
     rect(585, 353, 20, 100);
     
     fill(0);
     strokeWeight(0.3);
     line(178, 386, 206, 383);
     line(206, 383, 268, 378);
     line(268, 378, 550, 380); 
     
          
     line(190, 426, 297, 419);
     line(297, 419, 346, 419);
     
     line(424, 428, 472, 421);
     line(472, 421, 507, 419);
     line(507, 419, 537, 419);
     
     line(166, 361, 167, 441);
     
     line(0, 429, 145, 429);
     
     line(601, 361, 599, 445);
     
  //ulls tancats
     fill(50, 50, 50, value8);
     strokeWeight(1);
     arc(364, 335, 12, 8, 0, PI, OPEN);
     arc(391, 335, 12, 8, 0, PI, OPEN);
     
  //ulls oberts
     fill(255, 255, 255, value7);
     stroke(0, 0, 0, value7);
     strokeWeight(1);
     ellipse(364, 335, 20, 20);
     ellipse(391, 335, 20, 20);
     fill(0, 0, 0, value7);
     ellipse(364, 335, 5, 5);
     ellipse(391, 335, 5, 5);
     noFill();
     stroke(0, 0, 0, value7);
     arc(364, 345, 20, 8, 0, PI, OPEN);
     arc(391, 345, 20, 8, 0, PI, OPEN);
     
  //sol
     fill(253, 242, 189, value7);
     noStroke();
     ellipse(55, 55, 80, 80);
     
    //nit
    
    fill(255);
    
    if (mouseX<35 && mouseY>465) {
      sleep = true;
      wake = false;
    }
   
    if (sleep == true) {
      j = 0;
      while(j < height ){
         i = 0;
         while(i < width ){
           fill (255, 255, 255, t);
           t = random(255);
           x = random(-560, 250);
           z = random(-70, 180);
           
           beginShape();
           vertex(566+x, 74+z);
           vertex(568+x, 68+z);
           vertex(570+x, 74+z);
           vertex(576+x, 76+z);
           vertex(570+x, 78+z);
           vertex(568+x, 84+z);
           vertex(566+x, 78+z);
           vertex(560+x, 76+z);
           vertex(566+x, 74+z);
           endShape();
        
           value1 = 10;
           value2 = 15;
           value3 = 33;
           value4 = 46;
           value5 = 54;
           value6 = 20;
           value7 = 0;
           value8 = 255;
       
           i = i + 40;
        
         }
        j = j + 100;
      }     
   
     //zzz
   
       l = 0;
       while(l < height && wake == false) {
         k = 0;
         while(k < width && wake == false) {
         
           stroke (20);
         
           y = random (0, 74);
           u = random(-30, 0);
            
           strokeWeight(2);
           
           line(423+y, 352+u, 433+y, 352+u);
           line(433+y, 352+u, 423+y, 363+u);
           line(423+y, 363+u, 433+y, 363+u);
        
           line(424+y, 358+u, 432+y, 358+u);
        
           k = k + 300;
        
         }
            l = l + 300;
       } 
    }
     
     //dia
     if (mouseX >711 && mouseY >465) {
       wake = true; 
       sleep = false;
       
     }
     if (wake = true && mouseX >711 && mouseY >465){
       
       value1 = 134;
       value2 = 194;
       value3 = 255;
       value4 = 87;
       value5 = 114;
       value6 = 0;
       value7 = 255;
       value8 = 0;
       
     }
     
}



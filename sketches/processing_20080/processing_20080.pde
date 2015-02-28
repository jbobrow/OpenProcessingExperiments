
//Lindsay Laven's seccond assignment

    float x;
float y;
float directionX;
float directionY;


void setup(){
  size(600,600);
   background(76, 18, 160);
   smooth();
  
  x = 433;
  y = 419;
  directionX = 2;
  directionY = 1;



  //eyebrow left
   strokeWeight(4);
   line(222, 98, 200, 179);
   line(222, 98, 274, 176);
   
    //eyebrow right
   line(420, 86, 400, 169);
   line(420, 86, 490, 168);
   
   //NOSE
   strokeWeight(4);
   line(317, 335, 335, 362);
   line(335, 362, 355, 337); 
   
    //eyelashes left
    strokeWeight(3);
    line(218, 222, 218, 206);
    line(235, 218, 235, 207);
    line(252, 218, 252, 207);
    line(264, 221, 264, 204);
    line(209, 226, 205, 209);
    line(204, 230, 172, 230);
    line(172, 230, 206, 247);
    
    //eyelashes right
    line(415, 223, 415, 205);
   line(429, 218, 429, 205);
    line(439, 217, 439, 208);
   line(448, 218, 448, 206);
   line(458, 220, 458, 206);
   line(467, 222, 467, 209);
   
   strokeWeight(8);
  line(447, 230, 511, 215);
   line(511, 215, 482, 240);
   line(480, 231, 497, 226);
   line(447, 227, 489, 226);
   line(482, 238, 470, 258);
   line(484, 243, 484, 251);
   line(203, 244, 183, 233);
   line(201, 235, 195, 233);
   line(198, 235, 189, 234);
   line(203, 248, 211, 262);
   line(202, 249, 195, 253);
   
   //top lip
   stroke(229, 16, 48);
   line(277, 439, 297, 397);
   line(297, 397, 331, 430);
   line(355, 429, 366, 396);
   line(366, 396, 411, 443);
   line(300, 407, 291, 434);
   line(293, 417, 286, 435);
   line(306, 410, 298, 435);
  line(310, 412, 306, 433);
  line(316, 417,313, 431); 
  line(320, 425, 322, 433);
  line(369, 403, 361, 431);
  line(373, 408, 369, 432);
  line(378, 412, 376, 434);  
  line(383, 415, 383, 433);
  line(389, 421, 391, 436);
  line(394, 427, 398, 438);
  
 
  
   
   
   noStroke();
   
   
   //eye left
   ellipse(240, 236, 80, 40);
   fill(3, 3, 3);
  ellipse(241, 243, 10, 10);
   
   
   //eye right
   fill(255, 252, 252);
   ellipse(440, 236, 80, 40);
    fill(3, 3, 3);
    ellipse(453, 237, 10, 10);
    
    //eyeshadow left
    fill(19, 104, 211);
    triangle(276, 206, 230, 143, 200, 206);
    
    //eyeshadow right
      fill(19, 104, 211);
    triangle(491, 206, 437, 141, 413, 206);
    
    //mouth
    fill(229, 16, 48);
    ellipse(339, 458, 200, 60);
    
    //beauty mark
    fill(3, 3, 3);
    ellipse(433, 419, 10, 10);
    
}

void draw(){

    ellipse(x, y, 3, 3);
    x += directionX;
    y += directionY;
    //bottom wall
    if(y > height){
      directionY = -1;
    }
    //top wall
    if(y < 0){
    directionY = 1;
    
}
//right wall
if(x > width){
  directionX = -2;
}
//left wall
if(x < 0){
  directionX = 2;
}
}
    
  






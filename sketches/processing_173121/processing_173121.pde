
int blocksize = 10;
void setup(){
     size (800, 450);
     
}

void draw(){
  background( 93, 153, 230); 
    println (mouseX + "," + mouseY);
    frameRate(10);
    int j = 0;
     while(j < height ){
     int i = 0;
     while(i < width ){
        stroke(255);
        fill (random(255), random(200));
        ellipse(random(800), random(450), blocksize, blocksize);
        
        i = i + 50;
      }
      j = j + 50;
     }     
  
  //ninot de neu part de adalt
  stroke(0);
  fill(255);
  ellipse(146, 181, 130, 130);
  
  //ulls
  stroke(0);
  fill(0);
  ellipse( 122, 155, 10, 10);
  ellipse( 167, 154, 10, 10);
  
  //boca
  stroke(0);
  fill(0);
  arc(140, 199, 50, 30, 0, PI+QUARTER_PI, OPEN);
  
  //barret
  stroke(0);
  fill(random(100));
  rect(71, 112, 150, 10);
  rect(120, 40, 50, 80);
  
  //nas
  stroke(0);
  fill(246, 128, 10);
  triangle(142, 167, 143, 182, 198, 174);
  line(149, 168, 149, 173);
  line(156, 169, 156, 173);
  line(166, 170, 166, 175);
  
  //ninot de neu part de abaix
  stroke(0);
  fill(255);
  ellipse(151, 340, 240, 220);
  //botons
  stroke(0);
  fill(random(255), random(30), random(100));
  ellipse(152, 266, 25, 25);
  ellipse(155, 304, 25, 25);
  ellipse(158, 339, 25, 25);
  
  //braços ninot
  stroke(0);
  line(70, 272, 101, 334);
  line(101, 334, 93, 343);
  line(101, 334, 105, 346);
  line(101, 334, 115, 337);
  line(219, 276, 288, 298);
  line (288, 298, 301, 291);
  line(288, 298, 300, 303);
  line(288, 298, 296, 311);
  
  //escoba
  stroke(0);
  fill(153, 76, 0);
  rect(290, 232, 5, 200);
  stroke(153, 76, 0);
  line(290, 232, 258, 193);
  line(290, 232, 291, 180);
  line(290, 232, 331, 189);
  
  //neu del terra   
  stroke(0);
  fill(255);
beginShape();
curveVertex(0, 445);
curveVertex(0, 445);
curveVertex(32, 435);
curveVertex(144, 458);
curveVertex(244, 429);
curveVertex(355, 449);
curveVertex(491, 432);
curveVertex(541, 449);
curveVertex(647, 433);
curveVertex(700, 460);
curveVertex(700, 460);
endShape();  

 //Arbre de nadal
 
 //tronc
 stroke(0);
 fill(153, 76, 0);
 rect(685, 397, 44, 54);
 //part de dalt
 stroke(255);
 fill(0, 102, 0);
 triangle(702, 245, 610, 398, 797, 398);
 triangle(702, 141, 634, 330, 768, 330);
 triangle(702, 87, 649, 258, 756, 258);
 //boles
 stroke(255);
 fill(random(255), random(100), random(0));
 ellipse(676, 227, 5, 5);
 ellipse(691, 275, 5, 5);
 ellipse(657, 307, 5, 5);
 ellipse(695, 309, 5, 5);
 ellipse(729, 270, 5, 5); 
 ellipse(674, 287, 5, 5);
 ellipse(662, 262, 5, 5);
 ellipse(712, 290, 5, 5);
 ellipse(731, 310, 5, 5);
 ellipse(749, 291, 5, 5);
 ellipse(698, 204, 5, 5);
 ellipse(676, 227, 5, 5);
 ellipse(699, 238, 5, 5);
 ellipse(732, 218, 5, 5);
 ellipse(720, 183, 5, 5);
 ellipse(685, 172, 5, 5);
 ellipse(708, 143, 5, 5);
 ellipse(727, 245, 5, 5);
 ellipse(658, 344, 5, 5);
 ellipse(638, 378, 5, 5);
 ellipse(661, 367, 5, 5);
 ellipse(683, 346, 5, 5);
 ellipse(696, 362, 5, 5);
 ellipse(683, 282, 5, 5);
 ellipse(722, 345, 5, 5);
 ellipse(723, 379, 5, 5);
 ellipse(757, 363, 5, 5);
 ellipse(778, 384, 5, 5);
 
}




PImage bg; 

float easing1 = 0.7; //easing1
float easing2 = 0.4; //easing2
float x, y, s; 
float x2, y2;



void setup()  {
  size(640, 480);
  smooth();
  
  bg = loadImage("babybg.png"); 
cursor(ARROW);
  }
  
  
   
  
  
  void draw() {
    
  

  
    
    
   background(255); 
   image(bg, 0, 0); 
   
   
   //eyeball easing
   float targetX = mouseX; //easing
   float targetY =mouseY;
   x = x + (targetX - x) * easing1;
   y = y + (targetY - y) * easing1;
   
   //eyeball easing
   float targetX2 = mouseX; //easing
   float targetY2 =mouseY;
   x2 = x + (targetX - x) * easing2;
   y2 = y + (targetY - y) * easing2;
   
 
 
 
 

  
 //baby 
   if(y< 250) {
   
    
    
   fill(131,113,94);
   ellipse(x, mouseY-30, 170, 170); 
     
   fill(245,210,146); //face
   noStroke();
   ellipse(x, mouseY-20, 170, 170);
   
   noFill();
   strokeWeight(2);
   stroke(185,163,120);
   arc(x+20, mouseY-55, 80, 50, TWO_PI- HALF_PI, TWO_PI);
   
    noFill();
   strokeWeight(2);
   stroke(185,163,120);
   arc(x-20, mouseY-55, 80, 50, PI, TWO_PI - HALF_PI);
     
   fill(227,198,144); // right eye
   noStroke();
   ellipse(x+30, mouseY-35, 50, 70);
   
    fill(255); //right eyeball
   ellipse(x2+30, mouseY-25, 35 , 50);
   
    fill(170,151,115);
   ellipse(x2+30, mouseY-16, 25,35); //right pupil
  
   fill(227,198,144); //left eye
    noStroke();
   ellipse(x-30, mouseY-35, 50, 70);
   
    fill(255); //left eyeball
   ellipse(x2-30, mouseY-25, 35, 50);
   
    fill(170,151,115);      
   ellipse(x2-30, mouseY-16, 25,35); //left pupil
   
   fill(255, 255, 255);
   ellipse(x2-25, mouseY-25, 6,6); //left glare
   
    fill(255, 255, 255);
   ellipse(x2+25, mouseY-25, 6,6); //right glare
   
   fill(252,161,185,95);
  strokeWeight(1);
 stroke(193,169,119);
  ellipse(x-1, mouseY+25, 30, 25); 
   
   fill(192,183,245,90);
   strokeWeight(3);
   stroke(134,130,152);
   ellipse(x+55, mouseY+90, 20, 20);
   line(x+55, mouseY+100, mouseX+58, y+156);
   noFill();
   ellipse(mouseX+57, mouseY+160, 10, 10);
   
   strokeWeight(1.5);
   fill(115,201,232,98);
   rect(x+70, mouseY+120, 20, 50);
   
   fill(255);
   rect(x+72, mouseY+113, 15, 7); 
   
   
   fill(232,245,148);
   rect(x+70, mouseY+130, 20, 15); 
   
   strokeWeight(1.2);
    stroke(134,130,152); 
    fill(164,173,203);
     arc(x, mouseY-95, 70, 30, HALF_PI, PI);
    arc(x, mouseY-95, 70, 30, HALF_PI-TWO_PI, HALF_PI);
    
    arc(x, mouseY-105, 80, 50, PI, TWO_PI - HALF_PI);
    arc(x-1, mouseY-105, 80, 50, TWO_PI- HALF_PI, TWO_PI);
    
   
   
  } 

// nervous emotion (bottom)
   if (y > 400) {
   fill(131,113,94);
   ellipse(x, mouseY-30, 170, 170); 
     
    fill(252,219,156); //face
   noStroke();
   ellipse(x, mouseY-20, 170, 170);
  
  
    fill(227,198,144); //right eye
   noStroke();
   ellipse(x+30+random(-1,1), mouseY-35+random(-1,1), 50, 70);
   
    fill(255); //right eyeball
   ellipse(x2+30+random(-1,1), mouseY-25+random(-1,1), 35,50);
   
    fill(170,151,115);
   ellipse(x2+30+random(-1,1), mouseY-16+random(-1,1), 25,35); //right pupil
  
   fill(227,198,144); //left eye
    noStroke();
   ellipse(x-30+random(-1,1), mouseY-35+random(-1,1), 50, 70);
   
    fill(255); //left eyeball
   ellipse(x2-30+random(-1,1), mouseY-25+random(-1,1), 35,50);
   
    fill(170,151,115);      
   ellipse(x2-30+random(-1,1), mouseY-16+random(-1,1), 25, 35); //left pupil
   
   fill(252,219,156); //right cover
   ellipse(x-35, mouseY-50, 60, 50);
   
    fill(252,219,156); //left cover
   ellipse(x+35, mouseY-50, 60, 50);
   
    fill(255, 255, 255);
   ellipse(x2-25, mouseY-25, 6,6); //left glare
   
    fill(255, 255, 255);
   ellipse(x2+25, mouseY-25, 6,6); //right glare
   
   
   
   fill(141,159,188,95); //tear shadows
 noStroke();
 ellipse(x-20, mouseY+5, 10, 20);  
 ellipse(x-25, mouseY+10, 5, 10); 
 ellipse(x+20, mouseY+5, 10, 20);  
 ellipse(x+25, mouseY+10, 5, 10); 
   
   fill(75,142,247);//tears
   noStroke();
 ellipse(x+15, mouseY+2, 10, 20);  
 ellipse(x+25, mouseY+5, 5, 10); 
 ellipse(x-15, mouseY+2, 10, 20);  
 ellipse(x-25, mouseY+5, 5, 10); 
 
 fill(252,161,185,95);
  strokeWeight(1);
 stroke(193,169,119);
  ellipse(x-1, mouseY+25, 30, 25); 
  
  fill(192,183,245,90);
   strokeWeight(3);
   stroke(134,130,152);
   ellipse(x+55, mouseY+90, 20, 20);
   line(x+55, mouseY+100, mouseX+58, y+156);
   
    fill(192,183,245,90);
   strokeWeight(3);
   stroke(134,130,152);
   ellipse(x+55, mouseY+90, 20, 20);
   line(x+55, mouseY+100, mouseX+58, y+156);
   noFill();
   ellipse(mouseX+57, mouseY+160, 10, 10);
   
   strokeWeight(1.5);
   fill(115,201,232,98);
   rect(x+70, mouseY+120, 20, 50);
   
   fill(255);
   rect(x+72, mouseY+113, 15, 7); 
   
   
   fill(232,245,148);
   rect(x+70, mouseY+130, 20, 15);
   
   strokeWeight(1.2);
    stroke(134,130,152); 
    fill(164,173,203);
     arc(x, mouseY-95, 70, 30, HALF_PI, PI);
    arc(x, mouseY-95, 70, 30, HALF_PI-TWO_PI, HALF_PI);
    
    arc(x, mouseY-105, 80, 50, PI, TWO_PI - HALF_PI);
    arc(x-1, mouseY-105, 80, 50, TWO_PI- HALF_PI, TWO_PI);
  } 
  
// nervous emotion II
if ((y > 240) && (y< 395)) { 
  
  fill(131,113,94);
   ellipse(x, mouseY-30, 170, 170); 
   fill(252,219,156); //face
   noStroke();
   ellipse(x, mouseY-20, 170, 170);
 
    
    fill(227,198,144); //right eye
   noStroke();
   ellipse(x+30+random(-1,1), mouseY-35+random(-1,1), 50, 70);
   
    fill(255); //right eyeball
   ellipse(x2+30+random(-1,1), mouseY-25+random(-1,1), 35,50);
   
    fill(170,151,115);
   ellipse(x2+30+random(-1,1), mouseY-16+random(-1,1), 25,35); //right pupil
  
   fill(227,198,144); //left eye
    noStroke();
   ellipse(x-30+random(-1,1), mouseY-35+random(-1,1), 50, 70);
   
    fill(255); //left eyeball
   ellipse(x2-30+random(-1,1), mouseY-25+random(-1,1), 35,50);
   
    fill(170,151,115);      
   ellipse(x2-30+random(-1,1), mouseY-16+random(-1,1), 25, 35); //left pupil
   
   fill(252,219,156); //right cover
   ellipse(x-35, mouseY-65, 45, 50);
   
    fill(252,219,156); //left cover
   ellipse(x+35, mouseY-65, 45, 50);
   
    fill(255, 255, 255);
   ellipse(x2-25, mouseY-25, 6,6); //left glare
   
    fill(255, 255, 255);
   ellipse(x2+25, mouseY-25, 6,6); //right glare
   
   noFill();
   strokeWeight(2);
   stroke(196,180,150);
   arc(x+55, mouseY-70, 70, 20, HALF_PI, PI);
   
   noFill();
   strokeWeight(2);
   stroke(196,180,150);
   arc(x-55, mouseY-70, 70, 20, TWO_PI - TWO_PI, HALF_PI);
   
   
   fill(252,161,185,95);
  strokeWeight(1);
 stroke(193,169,119);
  ellipse(x-1, mouseY+25, 30, 25); 
  
  fill(252,161,185,65);
  noStroke();
  ellipse(x-45, mouseY+20, 40, 25);
  
   fill(252,161,185,65);
  noStroke();
  ellipse(x+45, mouseY+20, 40, 25);
  
  fill(192,183,245,90);
   strokeWeight(3);
   stroke(134,130,152);
   ellipse(x+55, mouseY+90, 20, 20);
   line(x+55, mouseY+100, mouseX+58, y+156);
   
    fill(192,183,245,90);
   strokeWeight(3);
   stroke(134,130,152);
   ellipse(x+55, mouseY+90, 20, 20);
   line(x+55, mouseY+100, mouseX+58, y+156);
   noFill();
   ellipse(mouseX+57, mouseY+160, 10, 10);
   
   strokeWeight(1.5);
   fill(115,201,232,98);
   rect(x+70, mouseY+120, 20, 50);
   
   fill(255);
   rect(x+72, mouseY+113, 15, 7); 
   
   
   fill(232,245,148);
   rect(x+70, mouseY+130, 20, 15);
   
   strokeWeight(1.2);
    stroke(134,130,152); 
    fill(164,173,203);
     arc(x, mouseY-95, 70, 30, HALF_PI, PI);
    arc(x, mouseY-95, 70, 30, HALF_PI-TWO_PI, HALF_PI);
    
    arc(x, mouseY-105, 80, 50, PI, TWO_PI - HALF_PI);
    arc(x-1, mouseY-105, 80, 50, TWO_PI- HALF_PI, TWO_PI);
    } 
    
    
    
   
   int r = mouseY-5;
    
    s = map(mouseX, 0, width, 0.1, 10);
 bubble (mouseX, mouseY+r, s); 
    
 }

  



void bubble (int x, int y, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  noStroke();
  fill(188,211,227);
  ellipse(0,-35, 50, 50); //bubble
  fill(255);
  ellipse(13, -50, 5, 5); //bubble glare
  popMatrix();
}

  if ((y > 250) && (y< 400)) { 
 
   b
   
   
    } 


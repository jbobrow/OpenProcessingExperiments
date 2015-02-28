
int h = 160;
float angle = 0.0;
float speed = 0.05;

void setup(){
  int [] x = {75, 225, 375, 525};
  size (600, 300);
  background (255);
  smooth();

  
  for( int i=0; i<600; i+=20){
    stroke (random(77,245), random(200,245), random(20,60), 100);
    strokeWeight (random(20,100));
    line(i,0, i,300);
  } 
  frameRate(80);
// lollipop sticks
 fill (247, 231, 170);
     stroke (70);
      strokeJoin(ROUND);
       strokeWeight (3);
        rect (x[0], h, 8, h);
        strokeWeight (2);
        rect (x[1], h-40, 6, h+30);
        strokeWeight (3.5);
        rect (x[2], h+30, 10, h);
        strokeWeight(2.5);
        rect (x[3], h, 7, h);
}

void draw (){
// lollipop candy #1
angle += speed;
   if (mousePressed) {
    if ((mouseX <= 135) && (mouseX >= 15)){
      //black outline
      stroke (70);
      strokeWeight(3); 
      noFill();
      smooth();
      ellipse (75, 100, 130, 130);    
    //pink  
    strokeWeight (12);
    stroke (252, 130, 169);
    float a = 75+ cos(angle)*60;
    float b = 100 + sin(angle)*60;
    point (a,b);
    //red
    strokeWeight (11);
    stroke (227, 50, 56);
    float a1 = 75+ cos(angle)*48;
    float b1 = 100 + sin(angle)*48;
    point (a1,b1);
   //orange
    strokeWeight (10);
    stroke (240, 143, 39);
    float a2 = 75+ cos(angle)*37;
    float b2 = 100 + sin(angle)*37;
    point (a2,b2);
    //yellow
    strokeWeight (10);
    stroke (252, 245, 102);
    float a3 = 75+ cos(angle)*27;
    float b3 = 100 + sin(angle)*27;
    point (a3,b3);
   // green
    strokeWeight (10);
    stroke (148, 211, 64);
    float a4 = 75+ cos(angle)*17;
    float b4 = 100 + sin(angle)*17;
    point (a4,b4);
   //baby blue
    strokeWeight (12);
    stroke (73, 217, 234);
    float a5 = 75+ cos(angle)*7;
    float b5 = 100 + sin(angle)*7;
    point (a5,b5);
    }
  }
//lollipop #2  
   if (mousePressed) {
    if ((mouseX <= 285) && (mouseX >= 165)){
      //black outline
      stroke (100);
      strokeWeight(1); 
      noFill();
      smooth();
      ellipse (225, 70, 114, 114);    
    //dark blue
    stroke (33, 56, 129);
    strokeWeight (15);
    float a = 225+ cos(angle)*50;
    float b = 70 + sin(angle)*50;
    point (a,b);
    //lighter blue
    stroke (62, 131, 198);
    strokeWeight (14);    
    float a1 = 225+ cos(angle)*35;
    float b1 = 70 + sin(angle)*35;
    point (a1,b1);
   //very light blue
    strokeWeight (11);
    stroke (149, 191, 155);
    float a2 = 225+ cos(angle)*22;
    float b2 = 70 + sin(angle)*22;
    point (a2,b2);
    //light yellow
    strokeWeight (10);
    stroke (252, 252, 145);
    float a3 = 225+ cos(angle)*11;
    float b3 = 70 + sin(angle)*11;
    point (a3,b3);
  //pinkish
   strokeWeight (6);
    stroke (229, 133, 130);
    float a5 = 225+ cos(angle)*4;
    float b5 = 70 + sin(angle)*4;
    point (a5,b5);
    }
  } 
 // lollipop candy #3
angle += speed;
   if (mousePressed) {
    if ((mouseX <= 450) && (mouseX >= 300)){
      //black outline
      stroke (70);
      strokeWeight(3); 
      noFill();
      smooth();
      ellipse (375, 115, 155, 155);    
    //teal 
    strokeWeight (17);
    stroke (20,147, 137);
    float a = 375+ cos(angle)*70;
    float b = 115 + sin(angle)*70;
    point (a,b);
    //white
    strokeWeight (6);
    stroke (255);
    float a8 = 375 + cos(angle)*60;
    float b8= 115+sin(angle)*60;
    point (a8,b8);
    //magenta
    strokeWeight (15);
    stroke (223,53, 130);
    float a1 = 375+ cos(angle)*50;
    float b1 = 115 + sin(angle)*50;
    point (a1,b1);
   //orange
    strokeWeight (10);
    stroke (242, 171, 39);
    float a2 = 375+ cos(angle)*37;
    float b2 = 115 + sin(angle)*37;
    point (a2,b2);
    //yellow
    strokeWeight (10);
    stroke (245, 220, 96);
    float a3 = 375+ cos(angle)*27;
    float b3 = 115 + sin(angle)*27;
    point (a3,b3);
   // green
    strokeWeight (10);
    stroke (183, 234, 66);
    float a4 = 375+ cos(angle)*17;
    float b4 = 115 + sin(angle)*17;
    point (a4,b4);
   //baby blue
    strokeWeight (12);
    stroke (239, 245, 173);
    float a5 = 375+ cos(angle)*7;
    float b5 = 115 + sin(angle)*7;
    point (a5,b5);
    }
  } 
  //lollipop #4
angle += speed;
   if (mousePressed) {
    if ((mouseX <= 585) && (mouseX >= 465)){
      //black outline
      stroke (70);
      strokeWeight(3); 
      noFill();
      smooth();
      ellipse (525, 97, 130, 130);    
    //red
    strokeWeight (12);
    stroke (227, 50, 56);
    float a = 525+ cos(angle)*60;
    float b = 97 + sin(angle)*60;
    point (a,b);
    //orange
    strokeWeight (11);
    stroke (240, 143, 39);
    float a1 = 525+ cos(angle)*48;
    float b1 = 97 + sin(angle)*48;
    point (a1,b1);
   //yellow
    strokeWeight (10);
    stroke (247, 255, 44);
    float a2 = 525+ cos(angle)*37;
    float b2 = 97 + sin(angle)*37;
    point (a2,b2);
    //green
    strokeWeight (10);
    stroke (49, 160, 42);
    float a3 = 525+ cos(angle)*27;
    float b3 = 97 + sin(angle)*27;
    point (a3,b3);
   // blue
    strokeWeight (12);
    stroke (43, 90, 196);
    float a4 = 525+ cos(angle)*17;
    float b4 = 97 + sin(angle)*17;
    point (a4,b4);
   //orange
    strokeWeight (7);
    stroke (240, 143, 39);
    float a5 = 525+ cos(angle)*7;
    float b5 = 97 + sin(angle)*7;
    point (a5,b5);
    //yellow
    strokeWeight (4);
    stroke (247, 255, 44);
    float a6 = 525+ cos(angle)*4;
    float b6 = 97 + sin(angle)*4;
    point (a6,b6);
    }
  }
}


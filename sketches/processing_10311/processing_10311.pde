
float x = 300;
float y = 300;
float x2 = 300;
float y2 = 300;
float easing = 0.1; 

float angle = 0;
float speed = 0.5;
float radius = 4;

// SETUP-----------------------------------------
void setup() {
  size(640,480);
  background(0);
  smooth();
}
  
// DRAW------------------------------------------
void draw() {
  float mx = constrain(mouseX, 245, 277);
  float my = constrain(mouseY, 280, 310); 
  
    angle += speed;
    float sinval = sin(angle);
    float yoffset = sinval * radius;
 
  // spot remover-------------------
  fill(0);
  ellipse(310,280,30,30);
  
  // small eye----------------------
  colorMode(HSB,360,100,100);
  fill(53.33,11.69,30.2);
  stroke(0);
  ellipse(355.5,305.5,95.334,94.666);
  
  // second set small eye-----------
  fill(81.82,7.28,59.22);
  noStroke();
  ellipse(358,303.5,90,89);
  
  // big eye------------------------
  fill(53.33,11.69,30.2);
  stroke(0);
  ellipse(262,299,108.5,108);
  
  // second set big eye-------------
  fill(81.82,7.28,59.22);
  noStroke();
  ellipse(259,294,99.5,95);
  
  // third set BOTH eyes------------
  fill(50.77,12.62,80.78);
  noStroke();
  ellipse(363,301,70,71);
  ellipse(257,292,87,84.5);
  
  // fourth set BOTH eyes-----------
  fill(57.14,8.9,92.55);
  noStroke();
  ellipse(363,298,47.5,52);
  ellipse(258,287.5,65.5,68.5);
  
  // iris---------------------------
  x += (mx - x) * easing;
  y += (my - y) * easing; 
  
  fill(53.33,11.69,30.2);
  stroke(0);
  ellipse(x,y+yoffset,58,59);
  
  // second layer iris--------------
  fill(81.82,7.28,59.22);
  noStroke();
  ellipse(x,y+yoffset,51,53);
  
  // third layer iris---------------
  fill(198.8,40,87.06);
  noStroke();
  ellipse(x,y+yoffset,43,47);
  
  // pupil--------------------------
  fill(53.33,11.69,30.2);
  ellipse(x,y,18,19);
  stroke(0);
  ellipse(x,y+yoffset,15,16);
  
  // glare--------------------------
  fill(194.6,0,100);
  noStroke();
  ellipse(x+6,y-3+yoffset,9,9);
  
  float mx2 = constrain(mouseX, 360, 375);
  float my2 = constrain(mouseY, 290, 305);
  
  
  // small iris---------------------
  
  x2 += (mx2 - x2) * easing;
  y2 += (my2 - y2) * easing; 
  
  fill(53.33,11.69,30.2);
  stroke(0);
  ellipse(x2,y2,45.5,49);
  
  // second layer small iris--------
  fill(81.82,7.28,59.22);
  noStroke();
  ellipse(x2,y2,36,42.667);
  
  // small pupil--------------------
  fill(53.33,11.69,30.2);
  ellipse(x2,y2,15,16);
  stroke(0);
  ellipse(x2,y2,11,12);
  
  // small eye glare----------------
  fill(194.6,0,100);
  noStroke();
  ellipse(x2-25,y2-13,15,17);
  ellipse(x2-17,y2-7,9,9);
 
  // gone---------------------------
  if(mousePressed) {
    background(0);
  }
  
  // blackness----------------------
  if(keyPressed) {
    fill(0);
    ellipse(x,y+yoffset,43,47);
    ellipse(x2,y2,11,12);
  }
}


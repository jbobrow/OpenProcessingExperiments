
float mx = 425;
float my = 200;
float bulge = 0;
float leftdist;
float rightdist;
float fillr;
float fillg;
float fillb;


void setup() {
  size(640,480);


}

void draw() {

      
  background(0);

  smooth();
  noStroke();
  //eye color
     if(mousePressed) {
    fillr = 255;
    fillg = 210;
    fillb = 0;
  }
  else{
  fillr = mouseX/5;
  fillg = 255;
  fillb = mouseY/2; 
  }
  
  
  fill(fillr,fillg,fillb);
  
  pushMatrix();
  translate(215,200);
  rotate(PI/8);
  ellipse(0,0,95,70);
  popMatrix();
  
  fill(fillr,fillg,fillb);
  pushMatrix();
  translate(425,200);
  rotate(-PI/8);
  ellipse(0,0,95,70);
  popMatrix();


  //pupil movement
  float targetx = constrain(mouseX, 405, 445);
  float targety = constrain(mouseY, 195,205);
  float easing = 0.15;
  mx = mx + (targetx-mx)*easing;
  my = my + (targety-my)*easing;

  fill(0);
  smooth();

  if((mousePressed) && (bulge <= 10)) {
    bulge += 1;
  }
  else{
    if(bulge > 0){
      bulge -= 1;
    }
  }
  leftdist = dist(mouseX, mouseY, mx-210,my);
  rightdist = dist(mouseX,mouseY, mx, my);
  if((rightdist < 50) || (leftdist < 50 )){
    if(bulge > -10){
      bulge -= 1;
    }
  }
  else{
    if(bulge < 0){
      bulge += 1;
    }
  }

  arc(mx,my,25 + bulge,54 + bulge,-PI/2+1,3*PI/2);
  arc(mx-210,my,25 + bulge,54 + bulge,-PI/2+1,3*PI/2);



}




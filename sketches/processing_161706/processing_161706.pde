
/*****************************************
* Assignment <<< 3 >>>
* Name:         <<< Nate Mayer >>>
* Course:       CSC 103 - Creative Computing - Fall 2014
* Submitted:    <<< September 16th, 2014 >>>
* 
* <<< Ferris Wheel >>>
*
***********************************************/
int ferrisRadius = 100;
float carAngle = 0;
int ferrisCenterX = 350;
int ferrisCenterY = 230;
float wave = 6300;
float waveTrans = 5; //wave translucency
int skyRed = 20; //sunset sky fade
float sunX = 150;
float sunY = -50;
int dark = -100;

void setup(){
  size(1000, 500);
  
}
  
void draw(){
  background(31, 160, 111);
  
  fill(198, 159, 16);//sand
  noStroke();
  ellipse(-3000, 375, 6250, 6200);
  
  noFill();//sand
  stroke(0, 15);
  strokeWeight(10);
  ellipse(-3000, 375, 6240, 6200);
  
  noFill();//waves
  stroke(255, waveTrans);
  strokeWeight(4);
  ellipse(-3000, 375, wave, 6200);
  waveTrans = waveTrans + 1;
  if(wave <= 6253) waveTrans = 4;
  wave = wave - .35;
  if(wave <= 6252) wave = wave + 48;
  
  
  fill(250);//sky
  noStroke();
  rect(0, 0, 1000, 220);
  
  
  fill(skyRed, 118, 232, 10);//sky
  rect(0, 0, 1000, 220);
  rect(0, 0, 1000, 220);
  rect(0, 0, 1000, 220);
  rect(0, 0, 1000, 220);
  rect(0, 0, 1000, 213);
  rect(0, 0, 1000, 203);
  rect(0, 0, 1000, 193);
  rect(0, 0, 1000, 183);
  rect(0, 0, 1000, 173);
  rect(0, 0, 1000, 163);
  rect(0, 0, 1000, 153);
  rect(0, 0, 1000, 143);
  rect(0, 0, 1000, 133);
  rect(0, 0, 1000, 123);
  rect(0, 0, 1000, 113);
  rect(0, 0, 1000, 103);
  rect(0, 0, 1000, 93);
  rect(0, 0, 1000, 83);
  rect(0, 0, 1000, 73);
  rect(0, 0, 1000, 63);
  rect(0, 0, 1000, 53);
  if(sunX <= 384) skyRed = skyRed + 1;
  if(sunX >= 565) skyRed = skyRed - 1;
  
  
  
  fill(255, 255, 0);// sun
  noStroke();
  ellipse(sunX, sunY, 100, 100);
  sunX = sunX + 1;
  sunY = sunY + 1;
  if(sunY >= 600) sunY = sunY - 650;
  if(sunX >= 800) sunX = sunX - 650;
  
  fill(31, 160, 111); //water
  noStroke();
  rect(320, 220, 680, 280);

  
  fill(80);//freis wheel frame
  strokeWeight(1);
  pushMatrix();
  translate(ferrisCenterX, ferrisCenterY);
  rotate(radians(carAngle + 22.5));
  star(0, 0, 5, 101, 8); 
  popMatrix();
  
  stroke(80);//ferris wheel frame
  strokeWeight(2);
  noFill();
  ellipse(ferrisCenterX, ferrisCenterY, 200, 200);
  
  

  car(ferrisCenterX + (cos(radians(carAngle)) * ferrisRadius), ferrisCenterY + ferrisRadius * (sin(radians(carAngle))));//cars
  car(ferrisCenterX + (cos(radians((carAngle) + 45)) * ferrisRadius), ferrisCenterY + ferrisRadius * (sin(radians((carAngle) + 45))));
  car(ferrisCenterX + (cos(radians((carAngle) + 90)) * ferrisRadius), ferrisCenterY + ferrisRadius * (sin(radians((carAngle) + 90))));
  car(ferrisCenterX + (cos(radians((carAngle) + 135)) * ferrisRadius), ferrisCenterY + ferrisRadius * (sin(radians((carAngle) + 135))));
  car(ferrisCenterX + (cos(radians((carAngle) + 180)) * ferrisRadius), ferrisCenterY + ferrisRadius * (sin(radians((carAngle) + 180))));
  car(ferrisCenterX + (cos(radians((carAngle) + 225)) * ferrisRadius), ferrisCenterY + ferrisRadius * (sin(radians((carAngle) + 225))));
  car(ferrisCenterX + (cos(radians((carAngle) + 270)) * ferrisRadius), ferrisCenterY + ferrisRadius * (sin(radians((carAngle) + 270))));
  car(ferrisCenterX + (cos(radians((carAngle) + 315)) * ferrisRadius), ferrisCenterY + ferrisRadius * (sin(radians((carAngle) + 315))));
  carAngle = carAngle + .5;
  if (carAngle >= 360) carAngle = carAngle - 360;
  
  stroke(80);//ferris wheel frame
  fill(75);
  strokeWeight(3);
  triangle(ferrisCenterX + 30, ferrisCenterY + 120, ferrisCenterX - 30, ferrisCenterY + 120, ferrisCenterX, ferrisCenterY);  
 
  
  noStroke();//pillars
  fill(124, 79, 12);
  rect(0, 350, 450, 15);
  rect(50, 365, 10, 40);
  rect(100, 365, 10, 40);
  rect(150, 365, 10, 40);
  rect(200, 365, 10, 40);
  rect(250, 365, 10, 40);
  rect(300, 365, 10, 40);
  rect(350, 365, 10, 40);
  rect(400, 365, 10, 40);
  
  
  fill(0, dark);//darkness
  noStroke();
  rect(0, 0, 1000, 500);
  if(sunX <= 339) dark = dark + 1;
  if(sunX >= 610) dark = dark - 1;
  println(skyRed);
}

 

void car(float x, float  y){
  
  createShape();
  fill(220, 40, 40);
  noStroke();
  
  arc(x, y, 40, 40, radians(0), radians (180));
  triangle(x - 23, y - 3, x + 23, y - 3, x, y - 13);
  
  fill(95, 81, 31);
  rect(x - 16, y - 3, 2, 3);
  rect(x - 7, y - 3, 2, 3);
  rect(x + 6, y - 3, 2, 3);
  rect(x + 15, y - 3, 2, 3);
  endShape();
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);  
}



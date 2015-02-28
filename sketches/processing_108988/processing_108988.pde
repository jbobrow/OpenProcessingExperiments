
float r1 =0;
float r2 =0;
float r3 =0;
float r4 =0;
float r5 =0;

void setup(){
  size(700,500);
  rectMode(CENTER);
}

void draw(){
  background(255);
  noStroke();
  fill(250,110,12,150);
   r1 = r1 +1;
      r2 = r2 -2;
         r3 = r3 +3;
            r4 = r4 -4;
               r5 = r5 +50;
               float d = random(45,65);
               float d2 = random(45,65);
               float d3 = random(45,65);
               float d4 = random(45,65);
               float d5 = random(45,65);
  pushMatrix();
  translate(110,height/2);
  rotate(radians(++r1));
  rect(0,0,d,d);
  popMatrix();
  
  pushMatrix();
  translate(220,height/2);
  rotate(radians(++r2));
  rect(0,0,d2,d2);
  popMatrix();
  
  pushMatrix();
  translate(330,height/2);
  rotate(radians(++r3));
  rect(0,0,d3,d3);
  popMatrix();
  
  pushMatrix();
  translate(440,height/2);
  rotate(radians(++r4));
  rect(0,0,d4,d4);
  popMatrix();
  
  pushMatrix();
  translate(550,height/2);
  rotate(radians(++r5));
  rect(0,0,d5,d5);
  popMatrix();
  
}

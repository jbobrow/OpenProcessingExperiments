
// homework 2

size (400, 400);
background(255);
noStroke();
rectMode( CENTER );

//face 
float x = 200;
float y = 200;

float wd = 300;
float ht = 300;

background(180,183,209);

//eyes
fill (245, 220, 200);
ellipse (x, y, wd, ht);
fill (255);
//ellipse (x-50, y-50, wd*.25, ht*.3);
//ellipse (x+50, y-50, wd*.25, ht*.3);

//tilted eyes
pushMatrix();
  translate(x-wd*.125, y-ht*.18);
  rotate( radians (30));
  stroke(0);
  strokeWeight(3);
  ellipse(0,0,wd*.25, ht*.3);
popMatrix();

pushMatrix();
  translate(x+wd*.125, y-ht*.18);
  rotate( radians (-30));
  strokeWeight(3);
  ellipse(0,0,wd*.25, ht*.3);
popMatrix();

//eyeballs
pushMatrix();
  translate(x-wd*.09, y-ht*.18);
  fill(0);
  ellipse(0,0,wd*.03, ht*.03);
popMatrix();

pushMatrix();
  translate(x+wd*.09, y-ht*.18);
  fill(0);
  ellipse(0,0,wd*.03, ht*.03);
popMatrix();


//glasses left
noFill();
strokeWeight(3);
beginShape();
  curveVertex(x-wd*.25,  y-ht*.21);
  curveVertex(x-wd*.25,  y-ht*.21);
  curveVertex(x-wd*.47,  y-ht*.32);
  curveVertex(x-wd*.54,  y-ht*.28);
  curveVertex(x-wd*.46, y-ht*.21);
  curveVertex(x-wd*.46, y-ht*.21);
endShape();

//glasses right 
noFill();
strokeWeight(3);
beginShape();
  curveVertex(x+wd*.25,  y-ht*.21);
  curveVertex(x+wd*.25,  y-ht*.21);
  curveVertex(x+wd*.47,  y-ht*.32);
  curveVertex(x+wd*.54,  y-ht*.28);
  curveVertex(x+wd*.46, y-ht*.21);
  curveVertex(x+wd*.46, y-ht*.21);
endShape();

//eyebrows
strokeWeight(1);
line(x-ht*.21, y-ht*.36, x-wd*.07, y-ht*.39);
line(x+ht*.21, y-ht*.36, x+wd*.07, y-ht*.39);


//mouths

noFill();
strokeWeight(1);
beginShape();
  curveVertex(x-wd*.08,  y+ht*.36);
  curveVertex(x-wd*.08,  y+ht*.36);
  curveVertex(x-wd*.04,  y+ht*.39);
  curveVertex(x+wd*.04,  y+ht*.39);
  curveVertex(x+wd*.08, y+ht*.36);
  curveVertex(x+wd*.08, y+ht*.36);
endShape();

//noStroke();
//fill(0);
//triangle(x-30, y+100, x+30, y+100, x, y+130);


//mustache
noStroke();
fill (180,195,200);
beginShape( );
curveVertex (x-wd*.5,y+ht*.4);
curveVertex (x-wd*.45,y+ht*0.35);
curveVertex (x-wd*.25,y+ht*0.20);
curveVertex (x-wd*.05,y+ht*.2);
curveVertex (x,y+ht*.1);
curveVertex (x+wd*.05,y+ht*.2);
curveVertex (x+wd*.25,y+ht*0.20);
curveVertex (x+wd*.45,y+ht*0.35);
curveVertex (x+wd*.5,y+ht*0.4);
endShape( );

//nose
stroke(240, 180, 70);
strokeWeight(1);
noFill();
beginShape();
curveVertex(x-wd*.055, y-ht*.035);
curveVertex(x-wd*.055, y-ht*.035);
curveVertex(x, y+ht*.025);
curveVertex(x+wd*.055, y-ht*.035);
curveVertex(x+wd*.055, y-ht*.035);
endShape();







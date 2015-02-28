
void setup(){
size(640, 480);
strokeJoin(ROUND);
}


void draw(){
  
background(134, 81, 12);
  noStroke();
smooth();

//chopsticks
pushMatrix();
translate(-500, 0);
fill(255);
quad(590, 50, 598, 50, 603, 400, 587, 400);
rotate(radians(1.5));
quad(570, 50, 578, 50, 583, 400, 567, 400);
popMatrix();

//spoon
fill(255);
pushMatrix();
translate(530, 320);
rotate(radians(-45));
ellipse(0, 0, 45, 70);  //outside white
rect(-12, 0, 25, 90);
ellipse(0, 90, 25, 30);
  scale(0.8);  //blue lining
  fill(136, 170, 224, 140);
  ellipse(0, 0, 45, 70);
  rect(-12, 0, 25, 110);
  ellipse(0, 110, 25, 30);
    scale(0.8);  //inside white
    fill(255,255,255);
    ellipse(0, 0, 45, 70);
    rect(-12, 0, 25, 160);
    ellipse(0, 110, 25, 40);
stroke(136, 170, 224, 80);
strokeWeight(9);
popMatrix();
noStroke();


//bowl
pushMatrix();
fill(255);
ellipse (316, 190, 320, 120);
fill(66, 82, 108, 70);
ellipse ( 316, 325, 140, 70);
fill(255);
arc(316, 190, 320, 320, 0, PI);
fill(66, 82, 108, 70);
ellipse (316, 193, 315, 116);
noFill();
strokeWeight(4);
stroke(136, 170, 224,120);
arc(315, -70, 700, 700, PI/2.75, PI/1.57);
arc(315, -61, 700, 700, PI/2.73, PI/1.59);
popMatrix();



// noodles
float noorot = 0;
float noox =0;
float nooy = 0;


for (float x = -18; x<=18; x=x+6)
{
  for(float y = -5; y <=5; y=y+2){
pushMatrix();
rotate(noorot/9000);
translate(30+(x*6)+noox, -50+(y*6)+nooy);
beginShape();
strokeWeight(4);
stroke(242, 218, 78);
curveVertex(239+2*noox, 191+nooy);
curveVertex(239+noox, 191+2*nooy);
curveVertex(260-4*noox, 200-nooy);
curveVertex(296+2*noox, 254+2*nooy);
curveVertex(296+2*noox, 254+2*nooy);
endShape();
popMatrix();

noorot = noorot+ random(-1*mouseX/8 ,1*mouseX/8)*map(mouseX, 0, 640, 0, 2*PI);
noox = noox + random(-mouseX/200,mouseX/200);
nooy = nooy + random(-mouseX/100,mouseX/200);
}}
 println (mouseX);
 println (mouseY);
 pushMatrix();
 noStroke();
 translate(190, 150);
 rotate(radians(40));
 fill(255);
 ellipse(0, 0, 100, 67);
 fill(250,207,48);
 ellipse(5,5, 50, 50);
 popMatrix();
 
 pushMatrix();
 noStroke();
 translate(230, 190);
 rotate(radians(-20));
 fill(255);
 ellipse(0, 0, 100, 67);
 fill(250,207,48);
 ellipse(5,5, 50, 50);
 popMatrix();
 }



void setup(){
  
  size (400,400);
  background (111,184,216);
  
}

void draw(){
  
  fill(245,218,193);
  ellipse (200,200,175,200); //center
  noStroke();

//Right pupil
beginShape();
fill(85,48,14);
ellipse(width/1.8,height/2.5,12,12);
smooth();
strokeWeight(2);

//Left pupil
beginShape();
fill(85,48,1);
ellipse(width/2.4,height/2.5,12,12);
smooth();

//Right eyebrow
beginShape();
noFill();
stroke(0);
arc(169,140,width/12,40,-PI,0); //upper half of circle

//Left eyebrow
beginShape();
noFill();
stroke(0);
arc(224,140,width/12,40,-PI,0); //upper half of the circle

//Left nostril
beginShape();
fill(8,0,0);
stroke(0);
ellipse(width/2.1,height/2,9,2);

//Right nostril
beginShape();
fill(8,0,0);
stroke(0);
ellipse(width/2.0,height/2,9,2);

//Mouth
beginShape();
fill(8,0,0);
stroke(0);
ellipse(width/2.0,height/1.6,45,30);

//Upper lip
beginShape();
fill(242,154,195);
noStroke();
arc(200,245,width/9,27,-PI,0);

//Lower lip
beginShape();
fill(242,154,195);
noStroke();
arc(200,267,width/14,10,-PI,0);

//Upper hair
beginShape();
fill(98,56,26);
noStroke();
arc(198,119,width/2.3,77,-PI,0);

//Left side hair
beginShape();
fill(98,56,26);
noStroke();
rect(112,115,35,200);

//Right side hair
beginShape();
fill(98,56,26);
noStroke();
rect(254,115,35,200);

}


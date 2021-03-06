
void setup() {
size(500,500);
smooth();
stroke(154,205,50);
strokeWeight(5);
strokeJoin(ROUND);
strokeCap(ROUND);
background(255);
fill(154,205,50);
}
void draw () {
  //colour
if (keyPressed == true) {
  background(260);
  stroke(260);
  strokeWeight(5);
} else {
  stroke(154,205,50);
strokeWeight(5);
strokeJoin(ROUND);
strokeCap(ROUND);
background(255);
fill(154,205,50);
}
//head
arc(250,146,250,220,PI,TWO_PI);
//body
rect(125,160,250,190);
rect(160,355,180,30);
arc(160,350,70,70,radians(90),radians(180));
arc(340,350,70,70,radians(0),radians(90));
//arms
rect(66,190,45,140);
rect(389,190,45,140);
arc(89,190,45,45,radians(180),radians(360));
arc(89,330,45,45,radians(0),radians(180));
arc(412,190,45,45,radians(180),radians(360));
arc(412,330,45,45,radians(0),radians(180));
//legs
rect(180,380,50,80);
rect(270,380,50,80);
arc(205,455,50,45,radians(0),radians(180));
arc(295,455,50,45,radians(0),radians(180));
//eyes
noFill();
noStroke();
fill(255);
ellipse(200,95,20,20);
ellipse(300,95,20,20);
}


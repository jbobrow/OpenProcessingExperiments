
void setup(){
size(500,400);
background(193,54,94);
smooth();
// horizontal lines
strokeWeight(2);
for(int i=150; i<=250; i=i+20){
  line(100,i,400,i);
}
}
void draw(){
//note 1
//circle 1 mouse
if((mouseX>100) && (mouseX<140)){
  fill(0);
  strokeWeight(2);
  ellipse(130,230,20,15);
}
else{
  fill(255);
}
strokeWeight(2);
line(140,230,140,180);
//circle1
ellipse(130,230,20,15);
//circle 2 mouse
if((mouseX>150) && (mouseX<200)){
  fill(0);
  ellipse(160,200,20,15);
}
else{
  fill(255);
}
//circle2
ellipse(160,200,20,15);
line(170,200,170,150);
strokeWeight(3);
strokeCap(SQUARE);
line(140,180,170,150);
//sharp
line(187,156,187,184);
line(192,154,192,182);
strokeWeight(4);
line(182,164,198,160);
line(182,178,198,174);
//note 2
strokeWeight(2);
//circle 3 mouse
if((mouseX>210) && (mouseX<250)){
  fill(0);
  ellipse(220,170,20,15);
}
else{
  fill(255);
}
//circle3
ellipse(220,170,20,15);
line(210,170,210,220);
//triplet
strokeWeight(2);
//circle 4 mouse
if((mouseX>260) && (mouseX<290)){
  fill(0);
  ellipse(270,230,20,15);
}
else{
  fill(255);
}
//circle4
ellipse(270,230,20,15);
//circle 5 mouse
if((mouseX>300) && (mouseX<330)){
  fill(0);
  ellipse(310,230,20,15);
}
else{
  fill(255);
}
//circle5
ellipse(310,230,20,15);
//circle 6 draw
if((mouseX>330) && mouseX<500){
  fill(0);
  ellipse(350,230,20,15);
}
else{
  fill(255);
}
//circle6
ellipse(350,230,20,15);
line(280,230,280,180);
line(320,230,320,180);
line(360,230,360,180);
strokeWeight(4);
line(280,180,360,180);
//vertical lines
strokeWeight(2);
line(380,150,380,250);
strokeWeight(5);
line(390,150,390,250);
}


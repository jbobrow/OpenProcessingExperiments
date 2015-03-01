
float flameW=40;
float flameH=40;
float change=2;
float flameTrans=15;
float otherChange=.5;

void setup() {
  size(500,500);
}

void draw() {
  //background
background(204,255,255);
  smooth();
  
//table
fill(51,0,0);
rect(0,240,500,200);

//plate
fill(255,255,255);
ellipse(220,270,350,58);

//cupcake shape 1 - pink
  fill(102,51,0);
  ellipse(250,260,51,15); //bottom circle
  noStroke();
  fill(102,51,0);
  quad(225,260,216,210,284,210,275,260); //cupcake bottom
  stroke(0,0,0);
  strokeWeight(1.5);
  line(225,260,216,210);
  line(284,210,275,260);
  fill(255,153,153);
  ellipse(250,210,66,26); //frosting biggest layer
  ellipse(250,200,55,25); //frosting second layer
  ellipse(250,190,40,15); //frosting top layer
  fill(255,255,255);
  rect(246,158,7,30); //candle
  line(249,157,249,148);
  
//cupcake shape 2 - purple
  fill(102,51,0);
  ellipse(250-100,260,51,15); //bottom circle
  noStroke();
  fill(102,51,0);
  quad(225-100,260,216-100,210,284-100,210,275-100,260); //cupcake bottom
  stroke(0,0,0);
  strokeWeight(1.5);
  line(225-100,260,216-100,210);
  line(284-100,210,275-100,260);
  fill(204,153,255);
  ellipse(250-100,210,66,26); //frosting biggest layer
  ellipse(250-100,200,55,25); //frosting second layer
  ellipse(250-100,190,40,15); //frosting top layer
  fill(255,255,255);
  rect(246-100,158,7,30); //candle
  line(249-100,157,249-100,148);
 
 //cupcake shape 3 - yellow
  fill(102,51,0);
  ellipse(250+50,260+20,51,15); //bottom circle
  noStroke();
  fill(102,51,0);
  quad(225+50,260+20,216+50,210+20,284+50,210+20,275+50,260+20); //cupcake bottom
  stroke(0,0,0);
  strokeWeight(1.5);
  line(225+50,260+20,216+50,210+20);
  line(284+50,210+20,275+50,260+20);
  fill(255,255,153);
  ellipse(250+50,210+20,66,26); //frosting biggest layer
  ellipse(250+50,200+20,55,25); //frosting second layer
  ellipse(250+50,190+20,40,15); //frosting top layer
  fill(255,255,255);
  rect(246+50,158+20,7,30); //candle
  line(249+50,157+20,249+50,148+20);
  
  //cupcake shape 4 - green
  fill(102,51,0);
  ellipse(250-50,260+20,51,15); //bottom circle
  noStroke();
  fill(102,51,0);
  quad(225-50,260+20,216-50,210+20,284-50,210+20,275-50,260+20); //cupcake bottom
  stroke(0,0,0);
  strokeWeight(1.5);
  line(225-50,260+20,216-50,210+20);
  line(284-50,210+20,275-50,260+20);
  fill(153,255,153);
  ellipse(250-50,210+20,66,26); //frosting biggest layer
  ellipse(250-50,200+20,55,25); //frosting second layer
  ellipse(250-50,190+20,40,15); //frosting top layer
  fill(255,255,255);
  rect(246-50,158+20,7,30); //candle
  line(249-50,157+20,249-50,148+20);

if (mousePressed && mouseX>249-3 && mouseX<249+3 && mouseY<148+3 && mouseY>148-8) {
  fill(255,128,0,flameTrans);
  ellipse(mouseX,mouseY,flameW,flameH);
  
  flameW = flameW + change;
  flameH = flameH + change;
  flameTrans = flameTrans + otherChange;
}
  
if (mousePressed && mouseX>149-3 && mouseX<149+3 && mouseY<148+3 && mouseY>148-8) {
  fill(255,128,0,flameTrans);
  ellipse(mouseX,mouseY,flameW,flameH);
  
  flameW = flameW + change;
  flameH = flameH + change;
  flameTrans = flameTrans + otherChange;

}
  
if (mousePressed && mouseX>299-3 && mouseX<299+3 && mouseY<168+3 && mouseY>168-8) {
 fill(255,128,0,flameTrans);
   noStroke();
  ellipse(mouseX,mouseY,flameW,flameH);
  
  flameW = flameW + change;
  flameH = flameH + change;
  flameTrans = flameTrans + otherChange;
  
  if (flameW>80) {
  fill(255,128,0,30);
  ellipse(mouseX,mouseY,80,80);
}
if (flameW>160) {
  fill(255,128, 0, 10);
  ellipse(mouseX,mouseY,160,160);
}

if (flameW>400) {

  flameTrans = flameTrans - otherChange - otherChange;
}
}

if (mousePressed && mouseX>199-3 && mouseX<199+3 && mouseY<168+3 && mouseY>168-8) {
 fill(255,128,0,flameTrans);
  ellipse(mouseX,mouseY,flameW,flameH);
  
  flameW = flameW + change;
  flameH = flameH + change;
  flameTrans = flameTrans + otherChange;

  if (flameW>80) {
  fill(255,128,0,30);
  ellipse(mouseX,mouseY,80,80);
}
if (flameW>160) {
  fill(255,128, 0, 10);
  ellipse(mouseX,mouseY,160,160);
}

if (flameW>400) {
  noStroke();
  flameTrans = flameTrans - otherChange - otherChange;
}}
else {
  if (!mousePressed);{
  ellipse(mouseX, mouseY,0,0);
  }}
stroke(0,0,0);
strokeWeight(8);
line(mouseX,mouseY,mouseX+40,mouseY+30);
strokeWeight(1.5);
fill(255,128,0);
ellipse(mouseX, mouseY,15,15); 
}

void keyPressed (){ //now don't need if(keyPressed) bc void keyPressed takes its place
    if(key=='p' || key=='P'){
      saveFrame();
    }
  }



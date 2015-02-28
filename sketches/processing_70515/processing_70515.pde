
void setup(){
size( 500, 500);
}
color fillVal = color (53,110,165);
color fillVal2 = color(21,49,85);
color fillVal3 = color(25,72,131);
color fillVal4 = color(140,205,247);

void draw(){
  
background(255);
smooth();
noStroke();
fill(35,67,108);
rectMode(CORNERS);
ellipseMode(CORNERS);
translate(-100,-120);

if(keyPressed){
  if(key == 'b') {
  fill(175);
  }
}
 if(mousePressed == true){
   translate(210,230); 
   scale(0.5);
    
  }
if(mousePressed == false){
}



//torso
fill(fillVal2);
ellipse(mouseX+80,mouseY+130,mouseX+140,mouseY+180);
fill(fillVal3);
ellipse(mouseX+70,mouseY+70,mouseX+150,mouseY+150);
fill(fillVal4);
rect(mouseX+70,mouseY+80,mouseX+50,mouseY+130);
rect(mouseX+150,mouseY+80,mouseX+170,mouseY+130);
fill(fillVal);
ellipse(mouseX+45,mouseY+70,mouseX+75,mouseY+100);
ellipse(mouseX+145,mouseY+70,mouseX+175,mouseY+100);
ellipse(mouseX+90,mouseY+20,mouseX+130,mouseY+80);
//head triangle
fill(fillVal4);
triangle(mouseX+80,mouseY+20,mouseX+110,mouseY+50,mouseX+140,mouseY+20);
//hands
fill(100);
ellipse(mouseX+50,mouseY+210,mouseX+80,mouseY+240);
ellipse(mouseX+140,mouseY+210,mouseX+170,mouseY+240);
//legs and feet
stroke(0);
strokeWeight(5);
line(mouseX+90,mouseY+210,mouseX+100,mouseY+235);
line(mouseX+130,mouseY+210,mouseX+120,mouseY+235);
noStroke();
ellipse(mouseX+90,mouseY+230,mouseX+110,mouseY+240);
ellipse(mouseX+110,mouseY+230,mouseX+130,mouseY+240);
//arms 
fill(fillVal2);
triangle(pmouseX+20,pmouseY+120,mouseX+50,mouseY+130,mouseX+30,mouseY+170);
triangle(mouseX+175,mouseY+130,pmouseX+200,pmouseY+120,mouseX+190,mouseY+170);

fill(fillVal);
ellipse(mouseX+30,mouseY+110,mouseX+80,mouseY+230);
ellipse(mouseX+140,mouseY+110,mouseX+190,mouseY+230);
//moar legs
fill(fillVal);
ellipse(mouseX+80,mouseY+160,mouseX+100,mouseY+220);
ellipse(mouseX+120,mouseY+160,mouseX+140,mouseY+220);
//eyes
strokeWeight(1);
fill(224,18,73);
stroke(255,46,64);
triangle(mouseX+95,mouseY+50,mouseX+105,mouseY+65,mouseX+105,mouseY+50);
triangle(mouseX+115,mouseY+50,mouseX+115,mouseY+65,mouseX+125,mouseY+50);

}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      fillVal = color(224,154,0);
    } else if (keyCode == DOWN) {
      fillVal= color(53,110,165);
    } 
  } else {
    fillVal = 126;
  }
  if (key == CODED) {
    if (keyCode == UP) {
      fillVal2 = color(113,80,8);
    } else if (keyCode == DOWN) {
      fillVal2= color(21,49,85);
    } 
  } else {
    fillVal = 126;
  }
   if (key == CODED) {
    if (keyCode == UP) {
      fillVal3 = color(131,93,9);
    } else if (keyCode == DOWN) {
      fillVal3= color(25,72,131);
    } 
  } else {
    fillVal = 126;
  }
     if (key == CODED) {
    if (keyCode == UP) {
      fillVal4 = color(255,177,8);
    } else if (keyCode == DOWN) {
      fillVal4= color(140,205,247);
    } 
  } else {
    fillVal = 126;
  }
}

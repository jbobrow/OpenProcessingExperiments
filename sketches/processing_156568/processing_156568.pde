
color square1= color(232, 60, 125);
color square2= color(255, 119, 13);
color square3= color(53, 176, 151);

boolean state1;
boolean state2;
boolean state3;
//boolean state4;

void setup() {
  size (500, 500);
  background(38, 38, 38);
}

void draw() {
  //background (38, 38, 38);

  noStroke();
  fill(66, 66, 66);
  rect (0, 0, 110, 500);

  if (mouseX>5 && mouseX<50 && mouseY>5 && mouseY<50) {
    fill (255, 155, 136);
    noStroke();
    rect (5, 5, 50, 50);
  } else {
    fill (square1);
    noStroke();
    rect (5, 5, 50, 50);
  }

  if (mouseX>55 && mouseX<105 && mouseY>5 && mouseY<85) {
    fill (255, 175, 120);
    noStroke();
    rect (55, 5, 50, 80);
  } else {
    fill (square2);
    noStroke();
    rect (55, 5, 50, 80);
  }

  if (mouseX>5 && mouseX<55 && mouseY>55 && mouseY<85) {
    fill (132, 189, 154);
    noStroke();
    rect (5, 55, 50, 30);
  } else {
    fill (square3);
    noStroke();
    rect (5, 55, 50, 30);
  }
  if (mouseX>5 && mouseX<105 && mouseY>85 && mouseY<115) {
    fill (105, 105, 105);
    noStroke();
    rect (5, 85, 100, 30);
  } else {
    fill (38,38,38);
    noStroke();
    rect (5, 85, 100, 30);
  }
}
void mouseDragged() {
//  
//  if (state1==true) {
//    fill (38, 38, 38); 
//  }

  if (state1==true) 
  {
    fill(square1);
    ellipse (mouseX, mouseY, 1, 1);
    println ("dragged");
  }
  else if (state2==true)
  {
    fill(square2);
    ellipse (mouseX, mouseY, 5, 5);
  }
  else if (state3=true)
  {
    fill(square3);
    rect (mouseX, mouseY, 8, 8);
   
}
}
void mousePressed () {
//  if (mouseX>0 && mouseX<500 && mouseY>0 && mouseY<500) {
//    state1=true;
//    state2=false;
//    state3=false;


  if (mouseX>5 && mouseX<50 && mouseY>5 && mouseY<50) {
    state1=true;
    state2=false;
    state3=false;
 
  }
  else if (mouseX>55 && mouseX<105 && mouseY>5 && mouseY<85) {
    state1=false;
    state2=true;
    state3=false;
  
}
  else if (mouseX>5 && mouseX<55 && mouseY>55 && mouseY<85) {
    state1=false;
    state2=false;
    state3=true;
 
}
else if (mouseX>5 && mouseX<105 && mouseY>85 && mouseY<115) {
  background (38, 38, 38);
}
//void keyPressed () {
//  if (key == ' ') {
//    background(38, 38, 38);
//  }
}



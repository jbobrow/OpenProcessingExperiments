
void setup() 
{
size(1000,500);
background(255);
noStroke();
frameRate(30);
//noStroke();
//Title> Color Picker
colorMode(HSB, 100);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j, 100);
    point(i, j);
    noStroke();
  }
}
   //Title>text
text("Photoshop Mini", 120, 70, textSize(32));
}

void draw() {
if (mousePressed && (mouseButton == LEFT)) {
if (key == CODED) {
    if (keyCode == UP)
      int circleSize = 40; 
     }
   if (keyCode == DOWN) {
      int circleSize = 25;}
      if (keyPressed == false) {
    int circleSize = 3;}
int circleXpos = mouseX;
int circleYpos = mouseY;
//fill(mouseX,mouseY,random(0,255));
fill();

ellipse(circleXpos, circleYpos, circleSize, circleSize);
 }
 //Eraser
 else if (mousePressed && (mouseButton == RIGHT)) {
 if (key == CODED) {
    if (keyCode == UP)
      int circleSize = 40; 
     }
   if (keyCode == DOWN) {
      int circleSize = 25;}
      if (keyPressed == false) {
    int circleSize = 3;}
 int circleXpos = mouseX;
int circleYpos = mouseY;
   ellipse(circleXpos, circleYpos, circleSize, circleSize);
    fill(0,0,255);
  }

//Title>Color Sample Box
//if (mousePressed == true) {
//    fill(random(HSB,100));
//  } else {
//    fill(255);
//  }
//rect(25, 25, 50, 50);
  
  //Title>Mouse Courser
  if (mouseX < 50) {
    cursor(CROSS);
  } else {
    cursor(HAND);
  }
  
//arc
//if (mousePressed == true) {
//if (key == CODED) {
//    if (keyCode == A)
 //     arc(50, 55, 50, 50, 0, HALF_PI);
//noFill(166);}
//}
 if (keyPressed) {
    if (key == 's' || key == 'S') {
      saveFrame("line-######.png");
    }
}
}


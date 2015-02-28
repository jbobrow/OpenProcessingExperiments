
int moveMouth=135;
int moveEyeballs=100;
int moveRetinas=100;


int themeColor=0;
int buttonShade=255;
float bodyChange=0.0;
float speed=0.05;
int lightAlpha=0;

void setup() {
  size(500, 500);
}


void draw() {
  background(themeColor);
  smooth();
  fill(255,255,0,lightAlpha);
  ellipse(250,230,420,420);

  //head
  fill(125);
  stroke(125);
  triangle(200, 125, 300, 125, 250, 200);
  fill(115);
  triangle(200, 125, 300, 125, 250, 200);
  fill(125);
  ellipse(250, 90, 200, 120);


  // arms
  rectMode(CENTER);
  rect(170, 200, 100, 50);
  rect(330, 200, 100, 50);
  ellipseMode(CORNER);
  ellipse(100, 190, 50, 200);
  ellipse(350, 190, 50, 200);
  ellipseMode(CENTER);
  //legs
  rect(220, 400, 50, 300);
  rect(280, 400, 50, 300);
  //body
  stroke(0);
  fill(125);
  ellipse(width/2, 305, 180+sin(bodyChange)*5, 300);
  bodyChange+=speed;
  //red shadow
  strokeWeight(0);
  fill(180, 0, 0, 80);
  ellipse(width/2, 305, 160+sin(bodyChange)*5, 260);
  //body red
  strokeWeight(2); 
  fill(220, 16, 25);
  ellipse(width/2, 305, 150+sin(bodyChange)*5, 250);



  

  //eyes
  fill(255);
  ellipse(228, height/5.5, 20, 40);
  ellipse(268, height/5.5, 20, 40);
  //eyeballs
  fill(255, 0, 0);
  ellipse(228, moveEyeballs, 15, 15); 
  ellipse(268, moveEyeballs, 15, 15);
  //retinas
  ellipse(228, moveRetinas, 5, 10);
  ellipse(268, moveRetinas, 5, 10);
  //mouth
  line(228, 125, 268, 125);
  strokeWeight(2);
  line(228, 125, 225, moveMouth);
  line(268, 125, 271, moveMouth);
  //button shade
  noStroke();
  fill(0, 0, 40, buttonShade);
  ellipse(252, 352, 28, 28);
  //button
  strokeWeight(2);
  fill(0, 0, 255);
  ellipse(250, 350, 25, 25);

  //press the button
  if (mouseX>225 && mouseX<275 && mouseY>325 && mouseY<375&& mousePressed) {
    //change light
    lightAlpha=lightAlpha+3;

    //change bodybreath
    speed=0 ;
    //change button shade
    buttonShade=0;
    //change alien's expression  
    if ( moveMouth>120) {
      moveMouth= moveMouth-1;
    }
    else {
      moveMouth=120;
    }

    if (moveEyeballs>80) {
      moveEyeballs=moveEyeballs-1;
    }
    else {
      moveEyeballs=80;
    }
      if (moveRetinas>80) {
      moveRetinas=moveRetinas-1;
    }
    else {
      moveRetinas=80;
    }
  }
  else {
    moveMouth=135;
    moveEyeballs=100;
    moveRetinas=100;
    buttonShade=255;
    speed=0.05;
    lightAlpha=0;
  }
}


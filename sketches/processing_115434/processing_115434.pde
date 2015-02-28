

int counter;
float target;

int currMouseY;
boolean turnPumpkinEyesRed = false;

float color1;
float color2;
float color3;
float color4;

// jack-o-lantern follows cursor....

void setup() {
  size(400, 400);
  noCursor();
  background(25);
  //frameRate(10);
  counter = 20;
  target = 10;
}

void mousePressed() {
  turnPumpkinEyesRed = true;
}

void mouseReleased() {
  turnPumpkinEyesRed = false;
}


void draw() {
  background(65);
  counter++;
  if (counter > target) {


    if ( turnPumpkinEyesRed == true) {
      counter = 0;
      target = random(5) + 5 ;
      color1 = 250;
      color2 =3;
      color3 = 19;
      color4 = 255;//random(200) + 50;
    } 
    else {
      counter = 0;
      target = random(5) + 5 ;
      color1 = 240 + random(15);
      color2 = 240 + random(15);
      color3 = random(255);
      color4 = random(200) + 50;
    }
  }

  if ( turnPumpkinEyesRed == true) {
    stroke(250, 3, 19, 255);
  }
  else {
    stroke(255);
  }

  point (100, 120);
  point (230, 10);
  point (180, 140);
  point (180, 140);
  point (120, 70);
  point (50, 80);
  point (10, 250);
  point (10, 20);
  point (220, 190);
  point (310, 100);
  point (300, 40); 
  point (380, 15); 
  point(370, 200);

  stroke(0);
  strokeWeight(2);

  if ( turnPumpkinEyesRed == true) {
    fill(245, 84, 95);
  }
  else {
    fill(12, 13, 57);
  }


  //fill(3,4,36);
  rect(0, 370, 400, 30);

  fill(0);

  triangle(50, 230, 200, 370, -40, 370);

  triangle(100, 180, 240, 370, 0, 370);

  triangle(250, 100, 400, 370, 0, 370);

  triangle(50 + 300, 230, 200 + 300, 370, -40 + 300, 370);

  currMouseY = mouseY;

  if (currMouseY > 300) {
    currMouseY = 300;
  }
  ellipseMode(CENTER);
  // top stem
  fill(56, 85, 6);
  rect(mouseX-7, currMouseY - 92, 14, 20);

  // body
  fill(227, 136, 16);
  ellipse(mouseX, currMouseY, 150, 150);


  fill(color1, color2, color3, color4);

  triangle(mouseX-30, currMouseY-20, mouseX-20, currMouseY, mouseX-40, currMouseY);

  triangle(mouseX+30, currMouseY-20, mouseX+20, currMouseY, mouseX+40, currMouseY);


  triangle(mouseX, currMouseY, mouseX+10, currMouseY+20, mouseX-10, currMouseY+20);

  
  arc(mouseX, currMouseY + 30, 80, 80, 0, PI,  0);

  line(mouseX - 40, currMouseY + 30, mouseX + 39, currMouseY + 30);
  
  //drasw tooth
 
  

  ellipse(mouseX, 385, 150 * currMouseY/400, 10 * currMouseY/400);
  
   fill(227, 136, 16);
  rect(mouseX + 10,currMouseY + 30, 10,15);
  
  stroke(227, 136, 16);
  line(mouseX + 12,currMouseY + 30,mouseX + 18,currMouseY + 30);
  
}




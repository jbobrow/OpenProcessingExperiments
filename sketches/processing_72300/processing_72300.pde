
//Liz Dolinar
//Intro to Digital Media
//Assignment 01b
//14 September 2012


int randomWeight = 1;
float randomDiameter = 10;  //Global variable - Float - Diameter
int growingDiameter = 100;  //Global variable - Int - Diameter
int randomRed = 0;          //Global variable - Int - Color
int randomBlue = 0;         //Global variable - Int - Color
int randomGreen = 0;        //Global variable - Int - Color
int randomGrayscale = 0;    //Global variable - Int - Color
int value = 180;
int value2 = 80;
boolean boolGrowing = false; 

void setup() {
  size(1200, 600);
  randomRed = int(random(255));
  background(0);
}

void draw() {

  fill(0, 8);
  strokeWeight(5);
  stroke(0);
  rect(0, 0, width, height);    //Background fade

  fill(200, 1);
  strokeWeight(5);
  stroke(0);
  rect(0, 0, width, height);    //Background fade (alt. color)

  fill(value);
  strokeWeight(2);
  quad(200, 100, 500, 100, 200, 400, 500, 400); //stacked "triangles"
  
  fill(value2);
  strokeWeight(2);
  quad(220,120,520,120,220,420,520,420);  //stacked "triangles"

  fill(value);
  strokeWeight(2);
  quad(800, 280, 1100, 280, 800, 560, 1100, 560);  //stacked "triangles"
  
  fill(value2);
  strokeWeight(2);
  quad(780,260,1200,260,780,580,1200,580);  //stacked "triangles"

  for (int i=0; i<100; i=i+8) {

    strokeWeight(4); 
    stroke(0, i*3, 255); 
    line(width, mouseY, 30+i*6, mouseY);  //blue-aqua line
  }

  stroke(randomRed, 200, 100);
  randomWeight = int(random(6));
  strokeWeight(randomWeight);
  line(1000, 200, mouseX, mouseY);  

  stroke(150, randomGreen, 180);
  randomWeight = int(random(10));
  strokeWeight(randomWeight);
  line(90, 500, mouseX, mouseY);

  stroke(200, 80, randomBlue);
  randomWeight = int(random(15));
  strokeWeight(randomWeight);
  line(870, 580, mouseX, mouseY);
  
  stroke(randomRed,200,120);
  randomWeight = int(random(7));
  strokeWeight(randomWeight);
  line(100,40,mouseX,mouseY);

  smooth();                      
  strokeWeight(5);
  randomGrayscale = int(random(200));
  stroke(randomGrayscale);
  randomRed = int(random(255)); 
  randomBlue = int(random(200));
  randomGreen = int(random(200));
  fill(randomRed, randomGreen, randomBlue);           

  randomGrayscale = int(random(240));
  stroke(randomGrayscale);
  point(mouseX, mouseY);

  smooth();
  strokeWeight(5);
  stroke(randomRed,100,200);
  fill(randomRed, 100, 200);
  arc(mouseX,mouseY,0,height/2,PI/2,3*PI/2);
  //arc(0, height/2, mouseX, mouseY, growingDiameter, growingDiameter);



  if (boolGrowing) {
    if (growingDiameter <200) {
      growingDiameter++;
    }
    else {
      growingDiameter = 100;
    }
  }

  fill(randomRed, randomGreen, randomBlue);
  ellipse(mouseX, mouseY, growingDiameter, growingDiameter);
}

void mouseClicked() {
  boolGrowing = !boolGrowing;  
}

void mouseMoved() {
  value = value +2;
  if (value>255) {
    value = 0;
  }
  value2 = value2 +2;
  if (value2>255) {
    value2 = 0;
  }
}

void keyPressed() { 
  if (key == 's') { 
    save("LizDolinar.png");
  }
}

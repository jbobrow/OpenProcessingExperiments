
int h=300;
Cloud cloud1, cloud2, cloud3, cloud4, cloud5, cloud6;
 
 
void setup() {
  size(800, 800);
  frameRate(30);
  cloud1=new Cloud(-20, 10);
  cloud2=new Cloud(-130, 15);
  cloud3=new Cloud(-210, 12);
  cloud4=new Cloud(-320, 20);
  cloud5=new Cloud(-480, 10);
  cloud6=new Cloud(-500, 17);

}
 
void draw() {
    background(#248FFF);
  fill(0, 0, 0, transparency);
  rect(0, 0, width, 400);
 
  sun();
 
  //clouds
  cloud1.display();
  cloud1.move();
  cloud2.display();
  cloud2.move();
  cloud3.display();
  cloud3.move();
  cloud4.display();
  cloud4.move();
  cloud5.display();
  cloud5.move();
  cloud6.display();
  cloud6.move();
 
 
fill(0);
triangle(410,50,200,200,600,200); //Roof, obviously
fill(#FCB705);
rect(550,350,200,150); //Garage
fill(#FCB705);
rect(250,200,h,h); //House
fill(0);
triangle(520,350,780,350,650,250); //Garage Roof
fill(#F7F711);
rect(300,250,h/4,h/4); //Left Window
line(300,290,375,290); //Left Window Horizontal Window Bar
line(337,250,337,325); //Left Window Vertical Window Bar
fill(#F7F711);
rect(430,250,h/4,h/4); //Right Window
line(505,290,430,290); //Right Window Horizontal Window Bar
line(467,325,467,250); //Right Window Vertical Window Bar
fill(#FC0526);
rect(370,400,h/4,h/3); //Door
fill(30,40,50,60);
rect(580,370,140,130); //Garage Door
line(580,390,720,390); //Garage Door Line #1
line(580,410,720,410); //Garage Door Line #2
line(580,430,720,430); //Garage Door Line #3
line(580,450,720,450); //Garage Door Line #4
line(580,470,720,470); //Garage Door Line #5
line(580,490,720,490); //Garage Door Line #6
ellipse(650,480,5,5); //Garage Door Handle
ellipse(420,460,5,5); //Door Knob
}
 
class Cloud {
 
  float cloudX, cloudY, r;
 
  Cloud(float moveCloud, float rate) {
    cloudY=150;
    r=rate;
    cloudX=moveCloud;
  }
 
  void display() {
    noStroke();
    fill(255);
    ellipse(cloudX, cloudY, 100, 30);
  }
 
  void move() {
    cloudX+=r;
    if (cloudX>width+30) {
      cloudX=-30;
      cloudY=random(20, 200);
    }
    if (cloudX<0-50)
      cloudY=random(20, 200);
  }
}

 
// Sun variables
int sunRadius = 60;      // size of the sun
int xStart = -sunRadius; // The initial x position
int yStart = 20;         // The initial y position
float xSun = xStart;     // the x position of the sun
float ySun = yStart;     // the y position of the sun
 
// Arc variables
float t = 0;   // Start
float duration = 60 * 1000; // Complete full circle every 60 seconds
float conversionFactor = 2 * 3.14 / duration; 
float transparency;
 
void sun(){

 
  // Draw sun
  fill(#FAFF00);
  ellipse(xSun, ySun, sunRadius, sunRadius);
 
  // Update position
  t = millis() * conversionFactor;
 
  // Parametric? Form for an ellipse.
  float Rx = width/2 + sunRadius/2;
  float Ry = height/2 - sunRadius/2;
  float centerX = width/2;
  float centerY = height/2;
 
  xSun = cos(t) * Rx + centerX;
  ySun = sin(t) * Ry + centerY;
 
 fill(#137C0C);
rect(0,400,800,400); //"Grass"
 
  transparency=map(ySun, 0, height, 0, 255);

}



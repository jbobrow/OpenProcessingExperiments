
PFont myFont;  //create a font
float a;
float b;
float c;
float d;
float y = 100;   //rings size
float s = 0.8;    //speed for rings


void setup() {
  size (640, 360);        // setup size
  background(206, 0, 103);      //background colour
  smooth();
  noStroke();
  myFont = createFont("GillSans-UltraBold", 32);     //use font
  textFont(myFont);
  text("London 2012", 190, 240);      //words on screen
}


void draw() {
  fill(206, 0, 103, 20);    //cover the background
  rect(0, 0, width, 210);    //cover size

  float gravity=abs(y*0.1);   
  y+=s*gravity;
  if ((y>150 -50 && s>0) || ( y<50 && s<0)) {  //the rate change of ring size
    s = -s;
  }
  noFill();
  stroke(255);
  strokeWeight(5);

  ellipse(width/2, 90, y, y);        //draw 5 rings
  ellipse(width/2-70, 90, y, y);
  ellipse(width/2+70, 90, y, y);
  ellipse(width/2-35, 120, y, y);
  ellipse(width/2+35, 120, y, y);


noStroke();

  a = random(-1000, 1000);   //limited position for animation on the bottom
  b = random(310, 410);
  c = random(-1000, 1000);
  d = random(310, 410);


  fill(206, 0, 103);    //animation effect on the bottom  
  triangle(random(width), random(310, 410), a, b, c, d);

  fill(255, 255, 52);
  triangle(random(width), random(310, 410), a, b, c, d);

  textFont(myFont);

  delay(100);    //1/10sec delay every time
} 



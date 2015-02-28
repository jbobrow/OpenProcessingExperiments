
Spot sp1,sp2,sp3,sp4,sp5,sp6,sp7; // Declare the object
Car myCar1;
Car myBus;
int numClicks = 0;
int numKey = 0;
PFont Font;
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
float x =0;
float xspeed = 2.8;
float yspeed = 3;
float fade;
int passedTime;
int maxTime = 50;
boolean boolFade;
boolean bFadeIn;
 

void setup() {
  size(500,500);
  background(71,144,147);
  smooth();
  noStroke();
  sp1 = new Spot(20, 50, 40, 0.5); // Construct sp1
  sp2 = new Spot(50, 50, 10, 0.5); // Construct sp2
  sp3 = new Spot(80, 50, 30, 0.75); // Construct sp3
  sp4 = new Spot(120, 50, 10, 1.0);
  sp5 = new Spot(300, 20, 40, 1.5);
  sp6 = new Spot(400, 50, 10, 0.5);
  sp7 = new Spot(370, 50, 30, 0.75);
  myCar1 = new Car(color(255,0,0),0,100,2); 
  myBus = new Car(color(0,0,255),0,200,1);
   int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  
  cx = width / 2;
  cy = height / 2;
}

void draw() {
  textSet();

fill(255);
 if (numClicks == 0){
  if(numKey == 0) {
    background (71,144,147);
    text ("(click)", 100,300);
   
  }
 }
  else if (numKey ==1) {
    background (71,144,147);
    text("dream",100,300);
  }
  else if (numKey ==2) {
    background (71,144,147);
    text("because in my dreams I can do anything.",0,400);
     Font =createFont("Futura-Medium-14.vlw",14 );
      textFont(Font);
    text("sometimes I can even fly",300,430);
  }
  else if (numKey ==3) {
    background(0);
    fill(255);
    text("but then I wake up and realize I am merely human.", 0, 200);
    
  }
   else if(numKey==4) {
      background (0);
    fill (255); 
    text ("Then I get like well kinda sad", 0, 400);
    fill(0, 15);
  rect(0, 0, width, height);
  fill(186,228,240);
sp1.move();
sp2.move();
sp3.move();
sp4.move();
sp5.move();
sp6.move();
sp7.move();
sp1.display();
sp2.display();
sp3.display();
sp4.display();
sp5.display();
sp6.display();
sp7.display();
     }
else if(numKey==5) { 
      
       background (71, 144, 147);
       fill(255);
       text ("and these are the days I just want to...", 0, 250);
        textFade ();
      fill (255,fade);
      text ("hide.", 355, 300);
         fill(200);
          Font =createFont("Futura-Medium-14.vlw",14 );
      textFont(Font);
       text("(1.press any key)", 350,450);
       text("(2.click)",350,475);
     }
       else if (numKey == 6) {
            background (71, 144, 147);
    fill (255);
    text ("the end.", 200, 250);
       
    
}
  else if (numClicks == 1) {
    background (71,144,147);
text("Sometimes I dream that I have a car",100,300);

  }
     
  else if (numClicks == 2) {
    background (71, 144, 147);
    fill (255);
    text ("but then I wake up and remember I don't have a car", 0, 50);
    
  }
   else if (numClicks == 3){ 
    background (0);
    fill (255); 
    text ("Then I get like well kinda sad", 0, 400);
    fill(0, 15);
  rect(0, 0, width, height);
  fill(186,228,240);
sp1.move();
sp2.move();
sp3.move();
sp4.move();
sp5.move();
sp6.move();
sp7.move();
sp1.display();
sp2.display();
sp3.display();
sp4.display();
sp5.display();
sp6.display();
sp7.display();
     

  }
     else if (numClicks == 4) {
    background (0);
    fill (255); 
    text ("Because buses are slow compared to cars", 0, 400);
    fill(0, 15);
     myCar1.move();
     myCar1.display();
     myBus.move();
     myBus.display();
    
     }
   else if (numClicks == 5) {
    background (0);
    fill (255);
    text ("and then I freak out", 0, 50);
    text ("because I realize I have to catch the bus.", 30, 100);
    text(" I am late",400, 450);
     // Draw the clock 
  float s = map(second(), 0, 30, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
   // Draw the hands of the clock
  stroke(255);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
  // Draw the minute ticks
  strokeWeight(1);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();
 

   }
    else if (numClicks == 6) {
    fill (255);
    noStroke();
    background(0);
    text ("So then I run like an idiot", 10, 400);
  }
   else if (numClicks == 7) {
    Font = createFont("Futura-Medium",20);
    textFont(Font);
    fill (120);
    text ("but I can't because I broke my toes", 0, 50);
  }
   else if (numClicks == 8) {
    smooth();
    background (0);
    textAlign (LEFT);
    text ("and then I just want to sleep", 100, 100);
  }
   else if (numClicks == 9) {
    text ("because at least then I'd have a car,", 0, 150);
     
  }
   else if (numClicks == 10) {
    text ("and my toes aren't broken,", 200, 200);
   }
     else if (numClicks == 11) {
      
       background (71, 144, 147);
       fill(255);
       text ("and these are the days I just want to.. . ", 0, 250);
        textFade ();
      fill (255,fade);
      text ("hide.", 355, 300);
         fill(200);
          Font =createFont("Futura-Medium-14.vlw",14 );
      textFont(Font);
       text("(1.press any key)", 350,450);
       text("(2.click)",350,475);
     }
       else if (numClicks == 12) {
            background (71, 144, 147);
    fill (255);
    text ("the end.", 200, 250);
       }
    
}

void keyPressed() {
   numKey ++;
    boolFade = true;
  bFadeIn = !bFadeIn;
}
  void textFade() {
  if (boolFade) {
    passedTime++;
    if (bFadeIn) {
      fade = map(passedTime, 0, maxTime, 255,0);
    }
    else {
      fade = map(maxTime - passedTime, 0, maxTime, 0, 255);
    }
    //    println(bFadeIn + " " + passedTime + " " + fade);
    if (fade > 251 || fade < 1) {
      boolFade = false;
    }
  }
}
 
void mousePressed() {
  numClicks ++;
 
}

void textSet() {
  Font=createFont("Futura-Medium.vlw",20);
  textFont(Font);
}
class Spot {
float x, y; // X-coordinate, y-coordinate
float diameter; // Diameter of the circle
float speed; // Distance moved each frame
int direction = 1; // Direction of motion (1 is down, -1 is up)
// Constructor
Spot(float xpos, float ypos, float dia, float sp) {
x = xpos;
y = ypos;
diameter = dia;
speed = sp;
}
void move() {
y += (speed * direction);
if ((y > (height - diameter/2)) || (y < diameter/2)) {
direction *= 1;
}
}
void display() {
ellipse(x, y, diameter, diameter);
}
}
class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,40,20);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }

}




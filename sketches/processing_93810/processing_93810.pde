
Spot sp1,sp2,sp3,sp4,sp5,sp6,sp7; // Declare the objec
Car myCar1;
Car myBus;
float fuzzy = 0.0;
int numClicks = 0;
PFont Font;

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
}

void draw() {
  textSet();
  if (fuzzy < 20.0) {
fuzzy += 0.05;
  }

fill(255);
 if (numClicks == 0) {
    background (71,144,147);
    text ("(click)", 100,300);
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
   else if (numClicks == 3) {
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
    background (240,221,198);
    fill (237,66,19);
    text ("and then I freak out", 0, 50);
    text ("because I realize I have to catch the bus", 0, 100);
    text("and well I am late",50, 150);
    fill(237, 66, 19, 70);
    text("(move mouse for freak out)",50, 450);
    stroke(250,139,3,50);
strokeWeight(abs(mouseX-pmouseX));
line(300,7,mouseX,mouseY);
line(135,110,mouseX,mouseY);
line(150,50,mouseX,mouseY);
line(248,70,mouseX,mouseY);
line(480,100,mouseX,mouseY);
line(276,180,mouseX,mouseY);
line(320,178,mouseX,mouseY);
line(410,190,mouseX,mouseY);
line(156,180,mouseX,mouseY);
line(130,140,mouseX,mouseY);
line(120,44,mouseX,mouseY);
line(358,30,mouseX,mouseY);
line(374,10,mouseX,mouseY);
line(138,14,mouseX,mouseY);
   }
    else if (numClicks == 6) {
    fill (255);
    noStroke();
    background(0);
    text ("So then I run like an idiot", 10, 400);
    Font = createFont("BlairMdITCTT-Medium-14.vlw",20);
  }
   else if (numClicks == 7) {
    Font = createFont("Futura-Medium",20);
    textFont(Font);
    fill (120);
    text ("but I can't because I broke my toes", 0, 50);
  }
   else if (numClicks == 8) {
    smooth();
    background (20,0,15);
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
    fill (255);
    text ("and these are the days I just want to hide.", 0, 250);
    filter(BLUR, fuzzy);
    text ("and these are the days I just want to hide.", 0, 250);
     }
       else if (numClicks == 12) {
            background (71, 144, 147);
    fill (255);
    text ("the end. wasn't it fascinating?", 200, 250);
  } 
    
}

void keyPressed() {
  
}
 
void mousePressed() {
  numClicks ++;
}

void textSet() {
  Font=createFont("BlairMdITCTT-Medium-14.vlw",20);
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
direction *= -1;
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




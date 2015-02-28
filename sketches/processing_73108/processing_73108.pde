
/*****************************************
 * Assignment    #3
 * Name:         Baijie Lu (Siv)
 * E-mail:       blu@brynmawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    10/3/2012
 * 
 *The project is about a snowy day. If you put the mouse at the left-upper part of the screen, a sun will follow the
 mouse and the snowmen start to melt or shrink. If the mouse is at the right-upper part of the screen, a moon will 
 appear and the snowmen go back to their default heights. Also the background changes color as the mouse is moved horizontally,
 to creat the daylight changing effect. 
 If you click on any of the snowmen, the outer two ones will come closer. By the way the three snowmen are Mom, Dad
 and the little kid. 
 
 The techniques I used in my project are basically objects and functions. Apparently I understood the assignment wrong.
 I though we were supposed to design two objects as objects in processing language. Also I tried the translate function 
 to create the shapes I want, although I didn't fully manage it at the beginning.  
 ***********************************************/



//define the Snow class
class Snow {
  float x;
  float y;
  float snowSize;

  Snow(float tempx, float tempy, float tempsnowSize) {
    x=tempx;
    y=tempy;
    snowSize=tempsnowSize;
  }
  //draw the shape of the snow
  void display() {
    pushMatrix();
    strokeWeight(2);
    noFill();
    stroke(255);
    strokeCap(ROUND);
    translate(x, y);
    for (int i=0;i<6;i++) {
      rotate(TWO_PI/6);
      line(0, 0, snowSize, 0);
      triangle(0, 0, snowSize/3, 0, snowSize/6, 1.73*snowSize/6);
      triangle(0, 0, snowSize/2, 0, snowSize/4, 1.73*snowSize/4);
    }
    popMatrix();
  }

  // simulate the snowing effect
  void snowMovement() {
    if (y<height+snowSize) y++;
    if (y>=height+snowSize) y=0;
  }
}



//define the Snowman class
class Snowman {
  float a, b, w, h;

  Snowman(float tempa, float tempb, float tempw, float temph) {
    a=tempa;
    b=tempb;
    w=tempw;
    h=temph;
  }

  //draw the snowman
  void display() {
    fill(255);
    stroke(0);
    ellipseMode(CENTER);
    strokeWeight(1);
    ellipse(a, b, w, h);
    ellipse(a, b-0.6*h, 0.7*w, 0.7*h);
    ellipse(a, b-1.*h, 0.5*w, 0.5*h);
    strokeWeight(6);
    point(a-0.1*w, b-h);
    point(a+0.1*w, b-h);
  }

  void melting1() {
    if (mouseX<=400 && mouseY<=300) {
      h=h-0.05;
    }
    else if (mouseX>=400) {
      h=110;
    }
    if (h<=50)h=50;
  }

  void melting2() {
    if (mouseX<=400 && mouseY<=300) {
      h=h-0.05;
    }
    else if (mouseX>=400) {
      h=90;
    }
    if (h<=40)h=40;
  }

  void movement1() {
    a=a+1;
    a=constrain(a, 300, 350);
  }
  void movement2() {
    a=a-1;
    a=constrain(a, 400, 450);
  }
}

//declare my objects
Snowman snowman1;
Snowman snowman2;
Snowman snowman3;
Snow[] snowflakes = new Snow[7];


void setup() { 
  size(800, 600);
  smooth();
  //creat different sizes of snowmen to make them look like a family
  snowman1=new Snowman(300, 500, 120, 110);
  snowman2=new Snowman(450, 505, 100, 90);
  snowman3=new Snowman(380, 535, 90, 65);

  // display random snow sizes and positions
  for (int i=0;i<7;i++) {
    snowflakes[i]= new Snow(random(50, width-50), random(10, height-10), random(20, 30));
  }
}


void draw() {
  // change background color as mouse moves
  background(255-mouseX/3, 220-mouseX/4, 250-mouseX/4);


  //draw the daytime
  if (mouseX<=400 && mouseY<=300) {
    sunshine(); 
    translate(-mouseX, -mouseY);
    fill(255, 0, 0);
    ellipse(mouseX, mouseY, 50, 50);
  }

  //draw the night time
  if (mouseX>400 && mouseY<=300) {
    strokeWeight(12);
    stroke(255, 255, 0);
    ellipseMode(CORNER);
    arc(mouseX, mouseY, 50, 50, HALF_PI, PI+HALF_PI+QUARTER_PI);
    arc(mouseX+15, mouseY+9, 46, 44, HALF_PI+QUARTER_PI, PI+HALF_PI);
    arc(mouseX+10, mouseY+5, 40, 40, HALF_PI+QUARTER_PI, PI+HALF_PI);
  }

  //display the smowmen
  snowman1.display();
  snowman1.melting1();
  snowman2.display();
  snowman2.melting2();
  snowman3.display();

  //click mouse to make the snowmen come closer    
  if (mouseX>250 && mouseX<500 && mouseY>400 && mousePressed) {
    snowman1.movement1();
    snowman2.movement2();
  }




  //display the snowflakes
  for (int i=0;i<7;i++) {
    snowflakes[i].display();
    snowflakes[i].snowMovement();
  }
}

//the sunshine function is called to draw the sunshine around the sun
void sunshine() {
  strokeWeight(5);
  stroke(255, 255, 0);
  translate(mouseX, mouseY);
  for (int i=0;i<8;i++) {
    rotate(TWO_PI/8);
    line(0, 0, 40, 0);
  }
}




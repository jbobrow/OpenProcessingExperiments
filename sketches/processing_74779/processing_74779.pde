
//Following line creates an array of particle, 200 individual particles are getting displayed
Particles[] p = new Particles[200]; 

//Declaring global variables
float m1 = 1.0;
float m2 = 0.5;
int x1 = 10;
int y1 = 10;

void setup() {//Start of void setup
  size(600, 600);
  background(0);
  smooth();
  point(mouseX, mouseY);
  for (int i=0;i<200;i++) {//Start of 'for' statement
    p[i] = new Particles(0, 0, random(360));
  }//End of 'for' statement
}//End of void setup

void draw() {//Start of void draw
  background(0);
  border();
  ball();
}//End of void draw

class Particles {//Start of Class
  //Variables can only be used within this class
  float x = 0;
  float y = 0;
  float a = 0;

  public Particles (float x, float y, float a) {//Start of public Particles
    this.x= x;
    this.y= y;
    this.a= a;
  }//End of public Particles

  public void render(int posX, int posY) {//Start of void render
    int sizeX = 0;
    int sizeY = 0;
    sizeX = (width-x1);
    sizeY = (height-y1);
    pushMatrix();
    translate(posX, posY); //Moves X,Y coordinates based on mouse position.
    noStroke();
    fill(0);
    ellipse(x, y, 3, 3);
    fill(255, 255, 0);
    x+= m1 * cos(radians(a));
    y+= m2 * sin(radians(a));
    a+= random(2);
    popMatrix(); //Resets X,Y position.
  }//End of void render
}//End of Class

void ball() {//Start of void ball
  int count=0;
  int sizeX = 0;
  int sizeY = 0;
  sizeX = (width-x1);
  sizeY = (height-y1);
  if ((mouseX>x1 && mouseX<sizeX) && (mouseY>y1 && mouseY<sizeY) ) {//Start of 'if' statement
    noStroke();
    fill(0);
    ellipse(mouseX, mouseY, 20, 20);
    for (int i=0;i<200;i++) {//Start of 'for' statement
      p[i].render(mouseX, mouseY); //Renders 200 particles
      count++;
      if (count > 50) {//Start of 'if' statement
        p[i].render(mouseX, mouseY); //Renders another set of particles at a delayed time frame using 'count'
      }//End of 'if' statement
    }//End of 'for' statement
  }//End of 'if' statement
  else {//Start of 'else' statement
    noStroke();
    fill(0);
    ellipse(width/2, height/2, 20, 20);
    for (int i=0;i<200;i++) {//Start of 'for' statement
      p[i].render(width/2, height/2);
    }//End of 'for' statement
  }//End of 'else' statement
}//End of void ball

void border() {//Start of void border
  int sizeX = 0;
  int sizeY = 0;
  sizeX = (width-(2*x1)); //Creates Border Size that pulls in from the right aswell as the left position
  sizeY = (height-(2*y1)); //Creates Border Size that pulls in from the bottom aswell as the top position 
  fill(255);
  rect(x1, y1, sizeX, sizeY);
  noStroke();
  fill(0, 255, 0);
  rect(x1-5, y1-5, 10, 10);
  if (mousePressed && (mouseButton == RIGHT) && (mouseX < 250 && mouseY < 250)) {//Start of 'if' statement
    //Sets border position
    x1 = mouseX;
    y1 = mouseY;
  }//End of 'if' statement
    fill(255, 0, 0);
  textSize(35);
  text("Group 3, Hive", 50, 550, 12);
  stroke(0,255,0,50);
  noFill();
  rect(0,0,250,250);
}//End of void border



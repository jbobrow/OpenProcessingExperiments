
//Programmed by Joshua McGrath
//NMD 102
//Note: This code is VERY similar to my SEIZURE WARNING applet

//intialize an array to 'store' the cubes in
//still using static arrays
int MAX_array = 1000;
int max_cube_ammount = 0;
int cube_ammount = 0;
cube[] companion = new cube[MAX_array];


int i=0; 
float rad=25.0;

//x position of object
float x = 250;
//initial y position
float y_initial = mouseY;
//final y position
float y;

//coefficient of gravitational acceleration
float gravity = 9.87/ frameRate;
//initial velocity
float v_initial = 0;




void setup(){
  size(500,800);

  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
}

//function to change gravity by pressing UP or DOWN
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      gravity = gravity + 0.1;
    }
    else {

     
        if (keyCode == DOWN) {
          gravity = gravity - 0.1;
        }
      }

    }
  }


void draw() {
  background (255);
  frameRate(30);



  //for loop that updates the cubes as they move through space
  for (int j=0; j < i; j++)
  {

    companion[j].move();
    companion[j].make();
  }

  println(gravity);
}

void mouseReleased(){
  if( i < MAX_array)
  {
    companion[i] = new cube (mouseX, mouseY, gravity, v_initial);
    companion[i].make();
    companion[i].move();
    i++;
    println(i);
  }
}


//The class that we will use to spawn cubes, called the constructor function
class cube
{
  //these are the methods of the class
  //x position
  float x;
  //y position
  float y;
  //gravity
  float g;
  //intial y position
  float y0;
  //initial velocity
  float v0;
  //The class must be passed an x and y value, the value of gravity and
  //initial velocity
  cube(float xpos, float ypos, float gravity, float v_initial) {
    x= xpos;
    y= ypos;
    g= gravity;
    y0= ypos;
    v0= v_initial;

  }

  //function to draw the cubes
  void make() {
    stroke(0);
    //body
    fill(150);
    rect(x,y,50, 50);
    fill(230);

    //side guards on the corners
    triangle(x-27,y+27,x-9,y+27,x-27,y+9);
    triangle(x+27,y+27,x+9,y+27,x+27,y+9);
    triangle(x-27,y-27,x-9,y-27,x-27,y-9);
    triangle(x+27,y-27,x+9,y-27,x+27,y-9);

    //Rectangular embellishments on sides
    rect(x,y-24,12,6);
    rect(x+24,y, 6,12);
    rect(x-24,y, 6,12);
    rect(x,y+24, 12,6);

    //pink  bisecting lines
    stroke(255,20,147);
    line(x,y+20,x,y-20);
    line(x+20,y,x-20,y);

    //middle white circle
    stroke(0);
    fill(230);
    ellipse(x,y, 32, 32);
    //heart
    fill(255,20,147);
    noStroke();
    ellipse(x-6,y-3,15,15);
    ellipse(x+6,y-3,15,15);
    triangle(x-13,y,x+14.2,y,x+.5,y+14);

  }


  //I put all of the velocity and position equations here in my move function
  //This will be what will move the cubes
  void move(){
    //we use frameRate as our time variable
    float t = frameRate;

    //calculate velocity
    float v = v0 + (g / t);
    //reset v0 for next iteration
    v0=v;
    //calculate position based on velocity calc
    y = y0 + v0 * t;
    //reset position for next iteration
    y0=y;


    //This next segment of code will tell the cube to stop at the 'ground.'
    //Oh, this code will also make the cube bounce until it loses energy

      //if the cube goes beyond 700 set its y position to 700, this stops it initially

      if ( y0 > 700) {
      y0 = 700;

      //this will decay the cubes velocity over 'time'
      //change the number you multiply abs(v0) to change elastcity (how long it
      //takes to stop jumping)
      v0 =-sqrt(.9) * abs(v0);
    }
  }
}








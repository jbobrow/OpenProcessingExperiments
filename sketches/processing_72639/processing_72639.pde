
// Assignment 01b - The Hand
// Aderinsola Akintilo
// Sunday, September 09, 2012
// Section A 


// import ddf.minim.*;


// Global Variables
int numBalls = 1;
float spring = 0.05;
float gravity = 0.03;
float friction = -0.9;
int red = 0; 
int green = 0; 
int blue = 0; 
int counter = 0; 
Ball[] balls = new Ball[500];
Ball clicked; 
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];

// so that my piece plays music as well
Minim minim;
AudioPlayer song;

// Setup method
void setup() 
{
  size(1200, 600);
  noStroke();
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(190, 190, 190, random(width), random(height), random(60, 100), i, balls);
  }

  //  initiate the music!
//  minim = new Minim(this);
//  song = minim.loadFile("fjgur_piano.mp3");
//  song.play();
}


// change background method
void change_background()
{
  //  reset the color values
  if (red > 255)
    red = 0; 

  if (green > 255)
    green = 0; 

  if (blue > 255)
    blue = 0; 


  if (counter % 40 == 0)
  {
    red += random(1, 50); 
    blue += random(1, 50); 
    green += random(1, 50);
  }
}



// Draw method
void draw() 
{
  counter ++; 

  background(red, green, blue); 
  //  change_background(); 

  for (int i = 0; i < numBalls; i++) 
  {
    balls[i].collide();
    balls[i].move();
    balls[i].display();
  }
  change_cursor();
}


// Method that changes the cursor when you hover above it
void change_cursor()
{
  if (check_bounds())
  {
    cursor(HAND);
  }
  else
    cursor(ARROW);
}





void create_ball()
{

  if (!check_bounds())
  {
    cursor(HAND);
    numBalls+=1; 
    balls[numBalls-1] = new Ball(190, 190, 190, random(width), random(height), random(60, 100), numBalls-1, balls);
  }
}


// check to see if the mouse click is within a given ball
boolean check_bounds()
{
  for (int i = 0; i < numBalls; i++)
  {
    float d = balls[i].diameter; 
    if ( (mouseX > balls[i].x-d && mouseX < balls[i].x+d)
      && (mouseY > balls[i].y-d && mouseY < balls[i].y+d) ) 
    {
      //    store the clicked ball
      clicked = balls[i]; 
      return true;
    }
  }

  return false;
}

void drag_ball()
{
  int i; 

  if (check_bounds())
  {
    clicked.x = mouseX; 
    clicked.y = mouseY;
  }

  // check bounds for loop to see if the user is 
  // clicking on the ball...but i guess i didn't have to
  // use it

  //  for (i = 0; i < numBalls; i++)
  //  {
  //    float d = balls[i].diameter; 
  //    if ( (mouseX > balls[i].x-d && mouseX < balls[i].x+d)
  //      && (mouseY > balls[i].y-d && mouseY < balls[i].y+d) ) 
  //    {
  //      balls[i].x = mouseX; 
  //      balls[i].y = mouseY;
  //    }
  //  }
}


// change properties of the ball with the mouse click
void mousePressed()
{

  change_property();
  //  add another ball to the canvas
  create_ball();
}

// move the balls around
void mouseDragged()
{
  drag_ball();
}

void change_property()
{
  if (check_bounds())
  {
    clicked.r = int(random(255)); 
    clicked.g = int(random(255)); 
    clicked.b = int(random(255));
  }
}






// Ball Class
// found on processing.org
// http://processing.org/learning/topics/bouncybubbles.html
// Bouncy Bubbles based on code from Keith Peters. 
// added more parameters and methods


class Ball {

  // Ball variables  
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int r, g, b; 
  int id;
  Ball[] others;
  int color_mode = RGB; 


  //  Ball constructor with added rgb values
  Ball(int r, int g, int b, float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
    this.r = r; 
    this.g = g; 
    this.b = b;
    colorMode(this.color_mode);
  } 



  //  Collision method 
  void collide() {

    int chance = int(random(2, 300)); 
    for (int i = id + 1; i < numBalls; i++) {


      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;


      if (distance < minDist) { 

        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;


        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;

        //        changing color scheme and size when they collide
        if (chance % 10 == 0)
        {
          others[i].color_mode = HSB; 
          others[i].r = int(random(255));
          others[i].g = int(random(255)); 
          others[i].b = int(random(255));

          others[i].diameter = random(30, 100);
        }
        else
        {
          others[i].color_mode = RGB;
        }
      }
    }
  }



  //  Moving the balls around / falling
  void move() 
  {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction;
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction;
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }



  //  Display the balls on the canvas
  void display() 
  {

    //    original 

    smooth(); 
    noStroke(); 
    fill(this.r, this.g, this.b);
    ellipse(x, y, diameter, diameter);


    //    adding cool "after move effect"
    //    HOWEVER, this slows down the speed significantly, heats 
    //    up your CPU, and takes up some memory
    //    comment out if you want to try
    //    http://processing.org/learning/basics/storinginput.html

//            int which = frameCount % num;
//            mx[which] = this.x;
//            my[which] = this.y;
//            
//            
//            smooth(); 
//            fill(this.r, this.g, this.b);
//            
//            for (int i = 0; i < num; i++)
//            {
//              int index = (which + 1 + i) % num; 
//        
//              ellipse(mx[index], my[index], i, i);
//            }
  }
}
//  end of class


// might not be necessary
void stop()
{
  song.close();
  minim.stop();

  super.stop();
}



// Modified key pressed method
// so that i can save more than one 
// image without overwriting the previous
// versions

int save_count = 1; 
void keyPressed()
{
  if (key == 's')
  {
    save_count++; 
    String file = save_count+".png"; 
    save(file);
  }
}

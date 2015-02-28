
// An array of news headlines
String[] headlines = {
  "Being walkers with the dawn and morning",
"Walkers with the sun and morning",
"We are not afraid of night",
"Nor days of gloom",
"Nor darkness–",
"Being walkers with the sun and morning.",
"- Langston Hughes"
};
Sun sun = new Sun(color(255,0,0),300,200,-1,1);
Moon moon = new Moon(color(180,180,0),200,-20);
Night night = new Night(color(0,0,0),0,0);


int count = 0;
PFont f; // Global font variable
float x; // Horizontal location
float y;
int index = 0;

void setup() {
  size(400,200);
  f = createFont( "Arial" ,16,true);
  y= random(90,160);
  // Initialize headline offscreen
  x = width;

  
}

void draw() {
  background(255);
  fill(0);
  

  
  // Display headline at x location
  textFont(f,16);
  textAlign (LEFT);
  
  // A specific String from the array is displayed according to the value of the "index" variable.
  text(headlines[index],x,y); 


  // Decrement x
  x = x - 1;
  sun.move(-.23,-.15);
  sun.display();

  moon.display();
  night.display();
  if (index >= 2) {
    moon.move(.1,.2);
  }
  if (index >= 4) {
   night.move(.12); 
  }
 
  
  // If x is less than the negative width, then it is off the screen
  // textWidth() is used to calculate the width of the current String.
  float w = textWidth(headlines[index]); 
  if (x < -w) {
    y = random(185,190);
    x = width;
    // index is incremented when the current String has left the screen in order to display a new String.
    index = (index + 1) % headlines.length; 
  }
}
  class Moon {
    
    color c;
    float x;
    float y;
    
    Moon(color col, float x1, float y1) {
       c = col;
       x = x1;
       y = y1;
     }
    void display() {
    stroke(0);
    fill(c);
    ellipse(x,y,30,30);
    ellipse(x-5,y+7.5,4,3);
    
    }
    
    void move(float xspeed,float yspeed) {
    x = x + xspeed;
    y = y + yspeed;
    }
  }
  
  class Night {
    
    color c;
    float x;
    float y;
    
    Night(color col, float x1, float y1) {
        c = col;
        x = x1;
        y = y1;
    }
    void display() {
      stroke(0);
      fill(c);
      rect(0,y-400,500,400);
      stroke(255);
      fill(color(255,255,255));
      point(random(0,400),y-random(0,400));
      point(random(0,400),y-random(0,400));
      point(random(0,400),y-random(0,400));
      point(random(0,400),y-random(0,400));
      point(random(0,400),y-random(0,400));
      point(random(0,400),y-random(0,400));
      point(random(0,400),y-random(0,400));
      point(random(0,400),y-random(0,400));
      point(random(0,400),y-random(0,400));
      point(random(0,400),y-random(0,400));
      point(random(0,400),y-random(0,400));
      point(random(0,400),y-random(0,400));
      point(random(0,400),y-random(0,400));
      point(random(0,400),y-random(0,400));
      point(random(0,400),y-random(0,400));point(random(0,200),y-random(0,200));
      point(random(0,400),y-random(0,400));
      
      
    }
    void move(float speed) {
      y = y+speed;
    }
  }
  
  class Sun {
    color c;
    float x;
    float y;
    float xSpeed;
    float ySpeed;
    
    Sun(color col, float x1, float y1, float xsp,float ysp) {
       c = col;
       x = x1;
       y = y1;
       xSpeed = xsp;
       ySpeed = ysp;
    }
    
    void display() {
      stroke(0);
      fill(c);
      ellipse(x,y,40,40);
      ellipse(x-40, y,25 ,5 );
      ellipse(x+40, y,25 ,5 );
      ellipse(x, y-40,5 ,25 );
      ellipse(x, y+40,5 ,25 );
    }
    
    void move(float xspeed,float yspeed) {
      
      x = x + xspeed;
      y = y + yspeed;
    }
    
  }


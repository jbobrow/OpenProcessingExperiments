


// An array of news headlines
String[] headlines = {
  "Being walkers with the dawn and morning",
"Walkers with the sun and morning",
"We are not afraid of night",
"Nor days of gloom",
"Nor darkness\u2013",
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

public void setup() {
  size(400,200);
  f = createFont( "Arial" ,16,true);
  y= random(90,160);
  // Initialize headline offscreen
  x = width;

  
}

public void draw() {
  background(255);
  fill(0);
  

  
  // Display headline at x location
  textFont(f,16);
  textAlign (LEFT);
  

  text(headlines[index],x,y); 


  // Decrement x
  x = x - 1;
  sun.move(-.23f,-.15f);
  sun.display();

  moon.display();
  night.display();
  if (index >= 2) {
    moon.move(.1f,.2f);
  }
  if (index >= 4) {
   night.move(.12f); 
  }
 

  float w = textWidth(headlines[index]); 
  if (x < -w) {
    y = random(185,190);
    x = width;

    index = (index + 1) % headlines.length; 
  }
}
  class Moon {
    
    int c;
    float x;
    float y;
    
    Moon(int col, float x1, float y1) {
       c = col;
       x = x1;
       y = y1;
     }
    public void display() {
    stroke(0);
    fill(c);
    ellipse(x,y,30,30);
    ellipse(x-5,y+7.5f,4,3);
    
    }
    
    public void move(float xspeed,float yspeed) {
    x = x + xspeed;
    y = y + yspeed;
    }
  }
  
  class Night {
    
    int c;
    float x;
    float y;
    
    Night(int col, float x1, float y1) {
        c = col;
        x = x1;
        y = y1;
    }
    public void display() {
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
      point(random(0,400),y-random(0,400));
      point(random(0,200),y-random(0,200));
      point(random(0,400),y-random(0,400));
      
      
    }
    public void move(float speed) {
      y = y+speed;
    }
  }
  
  class Sun {
    int c;
    float x;
    float y;
    float xSpeed;
    float ySpeed;
    
    Sun(int col, float x1, float y1, float xsp,float ysp) {
       c = col;
       x = x1;
       y = y1;
       xSpeed = xsp;
       ySpeed = ysp;
    }
    
    public void display() {
      stroke(0);
      fill(c);
      ellipse(x,y,40,40);
      ellipse(x-40, y,25 ,5 );
      ellipse(x+40, y,25 ,5 );
      ellipse(x, y-40,5 ,25 );
      ellipse(x, y+40,5 ,25 );
    }
    
    public void move(float xspeed,float yspeed) {
      
      x = x + xspeed;
      y = y + yspeed;
    }
    
  }



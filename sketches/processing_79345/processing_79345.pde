
//starting angle
float theta=0.0;
float r=20;
float g=255;
float b=255;

//Box myBox;


void setup(){
  size(800,200);
  smooth();
   background(0);
frameRate(50);

// myBox= new Box();
}

void draw(){
  
  // Increment theta (try different values for "angular velocity" here)
 // myBox.display();
 // myBox.move();
  
  theta+=0.02;
  stroke(255);
  noFill();
 //fill(RGB,r,g,b);
  
  float x=theta;
  // a simple way to draw the wave with an ellipse at each location
  for (int i=0; i<=90; i++){
    //calculate y value based off of sine function
    float y=sin(x)*height/2;
    // draw an ellipse
    rect(i*10, y+height/2, 16,800,20);
    // move along x-axis
    x+=0.2;
  }
}

/*class Box{
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Box(){
    c=color(0);
    xpos=width/2;
    //ypos=height/2;
    ypos=random(1,100);
    xspeed=1;
  }
  
  void display(){
    rectMode(CENTER);
    fill(c);
    rect(xpos,ypos,20,10);
  }
  
  void move(){
    xpos=xpos+xspeed;
    if(xpos>width){
      xpos=0;
    }
  }
}*/
void mousePressed(){
  background(random(0,10));
 // myBox.display();
// myBox.move();
}



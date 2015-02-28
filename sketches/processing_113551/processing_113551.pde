
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}// declare objects of the Car class 
Circle circle1; 
Circle circle2;  

void setup() { 
  size(600,600); 
//frameRate(10);
  // initialise the objects. 
  // pass parameters to constructor 
  circle1 = new Circle(45, color(255,0,0),width/2 ,width/2 ,1, 2.5, 2.5);  
  circle2 = new Circle(45, color(0,0,255),width/2 ,width/2,2, 2.5, 2.5); 
} 

void draw() {
  background(255); 
  circle1.display(); 
  circle1.drive(); 
  circle2.display();
  circle2.drive();  
} 

// create the class 
// one class, multiple objects 
class Circle {  
  float a;
  color c; 
  float xPos; 
  float yPos; 
  float xSpeed;
 float xChange = cos(radians(a)); 
float yChange = sin(radians(a));  


  // The Constructor is defined with arguments. 
  // Create temp varibales that are used within the function. 

  Circle(float temp_a, color temp_c, float temp_xPos, float temp_yPos, float temp_xSpeed, float xChange, float yChange) {  
   a = temp_a;
   c = temp_c; 
    xPos = temp_xPos; 
    yPos = temp_yPos; 
    xSpeed = temp_xSpeed; 
     xChange = cos(radians(a)); 
 yChange = sin(radians(a));  
  } 
 
  // show the object on the screen 
  void display() { 
    stroke(0); 
    fill(c); 
    rectMode(CENTER); 
    rect(xPos,yPos,20,10); 
  } 
  
  // move object on the screen 
  // use realistic and sensible names 

  void drive() { 
a=a+1; 

float xChange = cos(radians(a)); 
float yChange = sin(radians(a)); 

float prevX = xPos;
float prevY = yPos;

xPos += xChange * 2.5 ; 
yPos += yChange * 2.5 ; 

if (xSpeed == 2){
  xPos = ((xPos-prevX)/2)+prevX;
  yPos = ((yPos-prevY)/2)+prevX;
  
  println("test");
}

    } 


  }

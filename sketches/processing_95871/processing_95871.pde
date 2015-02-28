
// Circles, these are the circle objects that will form the moving ellipses
Circle Circle1;
Circle Circle2;
Circle Circle3;
Circle Circle4;
Circle Circle5;
Circle Circle6;
Circle Circle7;
Circle Circle8;
Circle Circle9;
Circle Circle10;
Circle Circle11;
Circle Circle12;
Circle Circle13;
Circle Circle14;
Circle Circle15;
Circle Circle16;
Circle Circle17;
Circle Circle18;
Circle Circle19;
Circle Circle20;
Circle Circle21;
float bgcol = 125; //this initializes a variable for one of the background colour values

void setup() {     //setting up the sketch window
  size(1200,800);  //Size of the window
  smooth();        //Anti-aliasing

  //The parameters for the circle objects go inside the parenthesis which will be called from the constructor arguments below.
  Circle1 = new Circle(color(255,123,0,200),0,0,1); 
  Circle2 = new Circle(color(255,123,0,200),0,40,2);
  Circle3 = new Circle(color(255,123,0,200),0,80,3);
  Circle4 = new Circle(color(255,123,0,200),0,120,4);
  Circle5 = new Circle(color(255,123,0,200),0,160,5); 
  Circle6 = new Circle(color(255,123,0,200),0,200,6);
  Circle7 = new Circle(color(255,123,0,200),0,240,7);
  Circle8 = new Circle(color(255,123,0,200),0,280,8);
  Circle9 = new Circle(color(255,123,0,200),0,320,9); 
  Circle10 = new Circle(color(255,123,0,200),0,360,10);
  Circle11 = new Circle(color(255,123,0,200),0,400,11);
  Circle12 = new Circle(color(255,123,0,200),0,440,10);
  Circle13 = new Circle(color(255,123,0,200),0,480,9); 
  Circle14 = new Circle(color(255,123,0,200),0,520,8);
  Circle15 = new Circle(color(255,123,0,200),0,560,7);
  Circle16 = new Circle(color(255,123,0,200),0,600,6);
  Circle17 = new Circle(color(255,123,0,200),0,640,5);
  Circle18 = new Circle(color(255,123,0,200),0,680,4);
  Circle19 = new Circle(color(255,123,0,200),0,720,3);
  Circle20 = new Circle(color(255,123,0,200),0,760,2);
  Circle21 = new Circle(color(255,123,0,200),0,800,1);
}
//The main draw method
void draw() { 
  background(125,bgcol,100); //setting the background colour
  
  //the "circle.display/drive will call the drive and display methods below,
  //the display method will place the ellipses, the drive method will then move it to its new coordinates.
  Circle1.drive();
  Circle1.display();
  Circle2.drive();
  Circle2.display();
  Circle3.drive();
  Circle3.display();
  Circle4.drive();
  Circle4.display();
  Circle5.drive();
  Circle5.display();
  Circle6.drive();
  Circle6.display();
  Circle7.drive();
  Circle7.display();
  Circle8.drive();
  Circle8.display();
  Circle9.drive();
  Circle9.display();
  Circle10.drive();
  Circle10.display();
  Circle11.drive();
  Circle11.display();
  Circle12.drive();
  Circle12.display();
  Circle13.drive();
  Circle13.display();
  Circle14.drive();
  Circle14.display();
  Circle15.drive();
  Circle15.display();
  Circle16.drive();
  Circle16.display();
  Circle17.drive();
  Circle17.display();
  Circle18.drive();
  Circle18.display();
  Circle19.drive();
  Circle19.display();
  Circle20.drive();
  Circle20.display();
  Circle21.drive();
  Circle21.display();

 
}
// Even though there are multiple circle objects, only one class is needed. 
class Circle { 
  color c;       //variable for the colour of the circles
  float xpos;    //the X posistion
  float ypos;    //the Y posistion
  float xspeed;  //the speed at which the ellipses move
  float speedmult = 1;  //the speed multiplier(to be controlled with left/right keys)
 

  //the circle constructor is defined with arguments, which is the order that the parameters are in the objects above.
  Circle(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() { //the display method that is called in the main draw method
    noStroke();    //turning the stroke off
    fill(c);       //setting the fill to the colour variable
    ellipseMode(CENTER);  //centering the ellipses on their coordinates
    ellipse(xpos,ypos,mouseX/8,mouseY/8);  //the size of the ellipses is determined by the position of the mouse
   
  }

  void drive() {                      //the drive method that is called in the main draw method
    xpos = xpos +(xspeed*speedmult);  //this is what moves the X coordinates along
    if(xpos>=1200){                    
      xpos = 0;
      }                              //these if statements ensure that the ellipses move to the other
      if(xpos<0){                    //end of the window one they reach the extreme left or right edges.
        xpos = 1200;
      }  
    
  if(keyPressed) {                    //these if kepressed statements allow for the changing of the                   
    if (key == CODED) {               //speedmult variable which speeds the ellipses up, moving right when the value is positive and left when the value is negative
    if (keyCode == LEFT) {
          speedmult = speedmult-0.01; //using 0.01 makes the speed change more gradual than using whole numbers
          bgcol = bgcol-0.03;         //this makes the background change allong with the speed
        } 
    else if (keyCode == RIGHT) {
          speedmult = speedmult+0.01;
          bgcol = bgcol+0.03;
     } 
    } 
   }
  }
 }
      
  




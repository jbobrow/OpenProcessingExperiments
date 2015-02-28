



//The Global Variables:  

int g=0;



int value=0;

int plus1=0;

int k=0;

//w is the y value of the left paddel
float w = 0;

//s is the y value of the right paddel
float s=0;

// circle_x is the x value of the ellipse
float circle_x = 0;

//circle_y is the y value of the ellipse
float circle_y = 0;

//Variables x and y are added to circle_x and circle_y in order to create a change value.  Also, this allows the x and y values to be made into negatives more easily

float x = 3;
float y = -2;

//n is a variable that allows the sine to change
float n = 0;

void setup() {

//Creates a screen size of 500 by 500 pixels
  size (500, 500);
  
  
 //Tells the program to no make strokes
noStroke();
}

void draw() {
    
    //Text
    text(k,480,15);
    text(g,10,15);
    // Local Variable a is a value that uses sine to make a "smooth random" number
    
    
   float a=map(sin(n)*sin(n*0.45)*sin(n*1.2),-1,1,50,255);
 
 //Changes the value of n each time
   n = n+0.01;
   
   //Tells the program to make the next shape of black color, with an opacity of 20, creating a fading affect
fill(0,20);

//Creates a rectangle across the screen
rect(0,0,width,height);


  //Left Player

//Creating Controls
  if (keyPressed) {

//Tells the program that if "s" is pressed the left paddel will move down
    if (key=='s') {
      w=w+4;
      }
      
    //Tells the program that if "w" is pressed the left paddel will move up
    if (key=='w') {
      w=w-4;

      }


    //Right Player

//Tells the program that if "l" is pressed the right paddel will move down
    if (key=='l') {
      s=s+4;
    
    }

//Tells the program that if "o" is pressed the right paddel will move up
    if (key=='o') {
      s=s-4;
    }
  }

//Creates a fill that makes a red color relative to a
fill(a,0,0);

//Creates the circle
  ellipse (circle_x, circle_y, 50, 50);

//Makes circle_x and circle_y a changing value, giving movement to the ball
  circle_x= circle_x + x;
  circle_y = circle_y + y;



//Allows the ball to bounce off the bottom of the screen
  if (circle_y > height) {

    circle_y = height;
    y = -y;
fill(a,0,0);
  }

//Allows the ball to bounce off the right of the screen.
if(circle_x > width) {
k=k+1;
  circle_x = width;
  x = -x;
  
}

 //Allows the ball to bounce off the left of the screen
if(circle_x <0){
 g=g+1;
  circle_x = 0;
  x = -x;
fill(a,0,0);
  
}
//Allows the ball to bounce off the top of the screen

  if (circle_y<0) {

    circle_y = 0;
    y = -y;
fill(a,0,0);
  }
  
  
//Right paddel
//Allows the ball to bounce off the right paddel

//If circle_x reaches the location of the paddel, 
  if (circle_x>450) {
      
      //If circle_y is hits paddel
    if (circle_y>s+150) {
      if (circle_y<s+200) {
          
          //
        x=-x;
  
      
        
        
      }
    }


  }
  plus1=plus1+1;
  //Left Paddel
//Allows the ball to bounce off the left paddel
//If circle_x reaches the location of the paddel, 

  if (circle_x<40) {

//If circle_y is hits paddel
    if (circle_y<w+200) {
      if (circle_y>w+150) {
        x=-x;
        value=value+1;
      }
    }


  }
  
  if(value==1){
      ellipse(20+plus1,150+w+plus1,50,50);
      }
  
  
  //Creates the left paddel
  rect(20, w+150, 10, 50);
  //Creates the right paddel
  rect(480, s+150, 10, 50);
  
  //States that if all conditions == true, then the statement occurs
  if((circle_x>450) && (circle_y>s+150) && (circle_y<s+200)){

//this was used as a test to show that it occurs only once when the circle hits the paddel
    fill(a,0,0);
        ellipse(circle_x,circle_y,120,120);
     
    }
    
}

//Need multi key 



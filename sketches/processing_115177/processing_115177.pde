
//Declaring Variables
float r; 
float g;
float b;
float circle_y;
float circle_x;

void setup() {  //setup function 
  size(600, 600);
  }

void draw() {  //draw function loops 
   fill (40,250,103); //draw circle
    noStroke();
    getcircle_x();
    getcircle_y();
    
    circle(circle_x, circle_y);
    
      if (mousePressed == true) {  //If statement for clicking on circle


if (dist(pmouseX, pmouseY, circle_x, circle_y) <=25) {  //Ends program if mouse clicks circle
   exit();
}
    }
  
    }
   
float getcircle_x()  //Moves circle to random position
{
  circle_x = random(600);
  return  circle_x;
}

float getcircle_y()
{
     circle_y=random(600);
     return circle_y;
     
}
void circle (float circle_x, float circle_y){  //Changes the colour of the background everytime circle moves
    r=random(255);
    g=random(100);
    b=random(255);
    
    background(r,g,b);
    
    ellipse(circle_x,circle_y,50,50);
}



//This definition creates a psychadelic expanding triangle of random colurs

float a=100;
float b=100;
float c=100;
float d=100;
//Define 4 variables and begin at 100, to ensure they all begin at the centre of the page

void setup(){
 size(200,200); 
 //Set the canvas size to 200x200px
}


void draw(){

  float r=random(255);
  float r2=random(255);
  float r3=random(255);
  //Generate 3 random numbers between 0 and 255 for the RGB stroke
  
  noFill();
  //Specify the triangles to not be filled in
  
  stroke(r,r2,r3);
  //Create the random stroke RGB colour
  
  triangle(100,a,b,b,c,d);
  //Draw the triangle, with the values tied so that changes in the number will cause the 
  //3 points that create the triangle to move in the desired directions
  
  a-=5;
  b+=5;
  c-=5;
  d+=5;
  //Modify the variables and thus the movement by increasing and decreasing the relevant values
  
}
  



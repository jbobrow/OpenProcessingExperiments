
// All Examples Written by Casey Reas and Ben Fry

// unless otherwise stated.
/*
ideas: put eyes on the snake
put into 3D
ask user to modify variable

*/


int num = 100;//
int num1 =num*14;//set int variable to 100 sets size of circle /ellipse
float mx[] = new float[num];//declare the variables// float ex:3.2345 int =9
float my[] = new float[num1];

void setup() 
{
  size(200, 200);//size of window
  smooth();
  noStroke();
  //fill(mouseX, mouseY,mouseX); 
}

void draw() //called one in sketch
{
  background(mouseY); 
  
  // Reads through the entire array
  // and shifts the values to the left
  for(int i=1; i<num; i++) {
    mx[i-1] = mx[i];
    my[i-1] = my[i];
  } 
  // Add the new values to the end of the array
  mx[num-1] = mouseX;
  my[num-1] = mouseY;
  
  for(int i=0; i<num; i++) {
fill (0,90,0);  //this is green 
    ellipse(mx[i], my[i], i/2, i/2);//ellipse(x, y, width, height)
    fill (255,8,0);    //this is red
    ellipse (mx[i], my[i], i/4, i/4);
fill (255,8,0);    //this is red
    ellipse (mx[i], my[i], i/i-1, i/i-1);
  }
}                                               

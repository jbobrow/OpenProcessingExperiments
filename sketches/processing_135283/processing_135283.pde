
//Math 1 - Arithmetic, Functions
//Exercise #3
/*3. Explore the functions for constraining numbers. Use min() and 
max() to draw a regular pattern of lines from a sequence of 
irregular numbers. */

float x = 1;
float y = 400;

void setup() {
  size (400, 1000);
}

void draw () {
background (0);
  
  x=x+5;
  y= y-5;
float a = min(x, y); // Assign 5 to u
float b = max(x, y); // Assign -4 to y

  rect(a,b, a, b);
if (b> 400){
  y=400;
  x=1;
}

  println(a,b);
}




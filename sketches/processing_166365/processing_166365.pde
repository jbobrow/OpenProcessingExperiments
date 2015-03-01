
float a=0;
int b=0;
int c=0;
//define three variables

void setup(){ 
 size (200,200);
 //set screen size to 200x200px
}

void draw(){
  
 noFill();
 //declare the ellipse to be unfilled
 ellipse(a,a,b,b);
 //draw the ellipses
 line(c,0,c,200);
 line(0,c,200,c);
 //drawing two sets of lines to create the grid behind
 stroke(0,0,a);
 //increasing the intensity of the blue change 
 a++;
 b++;
 c=c+3;
 //increasing the variables by different values to enlarge and displace the ellipses, and move the 
 //lines in sequence to create the grid
}



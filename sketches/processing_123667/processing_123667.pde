
int n=1; // a counter

void setup() {
  size(960, 120);
  background(0);
  frameRate(25);
}
float x=width/6;
float y=height;
float xchange=1;
float ychange=1;
float t=20;

void draw()

{
    t = random(10, 50); //randomize opacity of line
    stroke(#A7D9EF, t);
    x+=random(3,5) *xchange; //add 3, 4 or 5 to x, then reverse when x is 0 or greather than 1/3 width
    y+=random(3,5) *ychange;
 
//light 1
    line(width/6, height, x, y);
//light 2
    line((width/6)*2, height,(width/6)+x, y);
//light 3
    line((width/6)*3, height,((width/6)*2)+x, y);
//light 4
    line((width/6)*4, height,((width/6)*3)+x, y);

  if (x<0||x>width/3) {
    xchange*=-1;
  }
  
  if (y<0||y>height) {
    ychange*=-1;
  }  
  
// counter moves ahead 
  n=n+1;
   if (n>300){
    background(0);  //flash the lights off and restart them
    // reset counter
    n=1;
   } 
   
}
  

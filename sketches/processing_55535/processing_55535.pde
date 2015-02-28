
/* Code by Julia Grzeskowiak
York/Sheridan Joint Program in Design */
//reference: Suvani Suri - http://www.openprocessing.org/sketch/24520 //

float a= 1;          //set variables 
float e =300;
float f = 0.001;

void setup()
{
  size(500, 500);
  smooth();
  noStroke();
  rectMode(CENTER);   //set rectangle mode to center adjustment
  }
  
void draw()
{
  background(255);
  translate(width/2, height/2);    // translate width and height of canvas divided by 2: (500/2,500/2) = (250,250)
  
  a += f;                          // a add increments of f (0.001)
for(int j = 50; j < 150; j += 2)   // assign variable j to 50; j is less than 150; j increases by increments of 2) when:
  {
   if (mousePressed == true) {    // if mouse is pressed, 'a' will rotate 
     rotate(a);
  } 
    fill(color(255,255,157,15));   // fill colours R=255, G=255, B=157, opacity= 15
    rect(10,10,e-70,e-70);         // (x,y, width, height)
  }
  for(int e = 20; e < 150; e += 2)  // assign variable e as 20; e is less than 150; e increases by increments of 2) when:
  {
    if (mousePressed == true) {     // if mouse is pressed, 'a' will rotate 
      rotate(a);
   }
    fill(color(255,97,140,30));    // fill colours R=255, G=97, B=140, opacity= 30
    rect(100,100,e,e);             // (x,y, width, height) 
  }
}


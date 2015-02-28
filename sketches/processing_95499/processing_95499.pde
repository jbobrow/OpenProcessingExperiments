
//Jessica Xiao Yang
//April 7,2013
//SIN COS ASSIGNMENT




float xOff = 0;
float intcre = 0;

void setup() {
  size(600, 600);
 background(204,207,206);
}


void draw() {
stroke(255,255,255,150);
  fill(random(255),207,206,200);
   if(mousePressed==true){
      fill(255,255,255,50);
 
    }
  float yOff = cos(intcre*600) *100;
  float xOff = sin(intcre) *100;
  ellipse(xOff+300, 300 + yOff, 30,30);
  intcre += .05;
  xOff +=5;
  if (xOff > width) xOff=0;
  

 
  }

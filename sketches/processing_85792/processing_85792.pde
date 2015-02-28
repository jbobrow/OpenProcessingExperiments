
float[] x = new float[10];
float[] y = new float[10];
int i;

 
void setup() {
  size(500,500);
  colorMode(HSB,1);
  smooth();
  noStroke();
  noCursor();
   
//  for(int i = 0; i<x.length; i++) {
//    x[i] = 0;
//    y[i] = 0;
//  }
   
}
void draw() {
   

  
  float bgcolor = mouseX;
  float bgopacity = mouseY;
  float m1 = map(bgcolor,0,width,0,1);
  float m2 = map(bgopacity,0,height,150,255);
  float m3 = map(mouseX,0,width,0,1);
  float m4 = map(mouseY,0,height,1,0);
  
  background(m1, .5, 1);
   

  for(int i = 0; i<x.length-1; i++) {

    x[i] = x[i+1];
    y[i] = y[i+1];
     
  fill(m4,0,m3,m4);


 ellipse(x[i], y[i], 3*i, 3*i);
//   translate(x[i],y[i]);
//   rotate(45, x[i], y[i],0);
//   box(50);

      
     
  }
   

  x[x.length-1] = mouseX;
  y[y.length-1] = mouseY;

   
}




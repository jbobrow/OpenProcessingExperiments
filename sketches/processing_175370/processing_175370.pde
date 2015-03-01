
/*input 
MOUSE
Move mouse to draw a curve

 KEYs
 Press the following buttons to switch the color of your brush:
 r || R - red
 o || O - orange
 b || B - brown
 y || Y - yellow
 
*/

//Photo image
PImage frui;

//Global variables
int num = 100; // by increasing num you will increase the thickness and the lifetime of your brush
float mx[] = new float[num];
float my[] = new float[num];

// Setup block
void setup(){
  size(800,600);
  noStroke();
  fill(#FF7300); 
  frui= loadImage("frui.jpg");
}

//Drawing block
void draw(){
  background(#518386); 
  image(frui,0,0,400,600);
  
  textSize(52);
  textAlign(CENTER);
  text("New tools", width/2,70);

  
  // Cycle through the array, using a different entry on each frame. 
  // Using modulo (%) like this is faster than moving all the values over.
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
   for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    ellipse(mx[index], my[index], i/2, i/2);
  }
}

//Key input
void keyPressed() {
  
  if (key=='r' || key=='R')   fill(#FF0303); 
  if (key=='b' || key=='B')   fill(#692205);  
  if (key=='o' || key=='O')   fill(#FF7300); 
  if (key=='y' || key=='Y')   fill(#FFC30D);    
}




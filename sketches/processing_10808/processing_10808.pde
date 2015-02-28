
void setup ()
{
  size (500,500); // window 500x500
  background(0);  // black
  smooth();
  loop();
 stroke(255);   // white
}
int a = 255; int b = 128; int c = 0;

int y = 1; int x = 1;

void draw ()
{
  y = y + 1;
  x = x + 1;
  if (y > 200 && x > 200){
  y =20; x =20; // loop
}
  background(c);  // black
  fill(a,0,0);
  // Center Elipse red color
  ellipse (height/2,width/2,20, 20+y);
  ellipse(height/2,width/2, x+20,20);
  //Left up Elipse
  fill(b,b,b);
  ellipse(120,120,20,20+y);
  ellipse(120,120,x+20,20);
  // Right up Elipse
  fill(c,c,a);
  ellipse(380,120,20,20+y);
  ellipse(380,120,x+20,20);
  //  left down Elipse
  ellipse(120,380,20,20+y);
  ellipse(120,380,x+20,20);
  //  right down Elipse
  fill(b,b,b);
  ellipse(380,380,20,20+y);
  ellipse(380,380,x+20,20);
  // change color if key pressed 
  if (keyPressed){
    a = 90;
    b = 200;
    c = 145;
  }
  //change color if mouse pressed
  if (mousePressed){
   a = 255;
  b = 128;
 c = 0; 
  }
}



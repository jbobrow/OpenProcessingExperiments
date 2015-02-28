

float g = 1;
float s = 60;
boolean isSin = true;
boolean isCos = false;
boolean isTan = false;

void setup() {
  size(900,350);
  frameRate(30);
}

void draw() {
  //background(0);
  background(255,239,174);
  rectMode(CENTER);
  smooth();
  noStroke();
  

  for(int x=-150; x<1200; x+=10) {
     if (isSin) {float y=sin(radians(g*x+frameCount)*0.9)*s;
         float col=x/4.3;
      //fill(0,194,213,30);
     fill(255-col,col,0,50);
        ellipse(x,y+120,y,y);
        fill(0+col,255-col,0,50);
        ellipse(x-200,y+220,y,y);}
        if (isCos) {float y=cos(radians(g*x+frameCount)*0.9)*s;
         float col=x/4.3;
      //fill(0,194,213,30);
     fill(255-col,col,0,50);
        ellipse(x,y+120,y,y);
        fill(0+col,255-col,0,50);
        ellipse(x-200,y+220,y,y);}
        if (isTan) {float y=tan(radians(g*x+frameCount)*0.9)*s/8;
         float col=x/4.3;
      //fill(0,194,213,30);
     fill(255-col,col,0,80);
        ellipse(x,y+120,y,y);
        fill(0+col,255-col,0,80);
        ellipse(x-200,y+220,y,y);}
     

      }
    }
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
	g += 0.05;
    else if (keyCode == DOWN)
	g -= 0.05;
    else if (keyCode == LEFT)
	s -= 1;
    else if (keyCode == RIGHT)
	s += 1;}
//  if(key==' ') {
//   background(255,239,174);
//   redraw();
// }


   if(key == 's') isSin=!isSin; 
   if(key == 'c') isCos=!isCos; 
   if(key == 't') isTan=!isTan; 

}



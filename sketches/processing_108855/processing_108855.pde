
float x, y, wd, ht, mx, my;

void setup()
{
  size(400,400);

 background(200,200,0);
//  fill(0,0,255);
  x = 0;
  y = 0;
  wd = width*.6;
  ht = height*.4;
 // pM = 80;
  
  
  noStroke();
}

void draw()
{
  mx = mouseX;
  my = mouseY;
  textSize(10);
  fill(255);
  text("Click Mouse to Draw", 280, 380);
  text("Press Any Key to Clear", 280, 392);
  smooth(); 
  noFill();
  stroke(random(0,255), random(0,255), random(255));
  ellipse(mx, my, random(0,50),random(0,50));
  if (mousePressed == true) {
stroke(random(230,255), random(230,255), random(255));
curve(x, y, wd, ht, mx,my, wd*4, ht*4 );
//stroke(random(255), random(255), random(255));
//curve(x, y, wd, ht, wd*2, ht*2, mx,my);
//stroke(random(255), random(255), random(255));
//curve(x, y, wd, ht, wd*2, ht*2, mx,my);
  }else {
  }
}
  
void keyPressed(){
  background(200,200,0);
}



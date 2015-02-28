
 boolean re = false;
 float y = 10;
 float x = 150;
        
void setup() 
{
  size(300, 600);
  background(0);
  frameRate(500);
  noStroke();
  ellipseMode(CENTER);  
  smooth();
}

void draw()
{
  fill(0);
  rectMode(CENTER);
  rect(width/2, height/2, width, height);
  fill(200, 255, 0);
  rect(mouseX, mouseY, 30, 3);
  ellipse(x, y, 30, 30);

if(mouseX > x-20 && mouseX < x+20 & mouseY > y-1 && mouseY < y+1 ) 
{re=true; }
if(y < 0) {re=false;}   
if(y > height) {x=150; y=0; } 
if(re) {y = y-1;} else{y = y+1;}
}


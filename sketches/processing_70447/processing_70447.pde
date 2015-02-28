

float b1x,b1y,b2x,b2y;
float speed1x,speed1y,speed2x,speed2y;
boolean noTrace=false;
int weight=1;
int bgColor=0;
void setup()
{
  smooth();
  size(500,500);
  b1x=random(1,499);
  b1y=random(1,499);
  b2x=random(1,499);
  b2y=random(1,499);
  speed1x=random(1,3);
  speed1y=random(1,3);
  speed2x=random(1,3);
  speed2y=random(1,3);
  background(bgColor);
}


void draw()
{
    strokeWeight(weight);
    if(noTrace) background(bgColor);
    
    stroke(0,0,0,0); //make the moving point invisible
    
    point(b1x,b1y);
    if(b1x+speed1x > 499 || b1x+speed1x < 1) speed1x*=-1;
    b1x+=speed1x;
    if(b1y+speed1y>499 || b1y+speed1y<1 ) speed1y*=-1;
    b1y+=speed1y;

    point(b2x,b2y);
    if(b2x+speed2x > 499 || b2x+speed2x < 1) speed2x*=-1;
    b2x+=speed2x;
    if(b2y+speed2y>499 || b2y+speed2y<1 ) speed2y*=-1;
    b2y+=speed2y;

    //draw line btw two points    
    stroke(((b1x+b2x)/2)*245/500+5,((b1y+mouseY)/2)*245/500+5,((mouseX+b2y)/2)*245/500+5,180);
    line(b1x,b1y,b2x,b2y);
}


void mousePressed()
{
  weight+=2;
  if(weight>5) weight=1;
}

void keyPressed()
{
  //left line trace or not;
  noTrace=!noTrace; 
}



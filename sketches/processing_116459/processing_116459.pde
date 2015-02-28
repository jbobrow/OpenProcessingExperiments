
void setup()
{
  background(0,0,0);
  size(600, 600);
  rectMode(CORNERS);
  frameRate(120);
}
int f2 = 1;
int f1=1;
float p=0;
int t=0;
float x ;
float y ;
float x2;
float y2;
String s;
int precision = 610;

int r=150;
int g=150;
int b=150;


void draw()
{
  constrain(r,0,255);
  constrain(g,0,255);
  constrain(b,0,255);
  constrain(precision,0,600);
  y2 = y;
  x2 = x;
  noStroke();
  fill(0);
  rect(0,0,600,600);
  t ++ ; 

  stroke(r,g,b);
  strokeWeight(2);
  noFill();
    beginShape();
    
    for (int pas=0; pas < precision; pas++){
      
    x = 200*sin(f2*map(pas,0,600,0,2*PI))+300;
    y = 200*sin(p+f1*map(pas,0,600,0,2*PI))+300;
    vertex(x,y);
    }
    endShape();
  fill(255);
  if (t == 600)
  t=0;
  s = "Frequence 1: " + f1 + "  Frequence 2: " + f2 + "  Phase : " + p + "  R : "+ r + "  G : " + g + "  B : " + b; 
  text(s, 50,50);
  p = 1.5*map(mouseX,0,600,0,2*PI);
  
}

void keyPressed ()
{
  
  if (key == 'r')
  r = r+10;
  if (key == 'g')
  g = g+10;
  if (key == 'b')
  b = b+10;
  if (key == 't')
  r = r-10;
  if ( key == 'h')
  g = g-10;
  if (key == 'n')
  b = b-10;
  if (keyCode == UP)
  f1++ ;
  if (keyCode == DOWN)
  f1-- ;
  if (key=='2')
  f2++ ; 
  if (key=='1')
  f2 -- ;
  if (keyCode == RIGHT)
        precision = precision + 50 ;
        if (keyCode == LEFT)
        precision = precision - 50 ;
}


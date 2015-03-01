
float seconds;

void setup()
{
  size(800,800);
  seconds = second();
  colormode(HSB,255);
}

void draw()
{
  noStroke();
  fill( 255-(hour()+1)*(255/24), 255-(minute()+1)*(255/60), 255-(second()+1)*(255/60),20);
  rect(0,0,height,height);
  clock();
  //if (frameCount%2==0 & !(loop)) saveFrame("circle-###.gif");
}

void clock()
{  pushMatrix();
  
  translate(height/2, width/2);
  seconds = second();
  rotate( radians((seconds+1)*6) );
  noStroke();  
  smooth(8);
  fill(((hour()+1)*(255/24)), ((minute()+1)*(255/60)), ((second()+1)*(255/60)));
  triangle(0,-25,20,-400,-20,-400);
  popMatrix();
}


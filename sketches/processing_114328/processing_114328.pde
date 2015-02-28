
int x;
int y;


void setup()
{
  size(400,400);
  background(167,234,73);
  
}

void draw()
{
  
  for(x=0; x<width; x+=34){
    for(y=0; y<height; y+=34){
  
 //background(167,234,73);
   
  fill(54,98,7);
  noStroke();
  ellipse(x+20,y+20,25,25);
  fill(255,201,21);
  ellipse(x+20,y+20,10,10);
  fill(219,0,121,150);
  ellipse(x+10,y+10,15,15);
  ellipse(x+30,y+10,15,15);
  ellipse(x+10,y+30,15,15);
  ellipse(x+30,y+30,15,15);
  
  strokeWeight(2);
  stroke(255,122,21);
  line(x+10,y+10,x+30,y+30);
  line(x+30,y+10,x+10,y+30);
  
    }
  }
}





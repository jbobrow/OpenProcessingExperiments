
float a=0;
float b=0;
float c=255;
float d=random(50);

void setup()
{ 
  background(255);
  size(800, 800);

  noStroke();
  translate(width/2, height/2);
  scale(1, -1);
  drawline3(10, 2, 5, 50);
}


void drawline3(float x, float y, float xx, float yy )
{  
  fill(c);
  //line(x, y, xx, yy);
  rect(x, y, xx, yy);
  ellipse(x+10, y+5, xx, yy+d);
  ellipse(x+30, y+49+d, xx*10/10, yy/10);

  a+=1; //rotate
  c--; //color


  b+=10; //control amount


  rotate(radians(10+a));


  if (b<3000) { 

    drawline3(x+1, y+1.5, xx, yy);
  }
}




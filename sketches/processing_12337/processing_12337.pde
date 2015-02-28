
float hexagonSize=30;
float a, b, c; 
int width=900;
int height=500;
/// perlin
float t = 0.0;
float inc = 0.06;

void setup()
{
  size(width,height);
  background(0);
  c = hexagonSize; //28
  b = hexagonSize/2; //14
  a = sqrt((c*c)-(b*b)); //14sqrt3
  smooth();
}

void draw()
{


}

void mouseMoved()
{
  //  int q=int(random(-1,1));
  float per = noise(t)*500;//*q;
  t += inc;

  colorMode(HSB);

  for(float v=0;v<height+10;)
  { 
    int count=0;
    for( float u=0;u<width+10;)
    {
      pushMatrix();
      if(sqrt(sq(mouseX-u)+sq(per-v))<hexagonSize)
      {
        translate(u,v);
        float r=random(255);
       // fill(random(100,200),random(220,255),random(100,255),random(150,255));
        fill(39,219,random(150,250));
        noStroke();
        drawHexagon(a,b,c);
      }
      popMatrix();
      u=u+(2*a);
    }

    v=v+(3*c);
  }

  for(float v=b+c;v<height+10;)
  { 
    int count=0;
    for( float u=a;u<width+10;)
    {
      pushMatrix();
      if(sqrt(sq(mouseX-u)+sq(per-v))<hexagonSize)
      {
        translate(u,v);
        float r=random(255);
       fill(233,r,random(50,100),100);
        noStroke();
        drawHexagon(a,b,c);
      }
      popMatrix();
      u=u+(2*a);
    }

    v=v+(3*c);
  }


  for(float v=b;v<height+10;)
  { 
    int count=0;
    for( float u=a;u<width+10;)
    {
      pushMatrix();
      if(sqrt(sq(mouseX-u)+sq(per-v))<hexagonSize)
      {
        translate(u,v);
        float r=random(255);
        fill(230,150,random(100,200),50);
        noStroke();
        drawHexagon(a,b,c);
      }
      popMatrix();
      u=u+(2*a);
    }

    v=v+(3*c);
  }  
  //  translate(a,v);
  //  v=v+(b+c);
  //}

 int tt=second();
  if( tt%20==0)
  {
    fill(0);
    rect(0,0,width,height);
  }

}

void drawHexagon(float a, float b, float c) { 
  /* draw the hexagon */
  beginShape(); 
  vertex(0,c); 
  vertex(a, b); 
  vertex(a, -b); 
  vertex(0, -c); 
  vertex(-a, -b); 
  vertex(-a, b); 
  endShape(CLOSE); 
} 

//void mousePressed()
//{
//  save("hex.jpg");
//}


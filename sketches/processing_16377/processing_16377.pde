
//[Sin/Cos]
//DESMA 2010 Interacitivy 28
//Stephen Ou

float r = 200.0;
float offset = 0;
int card = 0;
//float angle = 0.0;
//float speed = 0.05;


void setup()
{
  size(600,600);
  //smooth();
  noCursor();
}

void draw()
{


  //  noStroke();
  stroke(255);
  background(0);

  float a = int(noise(millis()/1200-7)*1200);
  float b = int(noise(millis()/1200+9)*1200);

  float c = map(mouseX, 0, width, 0,300);
  float d = map(mouseY, 0, height, 0,300);
  //  
  //  angle+= speed;
  //  
  //  float sinVal = sin(angle);
  //  float yoff = sinVal * 45;
  if(card == 0)
  {
    pushMatrix();
    translate(width/2, height/2);
    //  rotate(radians(millis()/60));
    //  scale(yoff/450.0 + 0.3);

    for(int i=1; i<361; i+=1)
    {
      float x = sin(c*radians(i-1)) * r;
      float y = cos(d*radians(i-1)) * r;
      float x1 = sin(c*radians(i)) * r;
      float y1 = cos(d*radians(i)) * r;

      //ellipse(200+x, 200+y, 2,2);
      line(offset+x1, offset+y1, offset+x, offset+y);
    }
    popMatrix();
  }
  else if(card == 1)
  {
    pushMatrix();
    translate(width/2, height/2);
    //  rotate(radians(millis()/60));
    //  scale(yoff/450.0 + 0.3);

    for(int i=1; i<361; i+=1)
    {
      float x = sin(a*radians(i-1)) * r;
      float y = cos(b*radians(i-1)) * r;
      float x1 = sin(a*radians(i)) * r;
      float y1 = cos(b*radians(i)) * r;

      //ellipse(200+x, 200+y, 2,2);
      line(offset+x1, offset+y1, offset+x, offset+y);
    }
    popMatrix();
  }

    //  noStroke();
    //  fill(255, 70);
    //  ellipse(mouseX, mouseY, 1.5, 1.5);
    println(c + "," + d);
  }
  
  
void mousePressed()
{
  if(card == 0)
  {
    card = 1;
  }
  else if(card == 1)
  {
    card = 0;
  }
}



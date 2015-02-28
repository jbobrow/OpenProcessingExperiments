
void setup()
{
  size(500,500);
  background(255);
}


void draw()
{
  background(255);
  translate(width/2, height/2);
  
  
pushMatrix();

float Sekunden = map(second(), 0, 60, 0, 360);
float Minuten = map(minute(), 0, 60, 0, 360);
float Stunden = map(hour(), 0, 12, 0, 360);

fill(200);
ellipse(0,0,10,10);

rotate(radians(180+Sekunden));
translate(0, 0);

rect(0, 0, 2, 80);
popMatrix();

pushMatrix();
rotate(radians(180+Minuten));
translate(0, 0);

rect(0, 0, 3, 80);
popMatrix();

pushMatrix();
rotate(radians(180+Stunden));
translate(0, 0);

rect(0, 0, 3, 50);
popMatrix();

  
  
  for(int i=0; i<360; i+=30)
  {
    pushMatrix();    
    rotate(radians(i));
    translate(0,100);
    noStroke();
    fill(200);
    rect(0,0,10,30);
    popMatrix();
  }
}



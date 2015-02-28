
/*
 Konkuk University
 SOS iDesign
 
 Name:Lim Hyun Seung
 ID: 201420104 Lim Hyun Seung
 
 */

//float Code
float cX=10;
float direction=1;
float angle=12;

void setup()
{
  size(600, 600);
  background(2550);
}

void draw()
{
  //Shape Space
  noStroke();
  fill(255, 50);
  rectMode(CORNERS);
  rect(0, 0, width, height); 
  stroke(0);
  fill(0, 56, 125, 10);
  translate(width/2, height/2); 

  for (int i=40; i<width; i+=250) {
    for (int j=30; j<height; j+=90) {
      strokeWeight(0);
      stroke(255, 255, 255);
      line(i, j, 0, 0);
      rotate(angle);
      rectMode(CORNERS);
      rect(i, j, 0, 0);
      noStroke();
      triangle(i, j, 0, 220, i, 500);
    }
  }

  cX = cX + (3.75 * direction);

  if ((cX<320)||(cX>200)) {
    direction*=-3;
  }
  
//Angle Speed
  angle += 0.0005;
}


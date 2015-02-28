
void setup()
{size(500, 500);
background(0);
}

void draw()
{

  translate(width/2, height/2);
  fill(255);
  ellipse(0, 0, 500, 500);
  ellipseMode(CENTER);
  
//sekundenzeiger
pushMatrix();
float sec = map(second(), 0, 60, 0, 360);
rotate(radians(180+sec)); 
noStroke();
fill(0);
rect(0, 0, 5, 180);
popMatrix();

//minutenzeiger
pushMatrix();
float min = map(minute(), 0, 60, 0, 360);
rotate(radians(180+min)); 
noStroke();
fill(0);
rect(0, 0, 10, 140);
popMatrix();

//stundenzeiger
pushMatrix();
float hour = map(hour(), 0, 12, 0, 360);
rotate(radians(180+hour)); 
noStroke();
fill(200, 0, 0);
rect(0, 0, 10, 100);
popMatrix();



//quadrate
for (int i=0; i<360; i+=90) { 
pushMatrix();
rotate(radians(i)); 
translate(210, -20); 
fill(0);
rect(0, 0, 40, 40);
popMatrix();
}
fill(200, 0, 0);
ellipse(0,0,30,30);

}


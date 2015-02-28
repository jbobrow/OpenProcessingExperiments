
void setup()
{
size(500, 500);
background(0);
}

void draw()
{
  background(0);
  
  translate(width/2, height/2);
  
  float sec = map (second(), 0,60,0,360);
  println(sec);

  //SEKUNDEN
  pushMatrix();
  fill(0,255,0);
  rotate(radians(sec));
  translate(0,-100);
  ellipse(0,0,10,10);
  popMatrix();
  //noFill();

float min = map (minute(), 0,60,0,360);
  println(sec);

  //MINUTEN
  pushMatrix();
  rotate(radians(min));
  translate(0,-150);
  fill(0,255,0);
  ellipse(0,0,15,15);
  popMatrix();
  noFill();


rotate(-0.525);
float hr = map (hour(), 12,23,30,360);
  println(hr);

  //MINUTEN
  pushMatrix();
  rotate(radians(hr));
  translate(0,-200);
  fill(0,255,0);
  ellipse(0,0,30,30);
  popMatrix();
  noFill();


rotate(0.525);

//translate(width/2, height/2); // In die Mitte springen


//STUNDEN
for (int i=0; i<360; i+=30) { // 360 Grad in 20° Schritten
pushMatrix();
rotate(radians(i)); // Um i rotieren
translate(0, 200); // Um Radius verschieben
ellipse(0, 0, 30, 30);
//fill(255);
noFill();
stroke(255);
popMatrix();
}


//MINUTEN
for (int i=0; i<360; i+=6) { 
pushMatrix();
rotate(radians(i)); 
translate(0, 150); 
ellipse(0, 0, 15, 15);
popMatrix();
}


//SEKUNDEN
for (int i=0; i<360; i+=6) { 
pushMatrix();
rotate(radians(i)); 
translate(0, 100); 
ellipse(0, 0, 10, 10);
popMatrix();
}

fill(0,255,0);
ellipse(0,0,40,40);

}


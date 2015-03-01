
void setup()
{
  size(250, 500); 
  background(44, 62, 80);
  noStroke();
}

void draw()

{

//arm
pushMatrix();
translate(width/2, height/2);
rectMode(CENTER);
fill(229,198,163);
rect(0,0,250,310);
popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rectMode(CENTER);
  fill(189, 195, 199);
  rect(0, 0, 150, 150); 
  fill(236, 240, 241);
  rect(0, 0, 110, 110);
  popMatrix();


  pushMatrix();
fill(229,198,163);
  triangle(50, 175, 50, 200, 75, 175);
  triangle(50, 300, 50, 325, 75, 325);
  triangle(200, 175, 175, 175, 200, 200);
  triangle(200, 325, 175, 325, 200, 300);
  fill(189, 195, 199);
  rectMode(CENTER);
  translate(width/2, height/2);
  rotate(radians(45));
  rect(75, 0, 10, 20);
  rect(-75, 0, 10, 20);
  rect(0, 75, 20, 10);
  rect(0, -75, 20, 10);
  popMatrix();

  //STUNDE
  pushMatrix();
  int stundeecht = hour();
  translate(width/2, height/2);
  textSize(25);
  fill(52, 152, 219);
  text(stundeecht, -40, 7.5);
  popMatrix();

  //MINUTE
  pushMatrix();
  int minuteecht = minute();
  translate(width/2, height/2);
  textSize(25);
  fill(52, 152, 219);
  text(minuteecht, 5, 7.5);
  popMatrix();


  //MP
  pushMatrix();
  translate(width/2, height/2);
  ellipseMode(CENTER);
  fill(52, 152, 219);
  ellipse(0, -5, 5, 5);
  ellipse(0, 5, 5, 5);
  popMatrix();

  pushMatrix();
  rectMode(CENTER);
  translate(width/2, height/2);
  fill(189, 195, 199);
  rect(-75, 0, 20, 20);

  //fill(0);
  popMatrix();
  
  //SEKUNDE
    pushMatrix();
  int sekundeecht = second();
  translate(width/2, height/2);
  textSize(15);
  fill(52, 152, 219);
  text(sekundeecht, 18, -17.5);
  popMatrix();
  
  //BALKEN
  float seknow = map(second(), 0, 59, 0, 55);
  pushMatrix();
  translate(width/2, height/2);
  
  noStroke();
  rectMode(CENTER);
 fill(52, 152, 219);
  rect(0, 20, seknow, 10);
 
  popMatrix();
  
  //BALKEN
  float minnow = map(minute(), 0, 59, 0, 55);
  pushMatrix();
  translate(width/2, height/2);
  
  noStroke();
  rectMode(CENTER);
 fill(52, 152, 219);
 
  rect(0,31, minnow ,10);
  popMatrix();
   //kreis
  float stdnow = map(hour(), 0, 23, 0, 10);
  pushMatrix();
  translate(width/2, height/2);
  
  noStroke();
  ellipseMode(CENTER);
 fill(52, 152, 219);
 
  ellipse(-30,-30, stdnow , stdnow);
  popMatrix();
  //BAND
  pushMatrix();
  translate(width/2, height/2);
 fill(189, 195, 199);
  fill(127, 140, 141);
  rectMode(CENTER);
  rect(0,-90,95,30);
  rect(0,90,95,30);
  rect(0,-130,95,20);
  rect(0,130,95,20);
  rect(0,-155,95,10);
  rect(0,155,95,10);
  popMatrix();
//BAND 2
 pushMatrix();
  translate(width/2, height/2);
   fill(189, 195, 199);
  rectMode(CENTER);
  rect(0,-110,100,25);
  rect(0,110,100,25);
  rect(0,-145,100,15);
  rect(0,145,100,15);
  popMatrix();

}

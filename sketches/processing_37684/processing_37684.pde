
boolean mouseIsDown = false;
void setup()
{
  size (500, 500);
  fill(255);
  smooth();
}
 
 
void draw()
{
  background(162, 240, 250);
  
  //blender
  fill(255);
  stroke(0);
  strokeWeight(2);
  quad(50, 30, 450, 30, 320, 450, 180, 450);
  fill(100);
  noStroke();
  rect(30, 20, 440, 20);
  rect(150, 400, 200, 90);
  fill(31, 35, 100);
  beginShape();
  vertex(200, 440);
  vertex(260, 440);
  vertex(260, 430);
  vertex(270, 445);
  vertex(260, 460);
  vertex(260, 450);
  vertex(200, 450);
  endShape(CLOSE);
  
 // fill(31, 36, 90);
  //rect(160, 420, 150, 40);
  
  
  float mx = mouseX/30;
  float topmoves = random(-mx, mx);
  float botmoves = random(-mx, mx);
    
  for (int x = 120; x < 300; x += 80)
  {
    for(int y = 50; y < 300; y += 100)
    {
    
    fill(200, 20, 70);
    beginShape();
    curveVertex(30+x+topmoves, 45+y-botmoves);
    curveVertex(30+x+topmoves, 45+y-botmoves);
    curveVertex(60+x+topmoves, 90+y-botmoves);
    curveVertex(70+x+topmoves, 70+y-botmoves);
    curveVertex(80+x+topmoves, 30+y-botmoves);
    curveVertex(60+x+topmoves, 10+y-botmoves);
    curveVertex(30+x+topmoves, 20+y-botmoves);
    curveVertex(30+x+topmoves, 45+y-botmoves);
    curveVertex(30+x+topmoves, 45+y-botmoves);
    endShape();
    fill(20, 200, 70);
    beginShape();
    vertex(30+x+topmoves, 20+y-botmoves);
    vertex(20+x+topmoves, y-botmoves);
    vertex(50+x+topmoves, 10+y-botmoves);
    vertex(60+x+topmoves, y-5-botmoves);
    vertex(70+x+topmoves, 15+y-botmoves);
    vertex(80+x+topmoves, y-botmoves);
    endShape();
    
    }
    
    fill(200, 20, 70);
    beginShape();
    curveVertex(370+topmoves, 115-botmoves);
    curveVertex(370+topmoves, 115-botmoves);
    curveVertex(400+topmoves, 160-botmoves);
    curveVertex(410+topmoves, 140-botmoves);
    curveVertex(420+topmoves, 100-botmoves);
    curveVertex(400+topmoves, 80-botmoves);
    curveVertex(370+topmoves, 90-botmoves);
    curveVertex(370+topmoves, 115-botmoves);
    curveVertex(370+topmoves, 115-botmoves);
    endShape();
    fill(20, 200, 70);
    beginShape();
    vertex(370+topmoves, 90-botmoves);
    vertex(360+topmoves, 70-botmoves);
    vertex(390+topmoves, 80-botmoves);
    vertex(400+topmoves, 65-botmoves);
    vertex(410+topmoves, 85-botmoves);
    vertex(420+topmoves, 70-botmoves);
    endShape(); 

    
    fill(200, 20, 70);
    beginShape();
    curveVertex(90+topmoves, 115-botmoves);
    curveVertex(90+topmoves, 115-botmoves);
    curveVertex(120+topmoves, 160-botmoves);
    curveVertex(130+topmoves, 140-botmoves);
    curveVertex(140+topmoves, 100-botmoves);
    curveVertex(120+topmoves, 80-botmoves);
    curveVertex(90+topmoves, 90-botmoves);
    curveVertex(90+topmoves, 115-botmoves);
    curveVertex(90+topmoves, 115-botmoves);
    endShape();
    fill(20, 200, 70);
    beginShape();
    vertex(90+topmoves, 90-botmoves);
    vertex(80+topmoves, 70-botmoves);
    vertex(110+topmoves, 80-botmoves);
    vertex(120+topmoves, 65-botmoves);
    vertex(130+topmoves, 85-botmoves);
    vertex(140+topmoves, 70-botmoves);
    endShape(); 
   
  }
  for (int x = 10; x < 300; x += 30)
  {
    for(int y = 10; y < 34; y += 5)
    {
      if (mouseIsDown == true)
      {
  fill(215, 145, 245, 2);
    quad(50, 40, 450, 40, 330, 400, 170, 400);
    fill(35, 30, 90);
    float posX = random(130, 370);
    ellipse(posX, y*9, 30, 30);
    
    
   // ellipse(60+x+botmoves, 110+y-topmoves, 30, 30);
      }
    }
  }
  PFont font;
  font = loadFont("GillSans-Light-30.vlw"); 
  textFont(font); 
  text("ON", 280, 450); 
  
  strokeWeight(2);
  stroke(0);
  line(180, 40, 230, 400);
  line(320, 40, 270, 400);
}

void mousePressed() {
  mouseIsDown = true;
}
 
//this function is called every time you release a mouse button
void mouseReleased() {
  mouseIsDown = false;
}          

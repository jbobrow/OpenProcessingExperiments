
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 

int patternSeperationX = 400;
int patternSeperationY = 800;
 
 
void setup(){
  size(400,800);

  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
   
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
   
}
 
 
void draw()
{
}
 
 
void yourFunction(){
  
//top quarter
  smooth();
  noStroke();  
  fill(255,235,135);
rect(0,0,400,400);
  strokeWeight(6);

  stroke(0);
  fill(0);
ellipse(64,180,40,40);

  fill(255,0,0);
  beginShape();
curveVertex(400,0);
curveVertex(104,240);
curveVertex(200,340);
curveVertex(296,240);
curveVertex(0,0);
  endShape();

  stroke(255);
line(110,240,290,240);

  stroke(255,160,190,0);
  fill(255,160,190,70);
ellipse(40,224,48,16);

  fill(255,235,135);
  stroke(255,235,135);
ellipse(56,204,44,12);

//bottom quarter
  noStroke();  
  fill(255,235,135);
rect(0,400,400,400);
  strokeWeight(6);

  stroke(0);
  fill(0);
ellipse(336,580,40,40);

  fill(255,0,0);
  beginShape();
curveVertex(400,400);
curveVertex(104,640);
curveVertex(200,740);
curveVertex(296,640);
curveVertex(0,400);
  endShape();

  stroke(255);
line(201,640,290,640);

  stroke(255,160,190,0);
  fill(255,160,190,70);
ellipse(360,624,48,16);

  fill(255,235,135);
  stroke(255,235,135);
ellipse(344,604,44,12);

//sad bottom

  color from=color(255,235,135);
  color to=color(40);
  color interA=lerpColor(from,to,0.1);

  noStroke();  
  fill(interA);
rect(0,400,200,400);
  strokeWeight(6);

  stroke(0);
  fill(0);
ellipse(64,580,40,40);

  strokeCap(SQUARE);
arc(200,744,200,205,PI,TWO_PI-PI/2);

  stroke(255,160,190,0);
  fill(255,160,190,70);
ellipse(40,624,48,16);

  stroke(interA);
  strokeWeight(20);
line(35,570,70,550);
  
//sad top

  noStroke();  
  fill(interA);
rect(200,0,200,400);
  strokeWeight(6);

  stroke(0);
  fill(0);
ellipse(336,180,40,40);

arc(200,344,200,205,TWO_PI-PI/2,TWO_PI);

  stroke(255,160,190,0);
  fill(255,160,190,70);
ellipse(360,224,48,16);

  stroke(interA);
  strokeWeight(20);
line(365,170,330,150);



}
 
void keyPressed()

{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}



PFont f;                          // STEP 2 Declare PFont variable

void setup()
{
size(500,500);
background(255);
noStroke();
f = createFont("Baskerville",20,true); // STEP 3 Create Font
}

void draw()
{
  background(255);
  
  float h = map(hour(),0,24/2,0,360/2);
  pushMatrix();
  translate(width/2, height/2);
  fill(100,100,100,100);
  ellipse(0,0,h, h);
  popMatrix();
  
  float min = map(minute(),0,60/2,0,360/2);
  pushMatrix();
  translate(width/2, height/2);
  fill(0,112,255,100);
  ellipse(0,0,min, min);
  popMatrix();
  
  float sec = map(second(),0, 60/2, 0, 360/2);
  pushMatrix();
  translate(width/2, height/2);
  fill(0,112,255,100);
  smooth();
  ellipse(0,0,sec, sec);
  popMatrix();

  pushMatrix();
  textFont(f,20);                
  fill(255);                       
  text(hour(),width/2+10,260); 
  popMatrix();

  pushMatrix();
  textFont(f,20);              
  fill(255);                        
  text(second(),width/2+10,280); 
  popMatrix();

  pushMatrix();
  textFont(f,20);                
  fill(255);                       
  text(minute(),width/2+10,300);  
  popMatrix();
  
}



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

  smooth();
  noStroke();

//melancholybow
  fill(220);
arc(350,800,1100,1400,PI,TWO_PI);
  fill(160);
arc(350,800,900,1100,PI,TWO_PI);
  fill(120);
arc(350,800,700,800,PI,TWO_PI);
  fill(80);
arc(350,800,500,500,PI,TWO_PI);
  fill(50);
arc(350,800,300,300,PI,TWO_PI);
  fill(30);
arc(350,800,110,120,PI,TWO_PI);
 
//sadface
  fill(28);
rect(370,770,10,25);
rect(320,770,10,25);
  noFill();
  stroke(26);
  strokeWeight(2);
arc(350,800,30,10,PI,TWO_PI);
 
//downwards slope
  strokeWeight(0.5);
  stroke(30);
  float a = 0.0;
  float inc = TWO_PI/400.0;
  for(int u=0; u<400; u=u+8) {
line(u, 0, u, 10+sin(a)*1450.0);
  a = a + inc;
  
}
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


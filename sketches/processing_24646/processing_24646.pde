
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 

int patternSeperationX = 400;
int patternSeperationY = 800;
 
 
void setup(){
  size(400,800);

  fill(10);
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

  fill(255,0,0,100);
  stroke(0);
  strokeWeight(1);

triangle(5,10,10,20,25,20);
triangle(45,10,40,20,25,20);

triangle(220,140,240,180,290,180);
triangle(380,140,360,180,310,180);

triangle(160,730,180,770,230,770);
triangle(320,730,300,770,250,770);

triangle(10,350,20,370,45,370);
triangle(90,350,80,370,55,370);

triangle(350,570,370,610,420,610);
triangle(510,570,490,610,440,610);

triangle(110,70,120,90,145,90);
triangle(190,70,180,90,155,90);

triangle(105,510,110,520,125,520);
triangle(145,510,140,520,125,520);

triangle(105,210,75,270,0,270);

triangle(245,399,259,427,294,427);
triangle(357,399,343,427,308,427);

triangle(305,310,310,320,325,320);
triangle(345,310,340,320,325,320);

triangle(8.5,717,17,734,42,734);
triangle(76.5,717,68,734,42,734);


  noFill();
  strokeWeight(8);
  stroke(255);
ellipse(120,250,80,200);
ellipse(280,250,80,200);
ellipse(200,550,90,250);
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



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
  stroke(255,0,0);

//background
  strokeWeight(0.5);
  for (int i = 0; i < 800; i = i+20) {
  int x=i-700;
  int y=i-380;
line(400,i,-y,800);
line(0,i,-x,0);
}

strokeWeight(2);

//lit faces
triangle(110,270,126,260,112,255);
triangle(123,158,156,150,128,120);
triangle(10,393,40,415,42,377);
triangle(56,542,67,506,92,534);
triangle(288,568,260,555,294,539);
triangle(313,443,320,411,308,425);
triangle(337,233,373,220,362,258);
triangle(143,681,131,645,168,655);
triangle(289,90,309,70,313,98);

//super special line
line(355,235,337,233);

//dark faces
  fill(255,160,160);
triangle(112,270,125,261,122,270);
triangle(130,156,156,150,128,122);
triangle(12,394,40,415,40,400);
triangle(56,542,92,534,73,514);
triangle(280,555,288,567,293,540);
triangle(280,555,263,555,287,567);
triangle(313,445,321,409,340,433);
triangle(355,235,373,220,363,258);
triangle(143,679,145,650,168,655);
triangle(300,94,309,72,313,98);

//centrepiece
  fill(255,0,0,80);
ellipse(200,400,120,120);
  fill(255);
  noStroke();
ellipse(185,385,110,110);
  strokeCap(SQUARE);
  stroke(255,0,0);
  noFill();
ellipse(200,400,120,120);
  strokeWeight(7);
line(155,400,190,430);
line(245,400,210,430);
line(170,415,170,430);
line(230,415,230,430);

//ballistic lines
  strokeWeight(2);
line(140,403,41,395);
line(185,351,136,154);
line(168,348,120.5,267);
line(164,437,78,520);
line(230,453,278,550);
line(255,412,313,427);
line(235,360,352,241);
line(240,350,228,365);
line(187,455,149,650);
line(220,345,300,95);

//forward bit
  strokeWeight(2);
  fill(255);
triangle(215,360,240,325,265,360);
  fill(255,0,0,80);
triangle(216,360,244,340,264,360);
triangle(244,340,241,327,262,355);

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


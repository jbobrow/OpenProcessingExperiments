


///////////////////////////////////////////////
///          Edited by Sam Scheib           ///
///////////////////////////////////////////////

void setup(){
  size(400,800);
  background(0);
  smooth();
  scale(0.8);
  yourFunction();
  
}


void draw()
{
  //This is here so the program keeps running and the screengrab will work
}


void yourFunction(){
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  
  int x1 = 140;
  int y1 = 80;
  int x2 = 340;
  int y2 = 230;
  int w = 200;
  int h = 150;
  fill(0);
  rect(0,0,500,1000);
  strokeWeight(1);
  color colour = color(10,180,30);
  stroke(colour);
  fill(colour);
  rect(x1,y1,w,h);
  triangle(x1,y1,x1,y2,0,y2);
  triangle(0,y2,0,y2+h,x1,y2);
  triangle(x2,y1,500,y1,x2,y2);
  triangle(x2,y1,500,y1,500,y1-h);
  strokeWeight(10);
  y1 += 50;
  y2 += 50;
  for (int i=0;i<4;i++){
    line(0,y2+h,x1,y2);
    line(x1,y2,x2,y2);
    line(x2,y2,500,y1);
    y1 += 50;
    y2 += 50;
  }
  rect(0,660,180,400);
  triangle(100,750,0,1000,350,1000);
  rect(220,500,240,100);
  line(230,660,230,820);
  line(230,820,400,1000);
  line(230,660,500,660);
  line(280,710,280,820);
  line(280,820,450,1000);
  line(280,710,500,710);
  
  noStroke();
  fill(5,75,16,100);
  rect(0,100,400,40);
  rect(360,140,40,900);
  rect(0,160,340,40);
  rect(300,200,40,900);
  rect(0,760,240,40);
  rect(0,820,240,40);
  quad(240,760,500,540,500,580,240,800);
  quad(240,820,500,600,500,640,240,860);
}
/*void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}*/


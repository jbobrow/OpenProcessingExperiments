


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
  
  int x = 140;
  int y = 300;
  int x2 = 360;
  int y2 = 230;
  int z = 40;
  fill(0);
  rect(0,0,500,1000);
  strokeWeight(5);
  color colour = color(202,55,8);
  stroke(colour);
  
  for(int i=0;i<10;i++){
    line(x,y,x2,y);
    y += 40;
  }
  x = 140;
  y = 300;
  for(int i=0;i<5;i++){
    line(x,y,-10,y-200);
    y += 40;
  }
  for(int i=0;i<5;i++){
    line(x,y,-10,y+200);
    y += 40;
  }
  x = 360;
  y = 300;
  for(int i=0;i<5;i++){
    line(x,y,505,y-200);
    y += 40;
  }
  for(int i=0;i<5;i++){
    line(x,y,505,y+200);
    y += 40;
  }
  x = 190;
  y = 270;
  y2 = 690;
  for(int i=0;i<4;i++){
    line(x,y,x,y2);
    x += 40;
  }
  line(190,270,70,100);
  line(70,100,70,-5);
  line(230,270,110,100);
  line(110,100,110,-5);
  
  line(270,270,390,100);
  line(390,100,390,-5);
  line(310,270,430,100);
  line(430,100,430,-5);
  
  line(190,690,70,860);
  line(70,860,70,1000);
  line(230,690,110,860);
  line(110,860,110,1000);
  
  line(270,690,390,860);
  line(390,860,390,1000);
  line(310,690,430,860);
  line(430,860,430,1000);
  
  noFill();
  rect(210,-10,80,140);
  rect(210,840,80,180);
  
  x = 150;
  y = 280;
  x2 = 200;
  y2 = 400;
  fill(0);
  for (int i=0;i<2;i++){
    rect(x,y,x2,y2);
    x += 30;
    y += 30;
    x2 -= 60;
    y2 -= 60;
  }
  stroke(10,100);
  for(int i=0;i<20;i++){
    line(-5,z,505,z);
    z += 50;
  }
  fill(colour);
  rect(x,y,x2,y2);
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


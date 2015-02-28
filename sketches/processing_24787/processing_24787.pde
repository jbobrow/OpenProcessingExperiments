


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
  
  int x = 80;
  int y = 0;
  int z = 250;
  int a = 0;
  fill(0);
  rect(0,0,500,1000);
  strokeWeight(3);
  color colour = color(0,200,252);
  
  for (int i=0;i<5;i++){
    stroke(colour);
    line(x,y,x,z);
    line(x,z,x-40,z+60);
    fill(0);
    ellipse(x-40,z+60,20,20);
    fill(colour);
    ellipse(x-40,z+60,6,6);
    x = x + 30;
  }
  z = 500;
  for(int i=0;i<3;i++){
    line(x,y,x,z);
    fill(0);
    ellipse(x,z,20,20);
    fill(colour);
    ellipse(x,z,6,6);
    x += 30;
  }
  x = 280;
  y = 600;
  z = 370;
  for(int i=0;i<3;i++){
    line(x,y,0,z);
    line(x,y,x,1000);
    x -= 30;
    y += 20;
    z += 45;
  }
  x = 50;
  y = 530;
  z = 190;
  a = 0;
  for(int i=0;i<4;i++){
    line(x,y,z,650);
    line(z,650,z,800);
    line(z,800,a,1000);
    fill(0);
    ellipse(x,y,20,20);
    fill(colour);
    ellipse(x,y,6,6);
    y += 25;
    z -= 30;
    a -= 30;
  }
  x = 330;
  y = 400;
  for(int i=0;i<3;i++){
    line(x,y,x,700);
    line(x,y,x+170,y-170);
    fill(0);
    ellipse(x,700,20,20);
    fill(colour);
    ellipse(x,700,6,6);
    y += 20;
    x += 30;
  }
  x = 420;
  y = 900;
  for(int i=0;i<3;i++){
    line(x,y,x,700);
    line(x,y,x-170,y+170);
    fill(0);
    ellipse(x,700,20,20);
    fill(colour);
    ellipse(x,700,6,6);
    y += 20;
    x += 30;
  }
  x = 330;
  y = 300;
  z = 480;
  a = 150;
  for(int i=0;i<4;i++){
    line(x,y,z,a);
    line(z,a,z,0);
    fill(0);
    ellipse(x,y,20,20);
    fill(colour);
    ellipse(x,y,6,6);
    y -= 30;
    z -= 30;
  }
  x = 30;
  for(int i=0;i<10;i++){
    stroke(colour,50);
    line(x,0,x,1000);
    x += 80;
  }
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


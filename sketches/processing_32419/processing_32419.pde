
//import processing.pdf.*;

int patternSeperationX =100;
int patternSeperationY =100;
 
void setup() {
  size(300,600);//,PDF,"Sketch_07.pdf");
  smooth();
  noFill();
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  noStroke();
  background(238,122,0);
  for(int i = 0; i < width/patternSeperationX; i++) {
    for(int j = 0; j < height/patternSeperationY; j++) {
      pushMatrix();
      translate(i*patternSeperationX, j*patternSeperationY);
      yourFunction();
      popMatrix();
    }
  }
}
 
void draw()
{
  //This is here so the program keeps running and the screengrab will work
}
 
void yourFunction(){
     
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  //gray one
  fill(233,165.84);
 
    arc(25,0,50,50,0,radians(180));
  fill(255,255,0);
  arc(0,75,50,50,radians(-90),radians(90));
  fill(0,93,161);
  arc(75,100,50,50,radians(180),radians(360));
  fill(200,228,226);
  arc(100,25,50,50,radians(90),radians(270));
   
  //black one
  fill(204,233,229,120);
  arc(0,0,100,100,radians(270),radians(450));
  arc(0,100,100,100,radians(270),radians(360));
  arc(100,0,100,100,radians(90),radians(180));
  arc(100,100,100,100,radians(180),radians(270));
  
  line(10,0,90,100);
 // here is rect.
 /* int w=80;
  int h=80;
  noStroke();
  for(int i=0; i<width; i+=80) {
  for(int j=0; j<height; j+=80) {
  fill(random(255),random(255),255,random(100));
  rect(i,j,w,h);
   exit();
    }
  }*/
 
}
void keyPressed()
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
}               

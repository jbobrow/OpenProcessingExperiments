
int patternSeperationX =100;
int patternSeperationY =100;

void setup() {
  size(300,600);
  
  smooth();
  noFill();
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  noStroke();
  background(255,255,255);
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
  fill(230,230,230);
 arc(25,0,50,50,radians(0),radians(180));
arc(0,75,50,50,radians(-90),radians(90));
 // arc(50,0,100,100,0,radians(180));
//  arc(0,150,100,100,radians(-90),radians(90));
  //arc(150,200,100,100,radians(180),radians(360));
 // arc(200,50,100,100,radians(90),radians(270));
  
  //black one
 fill(0,0,0);
  arc(25,30,50,50,radians(270),radians(450));
  arc(20,10,20,20,radians(90),radians(270));
 

 /* here is rect.
  int w=80;
  int h=80;
  noStroke();
  for(int i=0; i<width; i+=80) {
  for(int j=0; j<height; j+=80) {
  fill(random(255),random(255),255,random(100));
  rect(i,j,w,h);
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
                                                

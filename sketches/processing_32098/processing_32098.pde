
//////This code was taken and edit from open processing. It was originally written by Ben Jack.
/// Written by Ben Jack, 14th February 2011 
int patternSeperationX = 100;
int patternSeperationY = 100; 

int lineWeight =20;
int trans = 10;
int blueValue=255;
int redValue=255;
int greenValue=255;
color choice = color(redValue,greenValue,blueValue,trans);

void setup() {
  size(400,800);
  smooth();
background(0,0,0);

  for(int i = 0; i < width/patternSeperationX; i++) {
    for(int j = 0; j < height/patternSeperationY; j++) {
      pushMatrix();
      translate(i*patternSeperationX, j*patternSeperationY);
      design();
      popMatrix();
    }
  }
}
void draw() {
  //This is here so the program keeps running and the screengrab will work
}


  void design() {

    //------YOUR PATTERN GOES IN HERE----- (written by Ben Jack)
       
       

for(int i = 200;i>0;i=i-10){
 
  stroke(10);
  strokeWeight(0);
  fill(choice);

  ellipse(50,50,i,i);
  lineWeight++;
  
  ellipse(100,100,i,i);
   ellipse(0,100,i,i);

  ellipse(100,0,i,i);
   ellipse(70,70,i,i);
    ellipse(30,30,i,i);
     ellipse(0,70,i,i); 
     ellipse(0,30,i,i);
    


}


   
     
 
     
  }

  void keyPressed() {
    //Takes PNG screenshots when you push S
    //Careful - doesn't prompt when overwriting files!
    if(key == 's' || key == 'S') {
      String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
      if(filePath != null) {
        save(filePath + ".png");
      }
    }
  }



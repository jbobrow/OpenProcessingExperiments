
//import processing.pdf.*;

int patternSeperationX = 100;
int patternSeperationY = 100;
int k = 40;
int m = 760;
int b = 40;
int j = 760;
void setup(){
size(400,800);
//  beginRecord(PDF, "pattern1.pdf");
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,500,800);
  stroke(0);
  
  for(int i = 0; i < width/patternSeperationX; i++){
     for(int j = 0; j < height/patternSeperationY; j++){
      pushMatrix();
      translate(i*patternSeperationX, j*patternSeperationY);
       yourFunction();
        
        popMatrix();
        
    }
  }
 //endRecord();
}


void draw()
{
  //This is here so the program keeps running and the screengrab will work
}


void yourFunction(){
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  strokeWeight(1);
  color(899);
  for(int i=0; i<200; i++){
  rect(0,800,200,600);
  line(k,0,k,k);
  line(k,k,0,k);
  line(0,m,k,m);
  line(k,800,k,m);

//strokeWeight(1);
//line(0,0,800,0);
  k=k+3;
  j=j-3;
  m=m-3;
 
  }
  
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


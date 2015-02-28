
//what happens if you change these both to 50? what are they doing to the pattern?  
int patternSeperationX = 100;  
int patternSeperationY = 100;  

void setup(){  
  size(800,800);  
  //the white box simply shows you the space your pattern gets drawn in  
  fill(255);  
  noStroke();  
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


  
  //This is here so the program keeps running and the screengrab will work  


void yourFunction(){  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------  
  //try making pleasant designs :-)  
  ellipse (50,50,10,10);
  ellipse (50,50,5,5);
  ellipse (40,40,7,7);
  ellipse (20,20,40,40);
  line (20,20,40,40);
  line (20,20,20,50);
  fill (0);
  noFill ();
  ellipse (30,30,50,5);
  ellipse (30,30,5,50);
  point (1,1,20);
  arc (22,200,50,50,33,33);
  stroke (0);
  fill (175);
  rectMode (CENTER);
  rect (mouseX,mouseY,50,50);
}  

void draw(){
  stroke(20);
  float r = random(100,150);
  float g = random(200,205);
  float b = random(255);
  fill(r,g,b);
  rectMode(CENTER);
  rect(mouseX,mouseY,50,50);
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




//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  size(500,500);
   
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  background(255);
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
  //This is here so the program keeps running and the screengrab will work
}
 
 
void yourFunction(){
   
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  
  //**
  fill(255);
  //**
  fill(249,214,101);
  ellipse(0,0,20,20);
  
  fill(249,217,35);
  ellipse(20,0,20,20);
  
  fill(255,193,55);
  ellipse(40,0,20,20);
  
  fill(252,108,68);
  ellipse(60,0,20,20);
  
  fill(227,74,91);
  ellipse(80,0,20,20);
  
  fill(188,89,90);
  ellipse(100,0,20,20);
  
  fill(227,74,91);
  ellipse(10,15,20,20);

  fill(252,108,68);
  ellipse(30,15,20,20);

  fill(255,193,55);
  ellipse(50,15,20,20);
  
  fill(249,217,35);
  ellipse(70,15,20,20);
  
  fill(249,214,101);
  ellipse(90,15,20,20);
  //**
  fill(249,214,101);
  ellipse(0,30,20,20);
  
  fill(249,217,35);
  ellipse(20,30,20,20);
  
  fill(255,193,55);
  ellipse(40,30,20,20);
  
  fill(252,108,68);
  ellipse(60,30,20,20);
  
  fill(227,74,91);
  ellipse(80,30,20,20);
  
  fill(188,89,90);
  ellipse(100,30,20,20);
  
  fill(227,74,91);
  ellipse(10,45,20,20);

  fill(252,108,68);
  ellipse(30,45,20,20);

  fill(255,193,55);
  ellipse(50,45,20,20);
  
  fill(249,217,35);
  ellipse(70,45,20,20);
  
  fill(249,214,101);
  ellipse(90,45,20,20);
  //**
  fill(249,214,101);
  ellipse(0,60,20,20);
  
  fill(249,217,35);
  ellipse(20,60,20,20);
  
  fill(255,193,55);
  ellipse(40,60,20,20);
  
  fill(252,108,68);
  ellipse(60,60,20,20);
  
  fill(227,74,91);
  ellipse(80,60,20,20);
  
  fill(188,89,90);
  ellipse(100,60,20,20);
  
  fill(227,74,91);
  ellipse(10,75,20,20);

  fill(252,108,68);
  ellipse(30,75,20,20);

  fill(255,193,55);
  ellipse(50,75,20,20);
  
  fill(249,217,35);
  ellipse(70,75,20,20);
  
  fill(249,214,101);
  ellipse(90,75,20,20);
  //**
 
  
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

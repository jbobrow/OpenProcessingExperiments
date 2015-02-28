
int patternSeperationX = 150;
int patternSeperationY = 150;
 
 
void setup(){
  size(500,500);
  background(0);
  smooth();
  
  
   
 

 
   
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
   stroke(255);
     line(125,125,275,275);
   line(125,275,275,125);
   
   line(125,125,150,200);
   line(150,200,200,200);
   line(200,200,200,150);
   line(125,125,200,150);
   
   line(200,200,250,200);
   line(200,200,200,250);
   line(200,250,275,275);
   line(250,200,275,275);
   stroke(255);
   line(200,150,275,125);
   line(275,125,250,200);
   
   line(150,200,125,275);
   line(125,275,200,250);
   
   // full horizontal and v lines
   stroke(255);
   line(0,200,400,200);
   line(200,0,200,400);
   
   //out triangles
   line(200,225,150,275);
   line(150,275,200,375);
   line(200,225,250,275);
   line(200,375,250,275);
   
   line(200,25,150,125);
   line(150,125,200,175);
   line(200,175,250,125);
   line(250,125,200,25);
   
   line(225,200,275,150);
   line(275,150,375,200);
   line(375,200,275,250);
   line(275,250,225,200);
   
   line(175,200,125,150);
   line(125,150,25,200);
   line(25,200,125,250);
   line(125,250,175,200);
   
   
   
   
   
   //inner lines
   line(200,175,150,150);
   line(150,150,175,200);
   line(175,200,150,250);
   line(150,250,200,225);
   line(200,225,250,250);
   line(250,250,225,200);
   line(225,200,250,150);
   line(250,150,200,175);
   
   

   
  
   stroke(255);
   fill(0);
   //ellipse(200,200,20,20);
  
   ellipse(200,200,10,10);
   
   

   
}










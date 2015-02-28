

///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
  
  
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
  
  
void setup(){
  size(500,1000);

  background(255);
 
  //the white box simply shows you the space your pattern gets drawn in
 
  smooth();
  for(int i = 0; i < width/patternSeperationX+1; i++){
      for(int j = 0; j < height/patternSeperationY+1; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
  

}
 
 
  
void draw()
{
  fill(255);
 int a= 0;
 int b= 550;
 
 while(a<500){
   ellipse(a,b,4,8);
   ellipse(a,b,8,4);
   
   a= a+50;
   b= b-50;
 }
 //complete loop//
 ellipse(500,50,4,8);
 ellipse(500,50,8,4);
 ellipse(0,0,8,4);
 ellipse(0,0,4,8);
 
 
 ellipse(150,0,4,8);
 ellipse(100,50,4,8);
 ellipse(50,100,4,8);
 ellipse(0,150,4,8);
 
 ellipse(0,250,4,8);
 ellipse(50,200,4,8);
 ellipse(100,150,4,8);
 ellipse(150,100,4,8);
 ellipse(200,50,4,8);
 ellipse(250,0,4,8);
 
 ellipse(0,300,4,8);
 ellipse(50,250,4,8);
 ellipse(100,200,4,8);
 ellipse(150,150,4,8);
 ellipse(200,100,4,8);
 ellipse(250,50,4,8);
 ellipse(300,0,4,8);
 
 
ellipse(0,400,4,8);
 ellipse(50,350,4,8);
 ellipse(100,300,4,8);
 ellipse(150,250,4,8);
 ellipse(200,200,4,8);
 ellipse(250,150,4,8);
 ellipse(300,100,4,8);
 ellipse(350,50,4,8);
 ellipse(400,0,4,8);
 ellipse(350,50,8,4);
 ellipse(400,0,8,4);
 
 
 ellipse(150,0,8,4);
 ellipse(100,50,8,4);
 ellipse(50,100,8,4);
 ellipse(0,150,8,4);
 
 ellipse(0,250,8,4);
 ellipse(50,200,8,4);
 ellipse(100,150,8,4);
 ellipse(150,100,8,4);
 ellipse(200,50,8,4);
 ellipse(250,0,8,4);
 
 ellipse(0,300,8,4);
 ellipse(50,250,8,4);
 ellipse(100,200,8,4);
 ellipse(150,150,8,4);
 ellipse(200,100,8,4);
 ellipse(250,50,8,4);
 ellipse(300,0,8,4);
 
 
ellipse(0,400,8,4);
 ellipse(50,350,8,4);
 ellipse(100,300,8,4);
 ellipse(150,250,8,4);
 ellipse(200,200,8,4);
 ellipse(250,150,8,4);
 ellipse(300,100,8,4);
 
 
 ellipse(0,650,4,8);
 ellipse(50,600,4,8);
 ellipse(100,550,4,8);
 ellipse(150,500,4,8);
 ellipse(200,450,4,8);
 ellipse(250,400,4,8);
 ellipse(300,350,4,8);
 ellipse(350,300,4,8);
 ellipse(400,250,4,8);
 ellipse(450,200,4,8);
 ellipse(500,150,4,8);
 ellipse(0,650,8,4);
 ellipse(50,600,8,4);
 ellipse(100,550,8,4);
 ellipse(150,500,8,4);
 ellipse(200,450,8,4);
 ellipse(250,400,8,4);
 ellipse(300,350,8,4);
 ellipse(350,300,8,4);
 ellipse(400,250,8,4);
 ellipse(450,200,8,4);
 ellipse(500,150,8,4);
 
  ellipse(50,650,8,4);
 ellipse(100,600,8,4);
 ellipse(150,550,8,4);
 ellipse(200,500,8,4);
 ellipse(250,450,8,4);
 ellipse(300,400,8,4);
 ellipse(350,350,8,4);
 ellipse(400,300,8,4);
 ellipse(450,250,8,4);
 ellipse(500,200,8,4);
 ellipse(550,150,8,4);
 ellipse(0,700,8,4);
 
 ellipse(0,700,8,4);
 ellipse(50,650,4,8);
 ellipse(100,600,4,8);
 ellipse(150,550,4,8);
 ellipse(200,500,4,8);
 ellipse(250,450,4,8);
 ellipse(300,400,4,8);
 ellipse(350,350,4,8);
 ellipse(400,300,4,8);
 ellipse(450,250,4,8);
 ellipse(500,200,4,8);
 ellipse(550,150,4,8);
 
 ellipse(150,650,4,8);
 ellipse(100,700,8,4);
 ellipse(100,700,4,8);
 ellipse(0,700,4,8);
 ellipse(250,650,4,8);
 ellipse(200,600,4,8);
 ellipse(250,550,4,8);
 ellipse(300,500,4,8);
 ellipse(350,450,4,8);
 ellipse(400,400,4,8);
 ellipse(450,350,4,8);
 ellipse(500,300,4,8);
 ellipse(550,250,4,8);
 ellipse(600,200,4,8);
 ellipse(650,150,4,8);
 ellipse(100,700,8,4);
 ellipse(150,650,8,4);
 ellipse(200,600,8,4);
 ellipse(250,550,8,4);
 ellipse(300,500,8,4);
 ellipse(350,450,8,4);
 ellipse(400,400,8,4);
 ellipse(450,350,8,4);
 ellipse(500,300,8,4);
 ellipse(550,250,8,4);
 ellipse(600,200,8,4);
 ellipse(650,150,8,4);
 ellipse(0,800,8,4);
 ellipse(0,800,4,8);
 ellipse(50,750,8,4);
 ellipse(50,750,4,8);
 
 ellipse(500,450,4,8);
 ellipse(450,500,4,8);
 ellipse(400,550,4,8);
 ellipse(350,600,4,8);
 ellipse(300,650,4,8);
 ellipse(250,700,4,8);
 ellipse(200,750,4,8);
 ellipse(150,800,4,8);
 ellipse(100,850,4,8);
 ellipse(50,900,4,8);
 ellipse(0,950,4,8);
 //
 ellipse(500,450,8,4);
 ellipse(450,500,8,4);
 ellipse(400,550,8,4);
 ellipse(350,600,8,4);
 ellipse(300,650,8,4);
 ellipse(250,700,8,4);
 ellipse(200,750,8,4);
 ellipse(150,800,8,4);
 ellipse(100,850,8,4);
 ellipse(50,900,8,4);
 ellipse(0,950,8,4);
 
 
 ellipse(500,550,8,4);
 ellipse(450,600,8,4);
 ellipse(400,650,8,4);
 ellipse(350,700,8,4);
 ellipse(300,750,8,4);
 ellipse(250,800,8,4);
 ellipse(200,850,8,4);
 ellipse(150,900,8,4);
 ellipse(100,950,8,4);
 ellipse(50,1000,8,4);
 
 //
 ellipse(500,550,4,8);
 ellipse(450,600,4,8);
 ellipse(400,650,4,8);
 ellipse(350,700,4,8);
 ellipse(300,750,4,8);
 ellipse(250,800,4,8);
 ellipse(200,850,4,8);
 ellipse(150,900,4,8);
 ellipse(100,950,4,8);
 ellipse(50,1000,4,8);
 
 ellipse(500,600,4,8);
 ellipse(450,650,4,8);
 ellipse(400,700,4,8);
 ellipse(350,750,4,8);
 ellipse(300,800,4,8);
 ellipse(250,850,4,8);
 ellipse(200,900,4,8);
 ellipse(150,950,4,8);
 ellipse(100,1000,4,8);
 //
 ellipse(500,600,8,4);
 ellipse(450,650,8,4);
 ellipse(400,700,8,4);
 ellipse(350,750,8,4);
 ellipse(300,800,8,4);
 ellipse(250,850,8,4);
 ellipse(200,900,8,4);
 ellipse(150,950,8,4);
 ellipse(100,1000,8,4);
 
 ellipse(500,700,4,8);
 ellipse(450,750,4,8);
 ellipse(400,800,4,8);
 ellipse(350,850,4,8);
 ellipse(300,900,4,8);
 ellipse(250,950,4,8);
 ellipse(200,1000,4,8);

 //
 ellipse(500,700,8,4);
 ellipse(450,750,8,4);
 ellipse(400,800,8,4);
 ellipse(350,850,8,4);
 ellipse(300,900,8,4);
 ellipse(250,950,8,4);
 ellipse(200,1000,8,4);
 
 ellipse(500,850,4,8);
 ellipse(450,900,4,8);
 ellipse(400,950,4,8);
 ellipse(350,1000,4,8);

 //
 ellipse(500,850,8,4);
 ellipse(450,900,8,4);
 ellipse(400,950,8,4);
 ellipse(350,1000,8,4);

 ellipse(500,950,4,8);
 ellipse(450,1000,4,8);

 //
 ellipse(500,950,8,4);
 ellipse(450,1000,8,4);

  //PUT IT IT HERE!!!
  

 
 

  //This is here so the program keeps running and the screengrab will work
}
  
  
void yourFunction(){
    
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
    
    noStroke();
    fill(80);
    rect(0,0,50,50);
    rect(50,50,50,50);
    fill(150);
    rect(50,0,50,50);
    rect(0,50,50,50);
    
    fill(0);
    ellipse(0,0,4,8);
    ellipse(0,0,8,4);
    ellipse(50,50,4,8);
    ellipse(50,50,8,4);
    ellipse(50,0,4,8);
    ellipse(50,0,8,4);
    ellipse(100,50,8,4);
    ellipse(100,50,4,8);
    ellipse(0,50,8,4);
    ellipse(0,50,4,8);
    
 
 

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

}

                
                                

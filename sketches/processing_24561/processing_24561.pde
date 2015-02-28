
///////////////////////////////////////////////  

/// Written by Ben Jack, 14th February 2011 ///  

///////////////////////////////////////////////  

   

   

//what happens if you change these both to 50? what are they doing to the pattern?  

int patternSeperationX = 100;  

int patternSeperationY = 100;  

   

   

void setup(){  

  size(500,500);  

     background(0,0,0);

 

     

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
  
  smooth();
  strokeWeight(2);
  stroke(255,255,255);
  for(int y = 0; y < 600; y = y + 50){

  line(500,y,y,500);
  }
line(450,0,0,450);
line(400,0,0,400);
line(350,0,0,350);
line(300,0,0,300);
line(250,0,0,250);
line(200,0,0,200);
line(150,0,0,150);
line(100,0,0,100);
line(50,0,0,50);
noStroke();

color from = color(18,162,255);
  color to = color(81,98,237);
  color intA = lerpColor(from,to,.2);
  color intB = lerpColor(from,to,.4);
  color intC = lerpColor(from,to,.6);
  color intD = lerpColor(from,to,.8);
  color intE = lerpColor(from,to,1);
  color intF = lerpColor(from,to,1.2);
  color intG = lerpColor(from,to,1.4);
  color intH = lerpColor(from,to,1.6);
  color intI = lerpColor(from,to,1.8);
  color intJ = lerpColor(from,to,2);
  
  noFill();



int x = 100;

      
 
  stroke(intB);
  line(55,0,x,95);
  stroke(intC);
  line(60,0,x,90);
  stroke(intD);
  line(65,0,x,85);
  stroke(intE);
  line(70,0,x,80);
  stroke(intF);
  line(75,0,x,75);
  stroke(intG);
  line(80,0,x,70);
  stroke(intH);
  line(85,0,x,65);
  stroke(intI);
  line(90,0,x,60);
  stroke(intJ);
  line(95,0,x,55);
  stroke(intA);
  line(x,0,x,0);
  
  line(0,55,95,x);
  stroke(intA);
  line(0,60,90,x);
  stroke(intB);
  line(0,65,85,x);
  stroke(intC);
  line(0,70,80,x);
  stroke(intD);
  line(0,75,75,x);
  stroke(intE);
  line(0,80,70,x);
  stroke(intF);
  line(0,85,65,x);
  stroke(intG);
  line(0,90,60,x);
  stroke(intH);
  line(0,95,55,x);
  stroke(intI);
  line(0,x,0,x);
 
  
  
  


     

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
 



int distanceFromPoint = 80;
int numOfCircles = 10;
//int circleSize = 15;
float degreeStep = TWO_PI/numOfCircles;
float angle = 0;
int StartDgreeStep = 3;
 
int distanceFromPoint2 = 175;
int numOfCircles2 = 10;
//int circleSize2 = 20;
float degreeStep2 = TWO_PI/numOfCircles2;

 
 
 
void setup()
{
  size(500,500);
  noStroke();
  smooth();
  colorMode(RGB, 256);
  frameRate(80); //declare color mode+range
}

void draw()
{
  
  float circleSize = random(10,70);
  float circleSize2 = random(10,100);

  
  //circle--pattern-------//
  for(int i=0; i<width+5; i+=25){
   for(int j=0; j<height+5; j+=25){
     ellipse(i,j,25,25);
   }
  }

  
  //gradient--------------//
 
  for(int i=0;i<500;i++) {            
    for(int j=0; j<500;j++){
      stroke(i,100,j,400);//rgb// (i,100,j,100) the fourth number is always alpha. 0-255==0 is solid color//
     
      point(i,j); //it starts at 0 and increases it by 1 everytime// it does what the for loops does and comes back//
      
    }
  }



  //----first rainbow ----///
 
  angle = radians (StartDgreeStep);
 
  fill(230, 50, 30, 100); // red
  ellipse(width/2 + cos(angle) * distanceFromPoint, height/2 + sin(angle) * distanceFromPoint, circleSize, circleSize);
  angle += degreeStep; 
 
  fill(255, 255, 0, 100); //yellow
  ellipse(width/2 + cos(angle) * distanceFromPoint, height/2 + sin(angle) * distanceFromPoint, circleSize, circleSize);
  angle += degreeStep; 
 
  fill(100, 200, 30, 100);
  ellipse(width/2 + cos(angle) * distanceFromPoint, height/2 + sin(angle) * distanceFromPoint, circleSize, circleSize);
  angle += degreeStep; 
 
  fill(45, 90, 180, 100);//blue
  ellipse(width/2 + cos(angle) * distanceFromPoint, height/2 + sin(angle) * distanceFromPoint, circleSize, circleSize);
  angle += degreeStep; 
 
  fill(255, 55, 135, 100);// pink
  ellipse(width/2 + cos(angle) * distanceFromPoint, height/2 + sin(angle) * distanceFromPoint, circleSize, circleSize);
  angle += degreeStep;
  
    fill(255, 55, 135, 100);// pink
  ellipse(width/2 + cos(angle) * distanceFromPoint, height/2 + sin(angle) * distanceFromPoint, circleSize, circleSize);
  angle += degreeStep;
  
    fill(255, 55, 135, 100);// pink
  ellipse(width/2 + cos(angle) * distanceFromPoint, height/2 + sin(angle) * distanceFromPoint, circleSize, circleSize);
  angle += degreeStep;
  
    fill(255, 55, 135, 100);// pink
  ellipse(width/2 + cos(angle) * distanceFromPoint, height/2 + sin(angle) * distanceFromPoint, circleSize, circleSize);
  angle += degreeStep;
  
    fill(255, 55, 135);// pink
  ellipse(width/2 + cos(angle) * distanceFromPoint, height/2 + sin(angle) * distanceFromPoint, circleSize, circleSize);
  angle += degreeStep;
  
    fill(255, 55, 135, 100);// pink
  ellipse(width/2 + cos(angle) * distanceFromPoint, height/2 + sin(angle) * distanceFromPoint, circleSize, circleSize);
  angle += degreeStep;
 
  StartDgreeStep+=1; //inself = intself+1
 
 
 
    //---- second rainbow----///
 
  angle = radians (StartDgreeStep);
 
  fill(100, 200, 30); // green
  ellipse(width/2 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, circleSize2, circleSize2);
  angle += degreeStep2; 
 
  fill(230, 50, 30);//red
  ellipse(width/2 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, circleSize2, circleSize2);
  angle += degreeStep2; 
 
 
  fill(255, 250, 50, random (0, 255)); //yellow
  ellipse(width/2 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, circleSize2, circleSize2);
  angle += degreeStep2; 
 
 
  fill(0, 0, 0, random (0, 255));//black
  ellipse(width/2 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, 22, 22);
  angle += degreeStep2; 
 
 
  fill(45, 90, 180, random (0, 255));
  ellipse(width/2 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, circleSize2, circleSize2);
  angle += degreeStep2; 
 
  fill(255, 55, 135, random (0, 255)); //pink
  ellipse(width/2 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, circleSize2, circleSize2);
  angle += degreeStep2;
  

   StartDgreeStep+=70; //is the same as StarDgreeStep=StartDgreeStep+70//speed of pie turning
   
   
    
    //---- second rainbow----///
 
  angle = radians (StartDgreeStep);
 
  fill(100, 200, 30); // green
  ellipse(width/4 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, circleSize2, circleSize2);
  angle += degreeStep2; 
 
  fill(230, 50, 30);//red
  ellipse(width/4 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, circleSize2, circleSize2);
  angle += degreeStep2; 
 
 
  fill(255, 250, 50, random (0, 255)); //yellow
  ellipse(width/4 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, circleSize2, circleSize2);
  angle += degreeStep2; 
 
 
  fill(0, 0, 0, random (0, 255));//black
  ellipse(width/4 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, 22, 22);
  angle += degreeStep2; 
 
 
  fill(45, 90, 180, random (0, 255));
  ellipse(width/4 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, circleSize2, circleSize2);
  angle += degreeStep2; 
 
  fill(255, 55, 135, random (0, 255)); //pink
  ellipse(width/4 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, circleSize2, circleSize2);
  angle += degreeStep2;
  

   StartDgreeStep+=70; //inself = intself+1




   
}




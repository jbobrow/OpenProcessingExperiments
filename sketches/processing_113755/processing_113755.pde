
//Delcaring global variables and objects of the person class
float xSun= 0;
float ySun= 400;
float a = 45;
int fader =146;
Person fPerson;
Person mPerson;
Cloud cloudOne;
Cloud cloudTwo;
Cloud cloudThree;

void setup()
{size (600,600);
 frameRate(14);
  //Initalise person
  fPerson = new Person();
  mPerson = new Person();
  cloudOne = new Cloud();
  cloudTwo = new Cloud();
  cloudThree = new Cloud();
  
  mPerson.xPos = 100;
  mPerson.yPos = 400;
  fPerson.xPos = 500;
  fPerson.yPos = 400;  
  fPerson.c = color(random(255), 78, 34);
  
  cloudOne.xCloud = 100;
  cloudOne.yCloud = 200;
  cloudOne.speed = 2;
  cloudOne.cl = (200);
  
  cloudTwo.xCloud = 200;
  cloudTwo.yCloud = 100;
  cloudTwo.speed = 3;
  cloudTwo.cl = (230);
  
  cloudThree.xCloud = 400;
  cloudThree.yCloud = 150;
  cloudThree.speed = 4;
  cloudThree.cl = (random(255));
}

void draw() 
{ 
  noStroke();
  fill(54,146,244);
  rect(0,0,600,600);
  fill(32,165,57);
  rect(0,400,width, height);
  
  //sun
  fill(227, 222, 80);
  ellipse(xSun, ySun, 80, 80);
  a=a+1;

  float yChange = cos(radians(a));
  float xChange = sin(radians(a));
 
  xSun += xChange* 7.5;
  ySun -= yChange*18;

  fill( 51, 196, 59);
  noStroke();
  rect(0,400, width, height);
  
  fPerson.displayFemale();
  mPerson.displayMale();
  mPerson.moveMale();
  fPerson.jump();
  
  cloudOne.displayCloud();
  cloudTwo.displayCloud();
  cloudThree.displayCloud();
  
  cloudOne.moveCloud();
  cloudTwo.moveCloud();
  cloudThree.moveCloud();
} 

//Create the class
class Person
{ color c;
  float xPos; 
  float yPos; 

//Constructor
Person()
   {
     c = (0);
     xPos = 0;
     yPos = 0;
    }

//show objects/person

void displayFemale()
  {stroke(0);
   fill(0);
   ellipse(xPos, yPos, 30, 30);
   strokeWeight(7);
   line(xPos, yPos, xPos, yPos+80);
   bezier(xPos, yPos+80, xPos-10, yPos+100, xPos-15, yPos+120, xPos-17, yPos+150);
   bezier(xPos, yPos+80, xPos+10, yPos+100, xPos+15, yPos+120, xPos+17, yPos+150);
   line(xPos, yPos+50, xPos-40, yPos+40);
   line(xPos, yPos+50, xPos+40, yPos+40);
   strokeWeight(7);
   fill(c);
   triangle(xPos, yPos+30, xPos+20, yPos+120, xPos-20, yPos+120);
}


void displayMale()
{  fill(0);
   ellipse(xPos, yPos, 30, 30);
   strokeWeight(7);
   line(xPos, yPos, xPos, yPos+80);
   bezier(xPos, yPos+80, xPos-10, yPos+100, xPos-15, yPos+120, xPos-17, yPos+150);
   bezier(xPos, yPos+80, xPos+10, yPos+100, xPos+15, yPos+120, xPos+17, yPos+150);
   line(xPos, yPos+50, xPos-40, yPos+40);
   line(xPos, yPos+50, xPos+40, yPos+40);
}

   int m=(-6);
   int readyToParty = 0;
   
   
void moveMale() 
  { 
    //This section of code controls the movement of the male stick
    //figure.
    if (readyToParty==0)
    {
      //This is set to -50 so that the figure goes off screen  
      if(xPos<(-50))
        {
          m=m*(-1);
        }
      if(xPos>=width*0.6)
        {
          m=m*(-1);
          //Ready to party is set to one here so that the moving on 
          //and off screen loop is stopped and the else loop is now
          //undertaken.
          readyToParty = 1;
        }
      
      xPos += m;
    }
  //This is the start of the else loop where the character is 
  //ready to dance.
  else
      {
      if(yPos>=400){
          m=m*(-1);
        }
      if(yPos<(460)){
          m=m*(-1);
        }
      yPos += m;
    } 
  }
  
void jump()
  {
    if (readyToParty==0){
      if(yPos>=400){
        m=m*(-1);
      }
      if(yPos<(460)){
        m=m*(-1);
      }
      yPos += m;
    }
  
  }
}
//a class for clouds
class Cloud
{
  color cl;
  float xCloud;
  float yCloud;
  int speed;
  
  Cloud(){
    cl = (255);
    xCloud = 0;
    yCloud = 0;
  }
  void displayCloud(){
    fill(cl);
    noStroke();
    beginShape();
    vertex(xCloud, yCloud);
    bezierVertex(xCloud+15, yCloud-7, xCloud+78, yCloud+15, xCloud, yCloud+25);
    bezierVertex(xCloud-56, yCloud+15, xCloud-39, yCloud-24, xCloud, yCloud);
    endShape(CLOSE);
  }
  
  void moveCloud(){
    //int dir = 2;
    
    //check if the whole cloud left the screen
    if(xCloud < width+56){
        xCloud += speed;
    }
    //move cloud to the begining of the screen
    else{
        xCloud = -25;
    }


    
  }
}

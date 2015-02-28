
//lucinda threlfo processing
//Lesson three project
//Spring is Over :( OR IS IT!

//WHAT HAPPENS?
//1. petals change colour with mouse movement
//2. centre changes colour with mouse movement
//3. "Spring is Over :( OR IS IT!"displayed in window with mouse click
//4. fly follows with mouse movement
//5. when any key is pressed the petals fly away an bounce back and forth
//6. when any key is pressed the background and grass colours change



//class Flower{// class stuffs it up for some reason?

//Variables for petals
//ellipse 1
int ellipse1X = 80;
int ellipse1Y = 60;
int ellipsew1X = 40;
int ellipseh1Y = 40;
//ellipse 2
int ellipse2X = 80;
int ellipse2Y = 90;
int ellipsew2X = 40;
int ellipseh2Y = 40;
//ellipse 3
int ellipse3X = 100;
int ellipse3Y = 110;
int ellipsew3X = 40;
int ellipseh3Y = 40;
//ellipse 4
int ellipse4X = 125;
int ellipse4Y = 120;
int ellipsew4X = 40;
int ellipseh4Y = 40;
//ellipse 5
int ellipse5X = 155;
int ellipse5Y = 112;
int ellipsew5X = 40;
int ellipseh5Y = 40;
//ellipse 6
int ellipse6X = 170;
int ellipse6Y = 90;
int ellipsew6X = 40;
int ellipseh6Y = 40;
//ellipse 7
int ellipse7X = 170;
int ellipse7Y = 60;
int ellipsew7X = 40;
int ellipseh7Y = 40;
//ellipse 8
int ellipse8X = 157;
int ellipse8Y = 35;
int ellipsew8X = 40;
int ellipseh8Y = 40;
//ellipse 9
int ellipse9X = 125;
int ellipse9Y = 27;
int ellipsew9X = 40;
int ellipseh9Y = 40;
//ellipse 10
int ellipse10X = 97;
int ellipse10Y = 34;
int ellipsew10X = 40;
int ellipseh10Y = 40;

//speed variable
int speed = 1; 

//makes sure when the program is run the petals stay still
boolean pressed = false;
//makes sure when the program is run the background and grass are blue and green
boolean over = false;


void setup()
{
  size(500,500);
 frameRate(90);//changes the speed the petals blow away
} 

void draw(){
 
    drawBackGrass();
    changeBackGrass();
    drawStem();
    drawPetals();
    drawCentre();
    drawLeaf();
    drawMoveFly();
    movePetals();
    
}

void drawBackGrass()//draws background and grass
{
  background(209,250,249);
  fill(24,134,36);
  rect(0,height/2,width,250);
}
 void drawCentre()//draws flower centre
 {
   fill(0,mouseX,mouseY);
ellipse(125,70,75,75);
 }
 
void drawStem()//draws stem
{
fill(24,134,36);
rectMode(CORNER);
rect(120,90,10,160);
}

void drawLeaf()//draws leaf
{
rotate(0.3);
fill(24,134,36);
ellipse(185,120,25,50);
}

void drawPetals()//draws petals
{
 //changes colour with mouse movement
  fill(mouseX,70,mouseY);
int e=1;

for(e=0;e>=11;e++);{
  if (e==1);{
    ellipse(ellipse1X,ellipse1Y,ellipsew1X,ellipseh1Y);
  }
  if(e==2);{
  ellipse(ellipse2X,ellipse2Y,ellipsew2X,ellipseh2Y);
  }
   if(e==3);{
   ellipse(ellipse3X,ellipse3Y,ellipsew3X,ellipseh3Y);
  } 
  if(e==4);{
  ellipse(ellipse4X,ellipse4Y,ellipsew4X,ellipseh4Y);
  }
  if(e==5);{
  ellipse(ellipse5X,ellipse5Y,ellipsew5X,ellipseh5Y);
  }
  if(e==6);{
    ellipse(ellipse6X,ellipse6Y,ellipsew6X,ellipseh6Y);
  }
  if(e==7);{
    ellipse(ellipse7X,ellipse7Y,ellipsew7X,ellipseh7Y);
  }
  if(e==8);{
    ellipse(ellipse8X,ellipse8Y,ellipsew8X,ellipseh8Y);
  }
  if(e==9);{
    ellipse(ellipse9X,ellipse9Y,ellipsew9X,ellipseh9Y);
  }
  if(e==10);{
    ellipse(ellipse10X,ellipse10Y,ellipsew10X,ellipseh10Y); 
  }
}
}

void movePetals()
{
  if(pressed){
//makes the petals move away
ellipse1X = ellipse1X - speed ; 
ellipse2X = ellipse2X - speed;
ellipse3Y = ellipse3Y + speed;
ellipse4Y = ellipse4Y + speed;
ellipse5Y = ellipse5Y + speed;
ellipse6X = ellipse6X + speed;
ellipse7X = ellipse7X + speed;
ellipse8Y = ellipse8Y - speed;
ellipse9Y = ellipse9Y - speed;
ellipse10Y = ellipse10Y - speed;

ellipse1Y = ellipse1Y - speed;
//doesn't need to go diagonal
ellipse3X = ellipse3X - speed;
//doesn't need to go diagonal
ellipse5X = ellipse5X + speed;
//doesn't need to go diagonal
ellipse7Y = ellipse7Y - speed;
ellipse8X = ellipse8X + speed;
//doesn't need to go diagonal
ellipse10X = ellipse10X - speed;


//make the petals come back
if ((ellipse1X > width) || (ellipse1X < 0))
{
  speed = speed * -1;
 }
 if ((ellipse1Y > height) || (ellipse1Y < 0))
 {
  speed = speed *-1;
 }
 
 if ((ellipse2X > width) || (ellipse2X < 0))
 {
   speed = speed * -1;
 }
 if ((ellipse3X > width) || (ellipse3X < 0))
 {
   speed = speed *-1;
 }
 if ((ellipse3Y > height) || (ellipse3Y < 0))
{
 speed = speed *-1;
} 
 if ((ellipse4Y > height) || (ellipse4Y < 0))
 {
   speed = speed *-1;
 }
 if ((ellipse5X > width) || (ellipse5X < 0))
 {
   speed = speed *-1;
 }
 if ((ellipse5Y > height) || (ellipse5Y < 0))
 {
   speed = speed *-1;
 }
 if ((ellipse6X > width) || (ellipse6X < 0))
  {
  speed = speed *-1;
}
 if ((ellipse7X > width) || (ellipse7X < 0))
 {
   speed = speed *-1;
 }
 if ((ellipse7Y > height) || (ellipse7Y < 0))
{
  speed = speed *-1;
}
if ((ellipse8X > width) || (ellipse8X <0))
{ 
  speed = speed *-1;
}
if ((ellipse8Y > height) || (ellipse8Y < 0))
{
  speed = speed *-1;
}
if ((ellipse9Y > height) || (ellipse9Y < 0))
{
  speed = speed *-1;
}
if ((ellipse10X > width) || (ellipse10X < 0))
{
  speed = speed *-1;
}
if ((ellipse10Y > height) || (ellipse10Y < 0))
{
  speed = speed *-1;
}
 
}
}

void drawMoveFly()//draws fly
{
fill(50);
ellipse(mouseX,mouseY,10,20);
} 

void changeBackGrass()//changes the background colour and grass
{
  if(over){
    fill(39,17,5);
    background(0);
    rect(0,height/2,width,250);
  }
}

//Things change with key press
void keyPressed()
{
//initiates the petals to blow way
pressed = true;
//initiates background to black and grass to brown
over= true;
  
}

//window display
void mousePressed()
{
  println("Spring is Over :( OR IS IT!"); //Window reads "Spring is Over :("
}


//}


  


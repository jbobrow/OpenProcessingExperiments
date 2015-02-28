
int x;
int y;

boolean star1IsShot= false;
int r=3;
boolean star2IsShot= false;
boolean star3IsShot=false;
boolean isGameOver= false;
ArrayList<quad> stars= new ArrayList<quad>();
void setup()
{   size(350, 550);
    background(0);
    noStroke();
}

void draw()
{
 x=mouseX;
 y=mouseY;
 
  //THESE ARE THE BOUNDARIES
      if ( mouseX-10<10)
      {
       x=20;
      }
  if (mouseX+20>350)
  {
   x=330;
  } 
     if(mouseY+175>500)
     {
      y=375;
     }
     if(mouseY<0 && mouseX-10<0)
      {
      y=0;
      x=10;
      }
      if(mouseY-25<350)
      {
      y=375;
      }
 
 
 if (mousePressed && x>=55 && x<=65)//checks if the stars got shot
 {
  star1IsShot= true;
 }
 else if (mousePressed && x>=155 && x<=165)
 {
 star2IsShot= true;
 }
 else if(mousePressed && x>=255 && x<=265)
 {
 star3IsShot= true;
 }
  background(0);

  if (!star1IsShot)//if the stars are not shot then the program draws the stars
  {
  fill(255, 255, 0);
  quad(60, 60, 55, 70, 60, 90, 65, 70);
  }
  
  if (!star2IsShot)
  {
  fill(255, 255, 0);
  quad(160, 60, 155 , 70, 160, 90, 165, 70);
  }
  
  if (!star3IsShot)
  {
  fill(255, 255, 0);
  quad(260, 60, 255, 70, 260, 90, 265, 70);
  }
 
  translate(x, y);//user controls rocket with mouse
  //rocket
  fill(102);
  noStroke();
  beginShape();
  vertex(0, -10);
  vertex(-10, 15);
  vertex(-10, 135);
  vertex(0, 115);
  vertex(10, 135);
  vertex(10, 15);
  vertex(0, -10);
  endShape(CLOSE);

  //IF YOU SHOOT ALL THE STARS THEN YOU WIN!
  if (star1IsShot && star2IsShot && star3IsShot)
  {
   background(0);
   isGameOver=true;
  /*textFont(f,16);                 // STEP 4 Specify font to be used
  fill(255);                        // STEP 5 Specify font color 
  text("GAME OVER",10,100);  // STEP 6 Display Text*/
  }
}
//make a mouse clicked method look up online.
void mousePressed()
{
float bulletY;
float bulletSpeed;
bulletY = height-40;
bulletSpeed=65;///TRY USING TRANSLATE!!!
float bulletX;

 if (mousePressed && isGameOver==false)
    {
      bulletX= mouseX;
      bulletY= 325;
  
      while (bulletY>0)
      {
      fill(255,0,0);
      bulletY=bulletY-bulletSpeed;
      rect(bulletX,bulletY,4,20);
      }
 }
}

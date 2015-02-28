
//Homework 8
//Samantha Zucker
//Copyright Pittsburgh, PA, October 2011

float axspeed, ayspeed, rotAngle; // move ant variables
float ax, ay, dia, spa; //draw ant variables
float wx, wy, wh, ww; // draw melon variables
float wxspeed, wyspeed;//move melon variables
float asx, asy; //side ant variables

//stats
int collisionCount;
boolean collision;


////////////////////////////
void setup()
{
 size (600,600);
 smooth();


 wx = width/2;
 wy = height/2;
 ww = 150;
 wh = 150;  
 
 wxspeed = 0;
 wyspeed = 0;
 axspeed = random(1,10);
 ayspeed = random(1,10);
 ax = 50;
 ay = 50;
 
 asx = width/2 - ww*.1;
 asy = height/2 - wh/3 + wh/2;
 
 dia = 5;
 rotAngle = atan2 (axspeed, ayspeed);
 
 collisionCount = 0;
 collision = false;
 
 
}
/////////////////////////////
void draw()
{
  if ( dist(ax,ay, wx,wy) <= 50)
    {
    collision = true; 
    }
  if (collision == true)
    {
    background(166,238,112); 
    antSide();
    melonTake();
    collisionCount = collisionCount + 1; 
      
        if (wx + ww/2 <= 0)
           {
           collision = false;
           wx = width/2;
           wy = height/2;
           wxspeed = 0;
           wyspeed = 0;
           ax = 50;
           ay = 50;
           asx = width/2 - ww*.1;
           asy = height/2 - wh/3 + wh/2;
           }
    }
  else
      {
      background(166,238,112); 
      moveAnts(); 
      drawMelon(); 
      moveMelon();
      catchMelon();
      showData(); 
      }
}
/////////////////////////////
void showData()
{
  int time = millis()/1000;
  
  textSize(16);
  fill(0);
  text ("Watermelon Stolen" + " " + collisionCount/375, 5, 15);
  text ("Vertical Speed" + " " + wyspeed, 5, 35);
  text ("Horizontal Speed" + " " + wxspeed, 5, 55);
  text ("Time" + " " + time, 5, 75);
}
/////////////////////////////
void catchMelon()
{
 if (wx < 0 || wx > width || wy < 0 || wy > height)
  {
   textMode(CENTER);
   text("Don't let the ants scare you off!\nPress space to get your melon back", width/2, height*.75);   
  } 
}
/////////////////////////////
void melonTake()
{
        
        wx = wx - 1;

        wy = height/2 - wh/3;
        
        noStroke();
        fill(83,157,68);
        arc(wx, wy, ww, wh, PI*.25, PI*.75);
        fill(216,61,82);
        arc(wx, wy, ww*.875, wh *.875,PI*.25, PI*.75);
        fill(0);
        ellipse(wx+ww*.2 , wy+wh*.3 , ww*.015,  wh*.03);
        ellipse(wx+ww*.1 , wy+wh*.15 , ww*.015,  wh*.03);
        ellipse(wx-ww*.2 , wy+wh*.25 , ww*.015,  wh*.03);
        ellipse(wx-ww*.05 , wy+wh*.35 , ww*.015,  wh*.03);
        ellipse(wx-ww*.04 , wy+wh*.12 , ww*.015,  wh*.03);
}
/////////////////////////////
void antSide()
{
  
    asx = asx - 1;
   
    noSmooth();
   
    dia = 5;
    spa = dia*.4;
    fill(0);
    rectMode(CORNER);
    dia = 5;
    spa = dia*.4;
    
    rect(asx, asy, dia, dia);
    rect(asx + dia + spa, asy + dia*.4, dia, dia*.6);
    rect(asx + dia*2 + spa*2, asy - dia/2, dia*1.5, dia*1.5);
    
    stroke(0);
    strokeWeight(1);
    //middle section legs
    line(( asx + dia + spa + dia*.33), (asy + dia*.5), (asx + dia + spa + dia*.33), (asy + dia*1.25)); 
    line(( asx + dia + spa + dia*.66), (asy + dia*.5), (asx + dia + spa + dia*.66), (asy + dia*1.25));
    
    //back legs
    line(( asx + dia*2 + spa*2 + (dia*1.5)*.33), (asy + dia*.5), (asx + dia*2 + spa*2 + (dia*1.5)*.33), (asy + dia*1.25));
    line(( asx + dia*2 + spa*2 + (dia*1.5)*.66), (asy + dia*.5), (asx + dia*2 + spa*2 + (dia*1.5)*.66), (asy + dia*1.25));
     
}
/////////////////////////////
void moveMelon()
{
 wx = wx + wxspeed;
 wy = wy + wyspeed; 
}
/////////////////////////////
void keyPressed()
{  
  if(collision ==false)
  {
    wx = wx + wxspeed;
    wy = wy + wyspeed; 
    
    if(keyCode == UP)
    {
     wyspeed = wyspeed - .1; 
    }
    if(keyCode == DOWN)
    {
     wyspeed = wyspeed + .1; 
    }
    if(keyCode == LEFT)
    {
      wxspeed = wxspeed -.1;
    }
    if(keyCode == RIGHT)
    {
      wxspeed = wxspeed +.1;
    } 
    if(key == ' ')
    {
     wx = width/2;
     wxspeed = 0;
     wy = height/2; 
     wyspeed = 0;
    }
  }
}
/////////////////////////////
void drawMelon()
{

  pushMatrix();
    translate(0, -wh/3);    

        
        noStroke();
        fill(83,157,68);
        arc(wx, wy, ww, wh, PI*.25, PI*.75);
        fill(216,61,82);
        arc(wx, wy, ww*.875, wh *.875,PI*.25, PI*.75);
        fill(0);
        ellipse(wx+ww*.2 , wy+wh*.3 , ww*.015,  wh*.03);
        ellipse(wx+ww*.1 , wy+wh*.15 , ww*.015,  wh*.03);
        ellipse(wx-ww*.2 , wy+wh*.25 , ww*.015,  wh*.03);
        ellipse(wx-ww*.05 , wy+wh*.35 , ww*.015,  wh*.03);
        ellipse(wx-ww*.04 , wy+wh*.12 , ww*.015,  wh*.03);
    popMatrix();      
}
////////////////////////////
void moveAnts()
{
   
  pushMatrix( );
       translate( ax, ay ); 
       rotate( -rotAngle+3*PI/2 );
       antsTop(0,0,5);     
  popMatrix( );
  
  ax = ax + axspeed;
 
  if(ax  > width || ax  < 0)
 {
   axspeed = axspeed *(-1);
   rotAngle = atan2 (axspeed, ayspeed);
 }
ay = ay + ayspeed;
 
 if( ay  > height || ay  < 0)
 {
  ayspeed = ayspeed *(-1);
  rotAngle = atan2 (axspeed, ayspeed);
 }

}
/////////////////////////////
void antsTop(float ax, float ay, float dia)
{
  float spa;
  spa = dia*.4;
  

      fill(0);

     rectMode(CENTER);
      
      rect(ax, ay, dia, dia);
      rect(ax + dia + spa, ay, dia, dia*.6);
      rect(ax + dia*2.25 + spa*2, ay, dia*1.5, dia*1.5);
      
      stroke(0);
      strokeWeight(.8);
      //antenna
      line(ax, ay, ax - dia, ay - dia/3);
      line(ax, ay, ax - dia, ay + dia/3);
      
      strokeWeight(1);
      //middle legs
      line(ax + dia + spa, ay, ax + dia*.5 + spa, ay - dia);
      line(ax + dia + spa, ay, ax + dia*1.5 + spa, ay - dia);
      
      line(ax + dia + spa, ay,  ax + dia*.5 + spa, ay + dia);
      line(ax + dia + spa, ay, ax + dia*1.5 + spa, ay + dia);
      
      //back legs
      line(ax + dia*2.25 + spa*2, ay, ax + dia*1.5 + spa*2, ay - dia*1.5);
      line(ax + dia*2.25 + spa*2, ay,   ax + dia*3 + spa*2, ay - dia*1.5);
      
      line(ax + dia*2.25 + spa*2, ay, ax + dia*1.5 + spa*2, ay + dia*1.5);
      line(ax + dia*2.25 + spa*2, ay, ax + dia*3 + spa*2,   ay + dia*1.5);
  
}


/*
2. Respond
Create a pair of expressive eyes that respond to 
the cursor as a 640 x 480 pixel Processing program

Name: Kuo-Ang Huang
UID: 703783811
*/

color faceclr = color(255, 220, 150);
int eyeclr = 195;
int eyebright = 80;
float anger = 0.0;

void setup()
{
  size(640, 480);
  background(faceclr);
  smooth();
}

void draw()
{
// Default Eye---------------------------------------  
  int eyeX = mouseX;
  int leyeX = mouseX;
  int reyeX = mouseX;
  int eyeY = mouseY;
  
  leyeX = constrain(leyeX, 180, 240);
  reyeX = constrain(reyeX, 400, 460);
  eyeY = constrain(eyeY, 172, 188);
// Be careful to use constrained variable as calculated values
  
  float smiled = dist(eyeX, mouseY, 320, 70);
  float sadd = dist(eyeX, mouseY, 320, 290);
  float zeye = dist(eyeX, mouseY, 320, 182);
  
  background(faceclr);
  stroke(0);
  strokeWeight(5);
  strokeJoin(ROUND);
  fill(255); 
 
  ellipse(210, 180, 170, 120);
  ellipse(430, 180, 170, 120);
  
  colorMode(HSB, 360, 100, 100);
  for(int i =0; i <50; i +=5)
  {
    stroke(eyeclr, eyebright, 75 +i);
    ellipse(leyeX, eyeY, 80 -i, 80 -i);
    ellipse(reyeX, eyeY, 80 -i, 80 -i);
  }
  
  colorMode(RGB, 255, 255, 255);
  for(int i =0; i <50; i +=5)
  {
    stroke(65 -i);
    ellipse(leyeX, eyeY, 45 -i, 45 -i);
    ellipse(reyeX, eyeY, 45 -i, 45 -i);
  }
  
  noStroke();
  fill(255, 180);
  ellipse(leyeX -15, eyeY -15, 15, 15);
  ellipse(reyeX -15, eyeY -15, 15, 15);

  if(anger <51.0)
  {
// Left Wink---------------------------------------  
    if(mouseX >140 && mouseX <280 && mouseY >140 && mouseY <220 && !mousePressed)
    {
      background(faceclr);
      colorMode(HSB, 360, 100, 100);
      stroke(eyeclr, eyebright, 75);
      line(leyeX +40, eyeY, 140, 140);
      line(leyeX +40, eyeY, 140, 220);   
    
      colorMode(RGB, 255, 255, 255);
      fill(255);
      stroke(0);
       
      ellipse(430, 180, 170, 120);
  
      colorMode(HSB, 360, 100, 100);
      for(int i =0; i <50; i +=5)
      {
        stroke(eyeclr, eyebright, 75 +i);
        ellipse(reyeX, eyeY, 80 -i, 80 -i);
      }
  
      colorMode(RGB, 255, 255, 255);
      for(int i =0; i <50; i +=5)
      {
        stroke(65 -i);
        ellipse(reyeX, eyeY, 45 -i, 45 -i);
      }
  
      noStroke();
      fill(255, 180);
      ellipse(reyeX -15, eyeY -15, 15, 15);
    }
// Right Wink---------------------------------------
    else if(mouseX >360 && mouseX <500 && mouseY >140 && mouseY <220 && !mousePressed)
    {
      background(faceclr);   
      colorMode(HSB, 360, 100, 100);
      stroke(eyeclr, eyebright, 75);
      line(reyeX -40, eyeY, 500, 140);
      line(reyeX -40, eyeY, 500, 220);
    
      colorMode(RGB, 255, 255, 255);
      fill(255);
      stroke(0);    
      ellipse(210, 180, 170, 120);
  
      colorMode(HSB, 360, 100, 100);
      for(int i =0; i <50; i +=5)
      {
        stroke(eyeclr, eyebright, 75 +i);
        ellipse(leyeX, eyeY, 80 -i, 80 -i);  
      }
  
      colorMode(RGB, 255, 255, 255);
      for(int i =0; i <50; i +=5)
      {
        stroke(65 -i);
        ellipse(leyeX, eyeY, 45 -i, 45 -i);   
      }
  
      noStroke();
      fill(255, 180);
      ellipse(leyeX -15, eyeY -15, 15, 15);
    }
// Smile--------------------------------------------    
    else if(smiled <31.0)
    {
      background(faceclr);   
      colorMode(HSB, 360, 100, 100);
      stroke(eyeclr, eyebright, 75);
      noFill();
    
      arc(eyeX -110, mouseY +100, 150, 200, PI, 2*PI);
      arc(eyeX +110, mouseY +100, 150, 200, PI, 2*PI);    
    } 
// Sad---------------------------------------------
    else if(sadd <31.0)
    {
      background(faceclr);    
      colorMode(HSB, 360, 100, 100);
      stroke(eyeclr, eyebright, 75);
      noFill();
    
      arc(eyeX -110, mouseY -100, 150, 200, 0, PI);
      arc(eyeX +110, mouseY -100, 150, 200, 0, PI);    
    }
// Zombie eye--------------------------------------
    else if(zeye <21.0)
    {
      background(faceclr);
      stroke(0);
      fill(255); 
 
      ellipse(eyeX -110, mouseY, 170, 120);
      ellipse(eyeX +110, mouseY, 170, 120);  
    }
// Hurt------------------------------------------------------  
    else if(mouseX >140 && mouseX <280 && mouseY >140 && mouseY <220 && mousePressed)
    {
      background(faceclr);   
      colorMode(HSB, 360, 100, 100);
      stroke(eyeclr, eyebright, 75);
      line(360, 180, 500, 140);
      line(360, 180, 500, 220);
      line(280, 180, 140, 140);
      line(280, 180, 140, 220);
      anger++;
    }
    else if(mouseX >360 && mouseX <500 && mouseY >140 && mouseY <220 && mousePressed)
    {
      background(faceclr);   
      colorMode(HSB, 360, 100, 100);
      stroke(eyeclr, eyebright, 75);
      line(360, 180, 500, 140);
      line(360, 180, 500, 220);
      line(280, 180, 140, 140);
      line(280, 180, 140, 220);
      anger++;  
    }
  }
// Anger-------------------------------------------------  
  else
  {
    background(faceclr);
    fill(255, 255*abs(sin(radians(2*anger -50))), 255*abs(sin(radians(2*anger -50))), anger -50);
    rect(0, 0, width, 40);
    fill(255, 255*abs(sin(radians(2*anger -20))), 255*abs(sin(radians(2*anger -20))), anger -50);
    rect(0, 40, width, 40);
    fill(255, 255*abs(sin(radians(2*anger +10))), 255*abs(sin(radians(2*anger +10))), anger -50);
    rect(0, 80, width, 40);
    fill(255, 255*abs(sin(radians(2*anger +40))), 255*abs(sin(radians(2*anger +40))), anger -50);
    rect(0, 120, width, 40);
    fill(255, 255*abs(sin(radians(2*anger +70))), 255*abs(sin(radians(2*anger +70))), anger -50);
    rect(0, 160, width, 40);
    fill(255, 255*abs(sin(radians(2*anger +100))), 255*abs(sin(radians(2*anger +100))), anger -50);
    rect(0, 200, width, 40);
    fill(255, 255*abs(sin(radians(2*anger +130))), 255*abs(sin(radians(2*anger +130))), anger -50);
    rect(0, 240, width, 40);
    fill(255, 255*abs(sin(radians(2*anger +160))), 255*abs(sin(radians(2*anger +160))), anger -50);
    rect(0, 280, width, 40);    
    fill(255, 255*abs(sin(radians(2*anger +190))), 255*abs(sin(radians(2*anger +190))), anger -50);
    rect(0, 320, width, 40);
    fill(255, 255*abs(sin(radians(2*anger +220))), 255*abs(sin(radians(2*anger +220))), anger -50);
    rect(0, 360, width, 40);
    fill(255, 255*abs(sin(radians(2*anger +250))), 255*abs(sin(radians(2*anger +250))), anger -50);
    rect(0, 400, width, 40);
    fill(255, 255*abs(sin(radians(2*anger +280))), 255*abs(sin(radians(2*anger +280))), anger -50);
    rect(0, 440, width, 40);
    
    colorMode(HSB, 360, 100, 100);
    stroke(eyeclr, eyebright, 75);
    line(380, 240, 500, 140);
    line(260, 240, 140, 140);
    if(mousePressed)
    {
      anger++;
    }
  } 
  
  anger = constrain(anger, 0.0, 200.0);
  //println(anger);
}

// Comfort-----------------------------------------------
void mouseMoved()
{
    anger -=0.2;
}

// Change eye color and bright---------------------------
void mouseDragged()
{
  int Xdiff = mouseX - pmouseX;
  int Ydiff = mouseY - pmouseY;
  
  if(Xdiff >0)
  {
    eyeclr++;
  }
  else if(Xdiff <0)
  {
    eyeclr--;
  }
  
  if(Ydiff >0)
  {
    eyebright++;
  }
  else if(Ydiff <0)
  {
    eyebright--;
  }  
  
  eyeclr = constrain(eyeclr, 0, 360);
  eyebright = constrain(eyebright, 20, 100);
}



/*
 * The Solar System
 * By Ronnie Mathes
 *
 * An animated visual representation of the Solar System's star and planets
 *
 *
 */

//Create variables for system objects and planetary attributes
float[] angle = {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
float[] scalar = {70,105,130,170,240,330,440,540};
float[] speed = {0.03,0.024,0.02,0.015,0.01,0.007,0.006,0.005};
static int count = 1;
float[] size = {7.5,12,15,12,50,30,25,26};
float sunsize = 70;
float[] view = {0.02,0.03,0.03,0.03,0.025,0.05,0.04,0.04};
int[] pc = {0,1,2,3,4,5,6,7};
float[] starx;
float[] stary;

//System setup
void setup()
{
  size(1000,700);
  smooth();

  
  //Create star locations
  starx = new float[600];
  stary = new float[600];
  for(int x = 0; x < 600; x++)
  {
    starx[x] = random(0,1000);
  }
  
  for(int y = 0; y < 600; y++)
  {
    stary[y] = random(0,700);
  }
      
}

void draw()
{
  background(0);
  fill(255);
  noStroke();
  
  //Populate stars in background
  for(int i = 0; i < 100; i++)
  {
    ellipse(starx[i],stary[i],3,3);
  }
  
  for(int i = 100; i < 350; i++)
  {
    ellipse(starx[i],stary[i],2,2);
  }
  
   for(int i = 350; i < 600; i++)
  {
    ellipse(starx[i],stary[i],1,1);
  }
  
  //Create sun
  fill(255,555,0);
  ellipse(500,350,sunsize,sunsize);
  //For loop to create the planets
  for(int i = 0; i < angle.length; i++)
  {
  size[i] = makePlanet(angle[i],scalar[i],speed[i],size[i],view[i],i,pc[i]);
  angle[i] += speed[i];

  }
  

}



//Function to create the planets
float makePlanet(float angle, float scalar, float speed, float size, float view, int n, int pc)
{
  float x;
  float y;
  
  //Planet location
    x = 500 + cos(angle+1) * scalar;
    y = 350 + sin(angle) * scalar;
  
  //Planet coloring
  switch (pc)
  {
    case 0:
      fill(142,89,86);
      break;
    case 1:
      fill(178, 102, 25);
      break;
    case 2:
      fill(29, 47, 237);
      break;  
    case 3:
      fill(196, 126, 85);
      break;
    case 4:
      fill(175,97,51);
      break;
    case 5:
      fill(213,216,47);
      break;  
    case 6:
      fill(32,98,227);
      break;
    case 7:
      fill(32,173,227);
      break;
 
  }  
  
  //For inner most planet only
if(n==0)
{
  //Record planets previous, current, and next location
  float t1 = cos(angle+1-speed);
  float t2 = cos(angle+1);
  float t3 = cos(angle+1+speed);
  //Determine which side of the sun the planet is on
  if((t2 > t3 && t2 > t1) || (t2 < t3 && t2 < t1))
  {
      switch(count)
      {
        case 0: count = 1;   break;
        case 1: count = 0;   break;
      }
  }
  
 //If planet is on backside of the sun
    if(count == 0)
    {
      if(cos(angle+1) < 0)
      {
        size-= view;
        ellipse(x,y,size,size);
      }
      else if(cos(angle+1) > 0)
      {
        size+= view;
        ellipse(x,y,size,size);
      }

    fill(255,255,0);
    ellipse(500,350,sunsize,sunsize);
    }
  //Else if planet is in front of the sun
    else if(count == 1)
    {
      if(cos(angle+1) > 0.0)
      {
        size+= view;
        ellipse(x,y,size,size);
      }
      else if(cos(angle+1) < 0.0)
      {
        size-= view;
        ellipse(x,y,size,size);
      } 
    }
  }
  else //For all other planets
  {
        if(cos(angle+1) > 0.0)
    {
      size+= view;
    ellipse(x,y,size,size);
    }
    else if(cos(angle+1) < 0.0)
    {
      size-= view;
      ellipse(x,y,size,size);
    } 
  }

//Create Jupiter's details
if(n==4)
{
  float s = size/50;
  strokeWeight(s*1);
  stroke(216,178,164,200); 
  beginShape();
  curveVertex(x-s*20,y-s*14);
  curveVertex(x-s*20,y-s*14);
  curveVertex(x-s*5,y-s*5);
  curveVertex(x+s*22,y-s*4);
  curveVertex(x+s*22,y-s*4);
  endShape();
  
  strokeWeight(s*4);
  beginShape();
  curveVertex(x-s*22,y-s*5);
  curveVertex(x-s*22,y-s*5);
  curveVertex(x-s*5,y+s*5);
  curveVertex(x+s*22,y+s*5);
  curveVertex(x+s*22,y+s*5);
  endShape();
  
  strokeWeight(s*2);
  beginShape();
  curveVertex(x-s*23,y+s*5);
  curveVertex(x-s*23,y+s*5);
  curveVertex(x-s*6,y+s*15);
  curveVertex(x+s*19,y+s*15);
  curveVertex(x+s*19,y+s*15);
  endShape();
  noStroke();
}

//Create Saturn's ring
if(n==5)
{
  float s = size/30;
  strokeWeight(s*5);
  stroke(227,220,142,200);
  noFill();
  bezier(x-s*12,y-s*10,x-s*100,y-s*60,x+s*100,y+s*80,x+s*12,y+s*7);
  noStroke();
}
//Create Uranus's ring
if(n == 6)
{
  float s = size/27;
  noFill();
  strokeWeight(1);
  stroke(199,204,232);
  bezier(x,y-12*s,x+5,y-70*s,x+5,y+70*s,x,y+12*s);
  noStroke();
}


  return size;
}
  
  
  


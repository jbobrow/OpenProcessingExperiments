
//attractor class made up of attractors which have a location, size/shape to draw, attraction or detraction (should make this a method of attractor class?)


class Attractor 
{ 
float x,y;
float stalkerdestinationx;
float stalkerdesinationy;
float particlecounter;
float particlecounter2;
int redcounter=0;
int bluecounter=0;
int crowdedcounter=0;
  
  Attractor(float _x, float _y ) //constructor 
  {
    x = _x;
    y = _y;
  }
  
  
  void spot() //method to draw itself as a little plus sign
  {

    line(x-4, y, x+4, y); 
    line(x, y-4, x, y+4);
  }
  
void countparticles()
{
for (int i=0; i<NUM_PARTICLES; i++)
  {
  float distance = sqrt( sq(particle[i].x-x) + sq(particle[i].y-y)); //calculate particle's distance from each attractor
  if (distance<10) //if distance is less than 100
    {
    particlecounter=particlecounter+.001;
   // println(particlecounter);
    } 
  } 
}
  
void countparticles2()
{
for (int i=0; i<NUM_PARTICLES2; i++)
  {
  float distance = sqrt( sq(particle2[i].x-x) + sq(particle2[i].y-y)); //calculate particle's distance from each attractor
  if (distance<10) //if distance is less than 100
    {
    particlecounter2=particlecounter2+.001;
   // println(particlecounter);
    } 
  } 
}


  void die()
  {

   x= random(width);
   y= random(height);
  }
  
  
  
  
void choseStalkerAttractor()
{
redcounter=0;
bluecounter=0;
for (int i=0; i<NUM_PARTICLES; i++)
  {

  float distance = sqrt( sq(particle[i].x-x) + sq(particle[i].y-y)); //calculate particle's distance from each attractor
  if (distance<40) //if distance is less than 50
    {
    redcounter=redcounter+1;
    } 
  }
   
  
for (int i=0; i<NUM_PARTICLES2; i++)
  {

  float distance2 = sqrt( sq(particle2[i].x-x) + sq(particle2[i].y-y)); //calculate particle's distance from each attractor
  if (distance2<40) //if distance is less than 50
    {
    bluecounter=bluecounter+1;
    } 
  } 
 crowdedcounter=redcounter+bluecounter;
  
  }
 
void checkColor()

{
for (int i=0; i<NUM_PARTICLES; i++) //blue particles
  {
  float distance2 = sqrt( sq(particle[i].x-x) + sq(particle[i].y-y)); //calculate particle's distance from each attractor
  if (distance2<60) //if distance is less than 50
    {
      if((bluecounter>0))
        {
          particle[i].colorT=particle[i].colorT+1;
        }
        else
        {
          particle[i].colorT=particle[i].colorT-.25;
        }    
    }
    else
    {
      particle[i].colorT=particle[i].colorT-.25;
    } 
    
    if (particle[i].colorT>1)
    {
      particle[i].colorT=1; 
    }
    if (particle[i].colorT<0)
      {
       particle[i].colorT=0; 
      }
    } 

   
  
for (int i=0; i<NUM_PARTICLES2; i++) //blue particles
  {
  float distance2 = sqrt( sq(particle2[i].x-x) + sq(particle2[i].y-y)); //calculate particle's distance from each attractor
  if (distance2<60) //if distance is less than 50
    {
      if((redcounter>0))
        {
          particle2[i].colorT=particle2[i].colorT+1;
        }
        else
        {
          particle2[i].colorT=particle2[i].colorT-.25;
        }    
    }
    else
    {
      particle2[i].colorT=particle2[i].colorT-.25;
    } 
    
    if (particle2[i].colorT>1)
    {
      particle2[i].colorT=1; 
    }
    if (particle2[i].colorT<0)
      {
       particle2[i].colorT=0; 
      }
    } 
  }



  
}



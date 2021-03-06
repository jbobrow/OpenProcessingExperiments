
float force=100; //attraction/repulsion force
particle[] particles;
int numparticles=2;
float dragfactor=0.60; //stop speeds from accumumulating too much
int selectedindex=-1; // index of the currently selected particle -1=none


void setup()
{
  size(800,800);
  background(0);
  stroke(255);
  strokeWeight(1);
  noFill();
  smooth();
  //frameRate(30);
  particles = new particle[numparticles];
  for(int i=0; i<numparticles; i++)
  {
    if (i%2==0) particles[i] = new particle(random(width/10, 9*width/10), random(height/10, 9*height/10), 1, 0, 0);
    else particles[i]= new particle(random(width/10, 9*width/10), random(height/10, 9*height/10), -1, 0, 0);
  }
}


void draw()
{
  background(0);
  for(int i=0; i<numparticles; i++)
  {
   
    float xaccel=0, yaccel=0;
    for(int j=0; j<numparticles; j++)
    {
      float ijdist = dist(particles[i].xpos, particles[i].ypos, particles[j].xpos, particles[j].ypos);
      float theta = atan2(particles[i].ypos-particles[j].ypos, particles[i].xpos-particles[j].xpos);
        
       
        
        if(ijdist>20) //attractive or repulsive forces depending on charges
        {
          xaccel+=  particles[i].charge * particles[j].charge * (force/(ijdist*ijdist)) * cos(theta); 
          yaccel+=  particles[i].charge * particles[j].charge * (force/(ijdist*ijdist)) * sin(theta); 
        }
        
        else if(ijdist>0.1) 
        {
          xaccel+=  (force/(pow(ijdist,4))) * cos(theta); 
          yaccel+=  (force/(pow(ijdist,4))) * sin(theta); 
        } 
        
        
        particles[i].xspeed+=xaccel;
        particles[i].yspeed+=yaccel;
   }
   if(particles[i].affected)
   {
     particles[i].move();
   }
   particles[i].render();
  }
 
}

void mousePressed()
{
   for(int i=0; i<numparticles; i++)
   {
     if (dist(mouseX, mouseY, particles[i].xpos, particles[i].ypos)<8)
     {
       selectedindex=i;
       particles[selectedindex].affected=false;
       break;
     }
   }
   
   if (selectedindex==-1)
   {
     float randno= (int)random(0, 2);
     if (randno==0) 
     {
       particles = (particle[])append(particles, new particle(mouseX, mouseY, 1, 0, 0));
     }
     else particles= (particle[])append(particles, new particle(mouseX, mouseY, -1, 0, 0));
     numparticles++;
   }
   
}

void mouseDragged()
{
   if(selectedindex!=-1)
   {
     particles[selectedindex].xpos=mouseX;
     particles[selectedindex].ypos=mouseY;
   }  
}

void mouseReleased()
{
  if(selectedindex!=-1)
  {
    particles[selectedindex].xspeed = mouseX-pmouseX;
    particles[selectedindex].yspeed = mouseY-pmouseY;
    particles[selectedindex].affected=true;
  }
    selectedindex=-1;
}




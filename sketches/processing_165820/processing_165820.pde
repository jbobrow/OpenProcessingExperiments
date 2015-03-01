
float counter = 50.0f;

int screensize = 500;

int colors[][] = new colors[255][3];

void treeBranch(int x1,int y1,int length,float rot,int level)
{
    if(length < 5.0f)
        return;
        
    float sway = sin(radians(counter)) * 2.0f;//(50 - counter) / 50.0f * 10.0f; 

    pushMatrix();
    
    translate(x1,y1);
    rotate(radians(rot + sway));  
    
    stroke(colors[level][0], colors[level][1], colors[level][2]);
    
    line(0,0,0,-length);
    
    treeBranch(0,-length, length*0.7f, 25.0f, level + 1);
    treeBranch(0,-length, length*0.7f, -25.0f, level + 1);
    
    popMatrix();
}


void setup() 
{  //setup function called initially, only once
  size(screensize , screensize );
  background(255);  //set background white
  counter = 0;
  
  for(int i = 0; i < 255; ++i)
  {
      colors[i][0] = random(255);
      colors[i][1] = random(255);
      colors[i][2] = random(255);
  }
}

void draw() 
{
    background(255);  //set background white
    treeBranch(screensize/2.0f,screensize, 120.0f, 0.0f, 0);
    
    counter += 0.016f * 30.0f;
    
    if(counter > 360.0f) counter -= 360.0f;
}

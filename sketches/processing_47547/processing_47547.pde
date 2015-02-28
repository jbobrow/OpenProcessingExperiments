
//Jordan Logo
//vector
//end at frame 354
int RADIAN_STEPS = 200;
color COLOR1, COLOR2;
int radius_multiplier = 50;
float amt = 0;


void setup()

{
  size(1000,500);
  smooth();
  COLOR1 = color(19,80,79);
  COLOR2 = color(2,57,56);

  
}

void draw()
{
  if (frameCount > 250)
  {
    amt = constrain(abs(log((frameCount - 150) / 100.0)),0,1);
    if(frameCount > 550)
    {
      //amt = 1/((frameCount/10.0) - 550);
    }
    
  }
  
  
  fill(255,90);
  rect(0,0,width,height);
  int radius;
  for (int i = 1; i < 4; ++i)
  {
    pushMatrix();
    translate(width/2,height/2);
    radius = radius_multiplier * i;
    //draw loop
    //beginShape();
    for(int j = 0; j < RADIAN_STEPS; ++j)
    {
      noFill();
      strokeWeight(0.7);
      //strokeWeight(constrain(0,1.2,abs(1/tan(3.14*(j+frameCount)/RADIAN_STEPS))));
      stroke(blend_color(COLOR1,COLOR2,abs(RADIAN_STEPS/2 - j)*2.0/RADIAN_STEPS),220);
      float xpos = lerp(radius*cos(2*j*3.14/RADIAN_STEPS),
         radius*cos(2*j*3.14/RADIAN_STEPS) + radius/1.4*sin((j)*3.14/RADIAN_STEPS)*tan((j)*3.14/RADIAN_STEPS),
        amt); 
      
      float ypos = lerp(radius*sin(2*j*3.14/RADIAN_STEPS),
            radius*sin(2*(j)*3.14/RADIAN_STEPS),
            amt);
            
      float rad = lerp(3,
         7+4*tan((j+frameCount)*3.1415/RADIAN_STEPS),
        amt);
      
      //ellipse(radius*cos(2*j*3.14/RADIAN_STEPS) + radius/1.4*sin((j)*3.14/RADIAN_STEPS)*tan((j)*3.14/RADIAN_STEPS),radius*sin(2*(j)*3.14/RADIAN_STEPS),7+4*tan((j+frameCount)*3.1415/RADIAN_STEPS),7+4*tan((j+frameCount)*3.1415/RADIAN_STEPS));
      //ellipse(radius*cos(2*(j)*3.14/RADIAN_STEPS) + radius/1.4*sin((j)*3.14/RADIAN_STEPS),radius*sin(2*(j+frameCount)*3.14/RADIAN_STEPS),7+4*tan((j+0)*3.1415/RADIAN_STEPS),7+4*tan((j+0)*3.1415/RADIAN_STEPS));
      ellipse(xpos,ypos,rad,rad);

    }
    
   popMatrix();
  }
 
      
}

color blend_color(color x, color y, float factor)
{
  
  color output;
  if (factor < 0) 
  {
    output = x;
    return output;
  }
  else if (factor > 1)
  {
    output = y;
    return output;
  }
  
  output = color((1-factor)*red(x)+factor*red(y),(1-factor)*green(x)+factor*green(y),(1-factor)*blue(x)+factor*blue(y),(1-factor)*alpha(x)+factor*alpha(y));
 
  return output;
}




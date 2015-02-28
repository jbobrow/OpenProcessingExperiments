
import processing.pdf.*;

void setup()
{
  //size(300, 800);
  size(300, 800);
  
  //color range is 0 - 255
  background(0);
  smooth();
  noLoop();
}

void draw()
{
  background(25);
  //noStroke();
  
  //lines right half
  for(int i = 0; i < height; i+=height/50)
  {
    line(0, 0, width, i);
  }
  pushMatrix();
    translate(width/2, height/2);
    scale(1,-1);
    translate(-width/2, -height/2);
    for(int i = 0; i < height; i+=height/50)
    {
      line(0, 0, width, i);
    }
  popMatrix();
  //end
  
  pushMatrix();
    translate(width/2, height/2);
    scale(-1);
    translate(-width/2, -height/2);
    for(int i = 0; i < height; i+=height/50)
    {
      line(0, 0, width, i);
    }
    pushMatrix();
      translate(width/2, height/2);
      scale(1,-1);
      translate(-width/2, -height/2);
      for(int i = 0; i < height; i+=height/50)
      {
        line(0, 0, width, i);
      }
    popMatrix();
  popMatrix();
  
  
  /*
  //ball of yarn
  pushMatrix();
    translate(width/3, height/2);
    scale(.5);
    translate(-width/2, -height/2);
    //bezier
    for(int j = 0; j < 360; j += 20)
    {
      pushMatrix();
        translate(j*2, height/2);
        rotate(radians(j));
        translate(-width/2, -height/2);
        for(int i = 0; i < 50; i++)
        {
          fill(50,0,200, 5);
          bezier(0, 0, random(0,width), random(0,height), 
            random(0,width),random(0,height), width, height);
        }
      popMatrix();
    }
   
   //curve
    for(int j = 0; j < 360; j += 20)
    {
      pushMatrix();
        translate(j*2, height/2);
        rotate(radians(j));
        translate(-width/2, -height/2);
        for(int i = 0; i < 50; i++)
        {
          fill(150,0,150, 10);
          curve(0, 0, random(0,width), random(0,height), 
            random(0,width),random(0,height), width, height);
        }
      popMatrix();
    }
  popMatrix();
  //end ball of yarn
  /*
  
  
  //noStroke();
  
  /*
  stroke(0, 50);
  for(int i = 0; i < height; i+=height/50)
  {
    line(0, 0, width, i);
  }
  */
  /*
  pushMatrix();
  for(int i = 0; i < 360; i += 1)
  {
    float x = 0, y = 0, oldX = 0, oldY = 0;
    
    for( int j = 0; j < 40; j++)
    {
      x+=cos(radians(i))*15;
      y+=sin(radians(i))*15;
      
      stroke(random(0,255),0,0, 50 + j);
      
      pushMatrix();
        rotate(radians(random(-1,1)));
        translate(width/2, height/2);
        line(oldX, oldY, x, y);
      popMatrix();
      
      oldX = x;
      oldY = y;
    }
  }
  popMatrix();
  */
  

  //spiral
  noStroke();
  for(int j = 0; j < 360; j += 20)
  {
    float scaler = .5, alpha_er = 7;
    
    pushMatrix();
      translate(width/2, height/2);
      rotate(radians(j));
      translate(-width/3, -height/2);
      //the red rocket
      for(int i = 0; i < 460; i+=10)
      {
        fill(255,j,0, alpha_er);
        pushMatrix();
          translate(width/2, height/2 + i);
          scale(scaler);
          translate(-width/2, -height/3);
          triangle(width/3, 2*height/3, width/2, height/3, 2*width/3, 2*height/3);
        popMatrix();
        
        scaler += 0.02;
        alpha_er += 2;
      }
    popMatrix();
  }
 
  //center eye
  for(int i = 0, scaler = 75; i < 100; i++, scaler/=1.035)
  {
    //center eye
    fill(150,scaler,0, 10);
    ellipse(width/2, height/2, scaler, scaler);
  } 
  
  //slit
  fill(0, 20);
  for(int i = 0; i < 10; i++)
  {
    ellipse(width/2, height/2, 25-i, height);
    //ellipse(width/2+i, height/2+i, 20-i, height);
    //ellipse(width/2-i, height/2-i, 20-i, height);
  }
  
  fill(0);
  ellipse(width/2, height/2, 10, height);
  
  fill(255, 20);
  for(int i = 0; i < 7; i++)
  {
    ellipse(width/2+i, height/2, 7-i, 7-i);
    ellipse(width/2-i, height/2, 7-i, 7-i);
  }
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  exit();
}



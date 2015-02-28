


void setup()
{
  size(800, 300);
  smooth();
}

void draw()
{
  background(100,70,0);
  noStroke();
  
  //vertical bg gradient
  for(int i = 0, j = 0; i < height; i+=10, j+=5)
  {
    fill(0,j);
    pushMatrix();
      translate(0,i);
      rect(0,0,width,20);
    popMatrix();
  }
  
  //horizontal bg gradient
  for(int i = 0, j = 0; i < width; i+=10, j+=2)
  {
    fill(0,j);
    pushMatrix();
      translate(i,0);
      rect(0,0,20,height);
    popMatrix();
  }
  
  for(int i = 0, j = 0; i < width; i+=10, j+=2)
  {
    //strokeWeight(4);
    stroke(100+j,j,100-j);
    pushMatrix();
      translate(width/2,0);
      //if(j <= 4){ scale(j*0.1,1); }
      //rotate(radians());
      scale(0.5,1);
      
      //right half of line pattern
      pushMatrix();
        translate(i,0);
        line(0,0,width/2,i);
      popMatrix();
      
      pushMatrix();
        translate(i,height);
        scale(1,-1);
        line(0,0,width/2,i);
      popMatrix();
      
      //left half
      pushMatrix();
        scale(-1,1);
        pushMatrix();
          translate(i,0);
          line(0,0,width/2,i);
        popMatrix();
        
        pushMatrix();
          translate(i,height);
          scale(1,-1);
          line(0,0,width/2,i);
        popMatrix();
      popMatrix();
    popMatrix();
  }
  
  //transparent yellow pupil
  noStroke();
  fill(100,90,0,20);
  for(float i = 1; i > 0; i-=0.05)
  {
    pushMatrix();
      translate(width/2,height/2);
      scale(i);
      ellipse(0,0,200,200);
    popMatrix();
  }
  
  //transparent black over pupil
  fill(0,80);
  pushMatrix();
    translate(width/2,height/2);
    //scale(i);
    ellipse(0,0,200,200);
  popMatrix();
  
  fill(0,10);
  for(float i = 1; i > 0; i-=0.05)
  {
    pushMatrix();
      translate(width/2,height/2);
      scale(i);
      ellipse(0,0,100,100);
    popMatrix();
  }
  
  //light burst
  fill(10,0,100,7);
  for(int i = 0; i < 360; i+=10){
    pushMatrix();
      translate(width/2,height/2);
      rotate(radians(i));
      translate(-width/2,-height/2);
      quad(0,0,0,300,800,0,800,300);
    popMatrix();
  }
  
  fill(255);
  pushMatrix();
    translate(width/2,height/2);
    ellipse(0,0,3,3);
  popMatrix();
  
}



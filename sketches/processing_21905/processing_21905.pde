
void setup()
{
  size(400,400);
  smooth();
  background(255);
  
}

void draw() {
  int mil = second();
  float rand1 = random(width/2);
  float rand2 = random(width/2); 
  float rand_size = random(50);
  float col1 = random(255);
    float col2 = random(255);
      float col3 = random(255);
      
      float randX = random(width);
      float randY = random(height);
    float randsizeX = random(20);
     float randsizeY = random(20);
     float randsizeX2 = random(20);
     float randsizeY2= random(20);
  
  pushMatrix();
    translate(width/4,height/4);
  ellipse(rand1,rand2,rand_size,rand_size);
  popMatrix();
  fill(255);
  
  if (randX <= (width/4)-20 || randY <=(height/4)-20 ||randX >= (3*width/4)+20 
 || randY >=(3*height/4)+20 )
  {
    triangle(randX, randY,randX+randsizeX, randY+randsizeX,randX-randsizeX2, randY+randsizeX2);
  }
  if(mil%30==0)
  {
  //fill(255,3);
  //rect(0,0,width,width);
  }
  fill(col1,col2,col3);

}




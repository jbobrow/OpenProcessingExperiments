
float temp = 0;
int ypos = 0;
int red = 0;
void setup(){
  frameRate(36);
  size(800,800);
 
}

void draw(){
  temp = int (random (height));
  //background(255,255,255);

  for (int x = 0; x <= width; x = x + 20){
  temp = int(random(600));
  cubes_from_space(x, temp, random(255));


  }


}

void cubes_from_space(int xpos,float ysize, float tran){   
 
  if (int(random(50)) == 20){
  noStroke();
    fill(random(255),random(255),255,tran);  
  rect(xpos, 100, 20, ysize);
  }
  else{   
  fill(random(255),tran);  
  rect(xpos, 10, 20, ysize);
  }
  
 
}




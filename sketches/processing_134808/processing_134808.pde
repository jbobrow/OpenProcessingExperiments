
int x = 0;
int bounce = 10;

float temp = 0;

void setup(){
  size(800,600);

}

void draw(){
 
 noStroke();
  
 x = x + bounce;

 
 if(x >= width){
   
   x=width;
  background(random(255),random(255),random(255));

   fill(random(255),random(255),random(255));
   
   bounce = bounce * -1;
 }
 
 if(x <= 0){
  background(random(255));
  fill(random(255),random(255),random(255));
  bounce = bounce * -1;
  }
  
  //for (int x = 0; x <= width; x = x + 20) 
  //{
  temp = int(random(400));
  cubes_from_space(x, temp);
  cubes_from_space2(x, temp);
  temp = 0;
  //}
}

void cubes_from_space(int xpos,float ysize){ 
  noStroke();  
  fill(random(255),random(255));
  rect(xpos, 800, 20, -ysize);
}

void cubes_from_space2(int xpos,float ysize){ 
  noStroke();  
  fill(random(255),random(255),random(255));
  rect(xpos, 0, 20, ysize);
}




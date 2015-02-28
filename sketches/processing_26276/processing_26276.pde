
int x = 10;
int y = 10;
int tria = 70;

void setup(){
  size (500,500);
  smooth();
}
//example of most skills we learned today
void draw(){
  fill(255,4);
  rect(0,0,width,height);
  //example on the orientation of for loops, j loop only goes after i loop goes for the 10 times
  pushMatrix();
  rotate(random(720));
  for(int j = 0; j < random(1,7) ; j+=random(1,4)){
    for(int i = 0; i < random(1,7) ; i+=random(1,4)){
      noStroke();
      fill(random(180,255), random(160,255), random(80,227));
      //ellipse((x+i*50), y+j*50, 50, 50);  
      triangle(x+i*tria, y+j*tria, (x+random(10,50))+i*tria, (y-random(10,50))+j*tria, (x+random(20,70))+i*tria, y+j*tria);
    }
  }
  popMatrix();
}

//triangle(200,300,0,330,400,330);


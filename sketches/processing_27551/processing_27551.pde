
int x = 20;
int y = 10;
int tria = 70;
 
void setup(){
  size (400,400);
  smooth();
}

void draw(){
  fill(random(150),10);
  rect(2,0,width,height);
  
  pushMatrix();
  rotate(random(800),20);
  for(int j = 0; j < random(5,7) ; j+=random(1,4)){
    for(int i = 0; i < random(7,7) ; i+=random(1,4)){
      noStroke();
      fill(random(50), random(120), random(100));
      //ellipse((x+i*50), y+j*50, 50, 50); 
      triangle(x+i*tria, y+j*tria, (x+random(10,50))+i*tria, (y-random(10,50))+j*tria, (x+random(20,70))+i*tria, y+j*tria);
    }
  }
  popMatrix();
}
 


                
                                

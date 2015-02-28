

int x=5;
int y=20;
void setup (){
  size (500,500);
  smooth();
  frameRate (10);
}


void ellipseSpaz (int x, int y){
  for (int j=100;j>50;j=j+1);
    ellipse (x,y,30,30);
    fill (210,80,random(40));
    
}

void draw(){
   background (250,50,70,110);
    for (int z=50; z<390; z=z+10) {
      fill (z,z+x, int(random(15))+z,95);
    ellipse (z,175+ int(random(50)), (random(40)), (random (45)));
    ellipse (z, int(random(350)),20+int(random(35)), 30);
  }

  }



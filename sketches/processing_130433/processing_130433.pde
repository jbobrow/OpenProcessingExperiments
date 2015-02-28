
//Nicolette Hashey
//Black and White Triangles
//1/28/2014

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  fill(0);
  noStroke();
  
  
  
  for (int x=0; x<width; x+=20) {
    for (int y=0; y<height; y+=20) {
      int p = int (random(1, 2));// random triangle
      int f = int (random(3, 4));//fill color
      if (p==1 && f==3){
       fill(0);//fill 1
       triangle(x,y,x+20,y,x+20,y+20);//triangle 1
      }
      if(p==2 && f==3){
       fill(0);//fill 1
       triangle(x,y+20,x+20,y+20,x+20,y);//triangle 2
      }
      if(p==1 && f==4){
       fill(255);//fill 2
       triangle(x,y,x+20,y,x+20,y+20);//triangle 1
      }
      if(p==2 && f==4){
       fill(255);//fill 2
       triangle(x,y+20,x+20,y+20,x+20,y);//triangle 2
      }

    }
  }
}
      
      







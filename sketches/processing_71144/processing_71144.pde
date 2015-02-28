
int sz=15;
int x,y;
void setup() {
  size(500, 500);
  background(255);
  smooth();
  noStroke();
  fill(0);
}

void draw(){
  if (frameCount<2){
  for( y=0;y<500;y+=sz){
    for(x=0;x<500;x+=sz){
      int r=int(random(1,6.99));
      System.out.println(r);
     //int r=3;
      if(r==1){
        triangle(x, y, x+sz, y, x,  y+sz);
      }
      if(r==2){
       triangle(x,y,x+sz,y, x+sz,y+sz);
      }
      if(r==3){
        triangle(x,y,x+sz,y+sz,x,y+sz);
     }
      if(r==4){
        triangle(x+sz,y,x+sz,y+sz,x,y+sz);
      }
      if(r==5){
        rect(x,y,sz,sz);
      }
    }
  }
  }
}

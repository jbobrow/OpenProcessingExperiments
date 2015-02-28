
int blocksize = 15;

void setup(){
  size(300,300);
}

void draw(){
  stroke(255,255,255);
  int j = 0;
  while(j <= height - blocksize){
      int i = 0;
      while(i <= width - blocksize){
        fill (random(0,255),random(0,255),0, random(0,255));
        rect(i,j,blocksize,blocksize);
        i = i + blocksize;
      }
      j = j + blocksize;
  }
  stroke(0,0,0);
    for(int x = 15; x < 300; x +=30){
    for(int y = 0; y < 300; y +=30){
      triangle(x,y, x-15,y +30,x +15,y +30);
      noFill();  
    }
  }
}



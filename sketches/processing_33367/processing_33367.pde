
// Li Chung Chang
// h12312315@gmail.com

void setup(){
  size(256,256);
}

void draw(){
  for(int i=0; i < width; i =i+1){
    for(int j=0; j < height; j=j+1){
    point(i, j);
    stroke(0,i,j);
    }
  }
}


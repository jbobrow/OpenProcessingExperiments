
class bitmap3D{
  int cubeSize = 128;
  int border = 16;
  color[] data;
  bitmap3D(int cs){
    cubeSize = cs;
    data = new color[int(pow(cubeSize,3))];
//    println(int(pow(cubeSize,3))+" pixels");
  }
  int cubeIndex(int x,int y,int z){
    return x+y*cubeSize+z*cubeSize*cubeSize;
  }
  color get(int x,int y,int z){
    return data[cubeIndex(x,y,z)];
  }
  void set(int x,int y,int z,color c){
    data[cubeIndex(x,y,z)] = c;
  }
  PImage toImage(){
    PImage img = createImage(
    imageSize(),imageSize(),RGB);
//    PImage img = createImage(width,height,RGB);
//    img.background(0);
    for(int i=0;i<cubeSize;i++){
      for(int j=0;j<cubeSize;j++){
        for(int k=0;k<cubeSize;k++){
          if(brightness(data[cubeIndex(i,j,k)])>0){
            int scrX = img.width/2+i*2-j*2;
            int scrY = img.height/2-k*2+j+i;
            for(int m=0;m<2;m++){
              for(int n=0;n<2;n++){
                img.set(scrX+m,scrY+n,data[cubeIndex(i,j,k)]);
              }
            }
          }
        }
      }
    }
//    img.resize(width,height);
    return img;
  }
  int imageSize(){
    return cubeSize*4+border*2;
  }
}


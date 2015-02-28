
void setup(){
  size (295,300);
  frameRate (30);
}
void draw(){
  background (0);
  smooth();
  strokeWeight(3);
  int coulH = int(map(mouseX,0,width,0,255));
  int coulV = int(map(mouseY,0,width,0,255));
  int divV = int(map(mouseX,0,width,1,20));
  int divH = int(map(mouseY,0,height,1,20));
  for(int i=width/divV;i<width;i=i+width/divV){
    stroke(coulH,coulV,128);  
    line(i,0,i,height);
  }
  for(int j=height/divH;j<height;j=j+height/divH){
    stroke(coulV,coulH,128);
    line(0,j,width,j);
  }
}



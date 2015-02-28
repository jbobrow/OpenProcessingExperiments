
PImage myImage;

void setup(){ 
  size(800,600);
  myImage=loadImage("ventr.jpg");
}
void draw(){
  background(0,0,0);
  
 for(int i=0; i<1000; i=i + 100){
      for(int j=30; j<1000; j=j + 100){
      tint(i,random(255),random(255),j);
      image(myImage,i,j,100,100);
    }
 }
}


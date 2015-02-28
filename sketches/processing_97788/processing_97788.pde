
void setup(){
  size(500,500);
  background(0);
  frameRate(10);
  smooth();
}

PImage img[] = new PImage[7];
int i = 0;
int k=0;

void draw(){
  if(k==0){
    for(int j=0;j<7;j++){
      img[j] = loadImage(j + ".jpg");
    }
    k=+1;
  }
  i++;
  if(i==7){
    i = 0;
  }
  
  image(img[i],0,0,width,height); 
}



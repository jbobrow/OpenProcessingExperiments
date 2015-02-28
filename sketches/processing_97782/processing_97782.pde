
void setup(){
  size(500,500);
  background(0);
  frameRate(2);
  smooth();
}

PImage img;
int i = 1;
int amount = 0;

void draw(){
  if(amount < 15){
    int rotateAm = int(random(3,20));
    int posNeg = 1;
    if(int(random(1,2))==2){
      posNeg=-1;
    }
    rotate(posNeg *PI/rotateAm);
    i++;
    if(i==6){
      i = 1;
    }
    img = loadImage(i + ".jpg");
    image(img,int(random(50,width-100)),int(random(50,height-100)),width/4,height/4);  
    amount++;
  }
}




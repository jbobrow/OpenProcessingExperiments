
// Austin S. Lee 8Feb15
//Click to change pic

PImage[] imageName= new PImage[3];
int index=0;

void setup(){
  size(500,500);
  for(int i=0; i<imageName.length; i++){
    imageName[i]= loadImage("imageName"+i+".png");
  }
}

void draw(){

  image(imageName[index], width/2-200, height/2-200, 400,400);
}

void mousePressed(){
  index+=1;
  if(index>=imageName.length){
    index=0;
  }
}



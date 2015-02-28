
PImage dots;
PImage[] masks = new PImage[5];
int frame = 1;

void setup(){
  size(500,500);
  dots = loadImage("dotPat.png");
  for(int i=1;i<6;i++){
    masks[i-1] = loadImage("moonW" + i + ".png");
  }
}

void draw(){
  if(mousePressed){
    frame = frame+1;
    if(frame>4){
      frame=0;
    }
  }
  image(dots,mouseX,mouseY);
  image(dots,mouseX,mouseY-500);
  image(dots,mouseX-500,mouseY);
  image(dots,mouseX-500,mouseY-500);
  
  image(masks[frame],0,0);
}



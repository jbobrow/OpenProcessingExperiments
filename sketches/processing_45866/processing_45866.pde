
//By Ellen Wang


int numFrames = 6;  
int frame = 0;
PImage[] images = new PImage[numFrames];
PImage rainbow;
int conx;

int trailNum = 50;

int prevx[];
int prevy[];

void setup(){
  size(600,300);
  
  prevx = new int[trailNum];//make new array with trailNum spots
  prevy = new int[trailNum];
  
  rainbow = loadImage("rainbow.png");
  
  noCursor();
  
   frameRate(15);
  
  images[0]  = loadImage("nc0.gif");
  images[1]  = loadImage("nc1.gif"); 
  images[2]  = loadImage("nc2.gif");
  images[3]  = loadImage("nc3.gif"); 
  images[4]  = loadImage("nc4.gif");
  images[5]  = loadImage("nc5.gif");
  
}

   
  
 
 
void draw() 
{ 
  background(18,48,162);
  conx = constrain(mouseY,115,145);
  
 
  
 
  
  
  for(int i = 1;i <trailNum;i++){  //pushback loop
      prevx[i-1] = prevx[i];
      prevy[i-1] = prevy[i];
  }
  prevx[trailNum -1] = mouseX;
  prevy[trailNum -1] = conx;
  for (int i =0; i <trailNum; i++){
  image(rainbow,prevx[i],prevy[i],i,i);
  }
  
  frame++;
  if (frame ==numFrames){
  frame=0;
}
  image(images[frame], mouseX, conx);
  noStroke();
  rect(random(0,600),random(0,300),random(5,10),random(5,10));
  rect(random(0,600),random(0,300),random(5,10),random(5,10));
  
  
 
  
}


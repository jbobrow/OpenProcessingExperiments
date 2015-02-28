
PImage grnd,pipe,c3;
int x1, x2, x3,y1, y2, y3;
int xloc, yloc;
PFont ft;
int clouds = 30;
int[] xs = new int[clouds];
int[] ys = new int[clouds];
int[] pipeX = new int[5];
int[] pipeY = new int[5];
int[] pipeH = new int[5];
float[] speeds = new float[clouds];
int[] cldCount = new int[clouds];

PImage[] cloudImages = new PImage[3];


void setup(){
  size(600,600);
  ft = loadFont("AtariClassicChunky-16.vlw");
  textFont(ft,16);

  grnd = loadImage("ground.png");
  pipe = loadImage("pipe.png");

  cloudImages[0] = loadImage("1c.png");
  cloudImages[1] = loadImage("2c.png");
  cloudImages[2] = loadImage("3c.png");
  
  for(int x = 0 ; x < xs.length; x++){
    xs[x] = (int)random(0,width);
    ys[x] = (int)random(height-100);
    speeds[x] = random(.001, .9); 
    cldCount[x] = (int)random(0,3);
  }
  
  for(int h = 0 ; h < pipeX.length; h++){
    pipeX[h] = (int)random(width);
    pipeY[h] = height-19;
    pipeH[h] = (int)random(0,50);
  }
}  

void draw(){
  
 // background(63,191,255);
 fill(63, 191,255,80);
 rect(0,0,width,height);
  fill(255);
  stroke(150);
  text("abcdefghijklmnopqrstuvwxyz01234567890",1,20);
  for(int x = 0 ; x < xs.length; x++){
    image(cloudImages[cldCount[x]], xs[x], ys[x]);
    xs[x] -= speeds[x];
    if(xs[x] <= 0){
      xs[x] =  width+cloudImages[cldCount[x]].width;
      ys[x] = (int)random(height-100);
      cldCount[x] = (int)random(0,3);
    }    
  } 
  
  for(int h = 0; h < pipeX.length; h++){
    pipeX[h] -= 1;
    println(pipeX[h]);
    if(pipeX[h] <= 0){
      pipeX[h] = (int)random(width,width+100);
    }
    image(pipe,pipeX[h], height-90+pipeH[h]);
    
  }
  
    //Ground
    image(grnd, 1, height-19);
    image(grnd, 1+grnd.width, height-19);
    image(grnd, 1+grnd.width*2, height-19);
    image(grnd, 1+grnd.width*3, height-19);
 
}




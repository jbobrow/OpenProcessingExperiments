
int r;
int g;
int b;
int bgx;
int bgy;
int inc;
int x;
int y;
PImage flag;
PFont word;

void setup(){
  smooth();
  size(600,600);
  bgx = 5;
  bgy = 1;
  r=1;
  g=1;
  b=1;
  x = 300;
  y = 300;
  flag = loadImage("data/flag.png");  
  //bg
  for(int h = 0; h < 600; h++){
    
    for (float i = 0; i < 600; i=i+2){
      
     noStroke();
     fill(random(140,160), random(230,255), random(200,230));
     ellipse(bgx, bgy+i, 1, 6); 
    }
    
    for (float i = 0; i < 600; i++){

     noStroke();
     fill(0+i, 30+i, 255-i);
     rect(bgx, bgy+i, 1, 1); 
    }    
    
    bgx = h;

  }
  //end of bg  
  image(flag, 293, 283);
  fill(100);
  word = loadFont("01.vlw");
  textFont(word, 28);
  text("use up, down, left, and right key to move. \nSpace key to flag.", 50,50);
  
}

void draw(){

 
  /*
  noStroke();
  fill(r+inc,g+inc,b+inc);
  ellipse(bgx+inc, bgy+inc, 1, 1);
 inc = inc+1;
 
*/
}

void keyPressed(){
  fill(0);
  ellipse(x, y, 3, 3);
  
  if (keyCode == UP){
    y = y-1;
  }
  
  if (keyCode == DOWN){
    y = y+1; 
  }
  
  if (keyCode == LEFT) {
   x = x-1; 
  }
  
  if (keyCode == RIGHT){
   x = x+1; 
  }

  if (key == 32) {
   image(flag, x-7, y-17); 
  }
}


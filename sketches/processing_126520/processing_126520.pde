
PImage apple;
PImage tree;

void setup() {
 
  size(450, 450);
  background(100);
  noStroke();
  frameRate(60); 
  smooth();
  fill(0);
  apple = loadImage("apple.png");
  tree = loadImage("tree.png");
}

void mouseReleased(){
  if(mouseX>=0 &&mouseX<=width &&mouseY>=250 &&mouseY<=400){
    imageMode(CENTER);
    tint(100);
    image(tree,mouseX,325,150,150);
  if(mouseX>=0 &&mouseX<=width &&mouseY>=250 &&mouseY<=400){
    }}
}

void draw(){
  ball();
  fill(255,255,200,200);  
  ellipse(350,100,100,100);
 if(mousePressed){ 
  if(mouseX>=300 &&mouseX<=400 &&mouseY>=50 && mouseY<150){
  fill(255,255,100);
  ellipse(350,100,100,100);
  }}
  fill(255);
  rect(0,400,width,height);
}

//ball function
  int eSize = 20;
  int i;
  int count = 0;
  int x[ ]  = new int [10000];
  int y[ ]  = new int [10000];
  int xspeed[ ]  = new int [10000];
  int yspeed[ ]  = new int [10000];

void ball(){
  imageMode(CORNER);
  tint(255,255,255);
for(int i = 0; i<count; i +=15){
   image(apple, x[i], y[i], eSize, eSize );
    x[i] = x[i] + xspeed[i];
    y[i] = y[i] + yspeed[i];
    if(y[i] <= 0){
      yspeed[i] = -yspeed[i]; 
    }if( x[i] >= width || x[i] <= 0){
      xspeed[i] = -xspeed[i];
    }if(x[i]>0 && x[i]<450){
    }if(eSize<15){
    eSize ++;
    }
    }
}

void mouseMoved(){
   if( count < 10000 ){
     x[count] = (int)random(400);
     y[count] = (int)random(200);
     xspeed[count] = (int)random(2,1);
     yspeed[count] = (int)random(1,2);
     count++;
   }
}




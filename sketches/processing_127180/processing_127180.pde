

PImage apple;
PImage tree;
PImage building;

void setup() {
 
  size(450, 450);
  background(100);
  noStroke();
  frameRate(30); 
  smooth();
  fill(0);
  apple = loadImage("apple.png");
  tree = loadImage("tree.png");
  building = loadImage("house1.png");
}

void draw(){
    ball();
  imageMode(CENTER);
  fill(255,255,100);  
  ellipse(350,100,100,100);
  fill(255);
  rect(0,400,width,height);
  
    if(mousePressed){   //æ��
  if(mouseX>=300 &&mouseX<=400 &&mouseY>=50 && mouseY<150){
  fill(255,255,0);
  ellipse(350,100,100,100);
  }}
}

void mouseReleased(){ //ç�»å��ã��è¡¨ç¤ºã��ã��ã��ç¯�å�²
  if(mouseX>=0 &&mouseX<=width &&mouseY>300 &&mouseY<=400){
    tint(255);
    image(building,mouseX,350,100,100);
  }if(mouseX>=0 &&mouseX<=width &&mouseY>150 &&mouseY<300){
    tint(255);
    image(tree,mouseX,300,150,150);
  }
}

//ball function
  int eSize = 13;
  int i;
  int count = 0;
  int x[ ]  = new int [10000];
  int y[ ]  = new int [10000];
  int xspeed[ ]  = new int [10000];
  int yspeed[ ]  = new int [10000];

void ball(){
  imageMode(CORNER);
   for(int i = 0; i<count; i +=50){
   image(apple, x[i], y[i], eSize, eSize );
    x[i] = x[i] + xspeed[i];
    y[i] = y[i] + yspeed[i];
    if(y[i] <= 0){
      yspeed[i] = -yspeed[i]; 
    }if( x[i] >= width ){
      x[i]=0;
    }
}
}

void mouseMoved(){
   if( count < 10000 ){
     x[count] = (int)random(450);
     y[count] = (int)random(100);
     yspeed[count] = (int)random(2,1);
     xspeed[count] = (int)random(1,2); 
     count++;
   }
 }
 
   void keyPressed(){  //å��é�¤
    if(key == CODED) {
    if(keyCode == SHIFT){
     fill(100);
     ellipse(mouseX, mouseY, 100,100);
    }
    }
 }


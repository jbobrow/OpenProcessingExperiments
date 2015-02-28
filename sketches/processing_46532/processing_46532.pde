

PImage mainSquare;
PImage []  man = new PImage[3];
int runningIndex=0;
int level=1;

float posx;
float posy;
float speed=5;
float [] mapx=new float[500];
float [] mapy=new float[500];

void setup() {
  frameRate(10);
  size(600, 600);
  smooth();

///////////////hero movment//////////
  mainSquare=loadImage("square_1.png");
  for(int lop=1;lop<3;lop++){
  man[lop]=loadImage("man_"+lop+".png");
  }
  
  posx=200;
  posy=470;
  
  //////////////map////////////
  for(int lop=0;lop<width/10;lop++){
  mapx[lop]=0+(10*lop);
  mapy[1]=500;
  }
}


void draw() {
  background(255);  

  if(keyPressed==false){
    image(man[2],posx,posy);
  }
  goLeft();
  goRight();
  gameMap();
}

////////////////moving left///////////
void goLeft(){
 
  if (keyPressed==true && key==CODED && keyCode==LEFT) {
    runningIndex++;
    if(runningIndex>2)runningIndex=1;
    image(man[runningIndex],posx,posy);
    posx=posx-speed;
        if(posx<5)posx=5;

}
}

/////////////////moving right////////////
void goRight(){
if (keyPressed==true && key==CODED && keyCode==RIGHT) {
    runningIndex++;
    if(runningIndex>2)runningIndex=1;
    image(man[runningIndex],posx,posy);
    posx=posx+speed;
        if(posx>580)posx=580;

}
}

/////////////////map//////////////////
void gameMap(){
  
  if(level==1){
    for(int lop=0;lop<width/10;lop++){
    image(mainSquare, mapx[lop], mapy[1]); 
    }
  
}
}


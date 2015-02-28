
//By Evan White
import processing.video.*;

int x[];
int y[];
float newX;
float newY;
float oldX;
float oldY;
int pos=3;
int x2[];
int y2[];
float newX2;
float newY2;
float oldX2;
float oldY2;
int pos2=3;
int ellmove2=0;
int ellmove= 0;
float smoothy=.1;


Movie myMovie;

void setup() {
  size(720, 300, P2D);
  smooth();

  // Load and play the video in a loop
  myMovie = new Movie(this, "swkmute.mov");
  myMovie.loop();
  noLoop();
  x= new int[pos];
  y=new int[pos];
  x2=new int[pos2];
  y2=new int[pos2];
}
void movieEvent(Movie myMovie) {
  myMovie.read();
  loop();
  shift();
}

void draw() {
  fill(0,15);
  rect(-1,-1,width+1,height+1);
  if (myMovie.available()) {
    //image(myMovie,0,0);
  }
  for(int i=0; i<pos;i++){
    strokeWeight(2.5);
    stroke(255,50);
    noFill();
    line(x[ellmove],y[ellmove],x[i],y[i]);
    strokeWeight(1);
    stroke(255);
    line(x[ellmove],y[ellmove],x[i],y[i]); 
  }
  for(int i=0; i<pos2;i++){
    strokeWeight(2.5);
    stroke(255,0,0);
    line(x2[ellmove2],y2[ellmove2],x2[i],y2[i]);
    strokeWeight(1);
    stroke(255,0,0,50);
    line(x2[ellmove2],y2[ellmove2],x2[i],y2[i]);
  }
  //maps by mouse
  // int movX= (int)map(mouseX,0,myMovie.width,0,myMovie.width);
  //int movY= (int)map(mouseY,0,myMovie.height,0,myMovie.height);
  //maps by (x,y)
  color c=myMovie.get(160,120);
  newX= map(brightness(c),0,255,0,width)*smoothy+(oldX*(1-smoothy));
  newY=map(saturation(c),0,255,0,height)*smoothy+(oldY*(1-smoothy));
  oldX=newX;
  oldY=newY;

  //int movX2= (int)map(myMovie.width-mouseX,0,myMovie.width,0,myMovie.width);
  //int movY2= (int)map(myMovie.height-mouseY,0,myMovie.height,0,myMovie.height);
  color b=myMovie.get(200,200);
  newX2=map(brightness(b),0,255,0,width)*smoothy+(oldX2*(1-smoothy));
  newY2=map(saturation(b),0,255,0,height)*smoothy+(oldY2*(1-smoothy));
  oldX2=newX2;
  oldY2=newY2;
}
void shift(){
  x[ellmove]=(int)newX;
  y[ellmove]=(int)newY;
  ellmove++;
  x2[ellmove2]=(int)newX2;
  y2[ellmove2]=(int)newY2;
  ellmove2++;

  if(ellmove>=pos){
    ellmove=0;
  }
  if(ellmove2>=pos2){
    ellmove2=0;
  }
}






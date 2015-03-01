
//By Richard
//random walk in the plane
//Frequently visited areas will show as red
//Press n to reset
 
//Change these to edit size of screen
int xbound = 500;
int ybound =500;
 
//Change to alter the rate at which visited cells turn red. 1=very slowly, 255=instantly
int changerate=18;
 
void setup() {
  size(xbound,ybound);
  background(0);
  randomSeed(hour()+minute()+second()+millis());
  frameRate(300);
 }
  
int xval=int(xbound/2);
int yval=int(ybound/2);
int [] [] MyArray = new int [xbound] [ybound];
  
void draw() {
  float xrand=random(1);
  float yrand=random(1);
  if (xrand>0.5 && xval<xbound && xval>=0) {
     xval++;
  }
  if (xrand<=0.5 && xval<=xbound && xval>0) {
    xval--;
  }
    if (yrand>0.5 && yval<ybound && yval>=0) {
     yval++;
  }
  if (yrand<=0.5 && yval<=ybound && yval>0) {
    yval--;
  }
  MyArray[xval][yval]=min(MyArray[xval][yval]+changerate,255+changerate);
  //print(MyArray[xval][yval]);
  stroke(MyArray[xval][yval]-changerate,255+changerate-MyArray[xval][yval],0);
  ellipse(xval, yval, 1, 1);
}
  
void keyPressed()
{
  if(key == 'n') {
    size(xbound,ybound);
    background(0);
    xval=int(xbound/2);
    yval=int(ybound/2);
    for (int x=0; x<=xbound;x++) {
      for (int y=0; y<=ybound;y++) {
        MyArray[x][y]=0;
      }
    }
  }
}

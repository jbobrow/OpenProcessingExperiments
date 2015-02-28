
float posX, posY;
float r = random(50);
float rcolor = random(255);
int i = 1;
Wring myring;
int[] rnums = {4, 10, 3, 2, 13};
class Wring {
  float wradius, wspeed, wposx, wposy;
  Wring(){
   //wposx = displayWidth/2;
   //wposy = displayHeight/2;
   wposx = random(displayWidth);
   wposy = random(displayHeight);
   wradius = random(50);
   wspeed = wradius/4; 
  }
  void display(int i){
    stroke(5*i);
    if(i<60){
      ellipse(wposx, wposy, wradius + wspeed*i, wradius + wspeed*i); 
    } else {
     background(255); 
    }
  }
}
void setup(){
  size(displayWidth, displayHeight);
  smooth();
  background(255);
  noFill();  
  myring = new Wring();
}
void draw(){
  /*stroke(0+6*i);
  if((i==0)&&(4*i < 255)){
    posX = random(width);
    posY = random(height);
    ellipse(posX, posY, r+5*i, r+5*i);
  }
  i++;*/
  myring.display(i);
  i++;
}

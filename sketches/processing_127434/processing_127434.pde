
int count = 0;
Cloud c;

void setup() {
  background(#004AFF,5);
  size(640, 640);
}


void draw(){
  fill(#004AFF,8);
  rect(0,0,width,height);
  if(frameCount%5 ==0){
  Cloud a = new Cloud(int(random(-100,700)), int(random(2,13))*50, int(random(30,50)),int(random(5,30)));
  a.display();
  }
}
class Cloud{
  private float[] startingPos = {0,0};
  private int count = 0;
  private float startingRad = 20;
  private float currentRad = startingRad;
  private float cloudLength;
  
 public Cloud(int x, int y, float cloudLength, float cloudSize){
    this.startingPos[0] = x;
    this.startingPos[1] = y;
    this.cloudLength = cloudLength;
    this.startingRad = cloudSize;
    this.currentRad = cloudSize;
  }
  public void display(){
    noStroke();
    while(count < this.cloudLength){
      fill(#FFFFFF);
      ellipse(this.startingPos[0],this.startingPos[1],this.currentRad,this.currentRad);
      this.startingPos[0] += random(10);
      float radVar = random(startingRad/2);
      if (this.count > this.cloudLength/2){
       radVar = -radVar;
      } 
    this.startingPos[1] -= radVar/2;
    this.currentRad += radVar;
    count++; 
   }
  }
}

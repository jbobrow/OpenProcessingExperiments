
final int MAX = 10;

float [] arrayOne = {20,400,236.7,300};
float [] arrayTwo;

void setup() {
 size(1000,100); 
 arrayTwo = new float[MAX];
 initArray(arrayTwo,0,width);
 textAlign(CENTER); 
 fill(200,0,200);
}

void draw() {
  background(255);
  drawPoints(arrayOne,height/4);
  drawPoints(arrayTwo,3*height/4);
  movePoints(arrayTwo);
}

void drawPoints(float [] temp, float yPos) {
   strokeWeight(1);
   line(0,yPos,width,yPos);
   strokeWeight(5);
   for(int i = 0; i < temp.length; i++) {
       point(temp[i],yPos);
       text(temp[i],temp[i],yPos);
   }
   
}

void movePoints(float [] temp) {
    for(int i = 0; i < temp.length; i++) {
        temp[i] ++;
        if (temp[i] > width) temp[i] = 0;
   }
}

void initArray(float [] temp, float minVal, float maxVal) {
  for(int i = 0; i < temp.length; i++) {
    temp[i] = random(minVal,maxVal);
  }
}


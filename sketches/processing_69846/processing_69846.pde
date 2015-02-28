
int num=180;
Thingy[] thingyArray=new Thingy[num];
float[] positionX=new float[num];
float[] positionY=new float[num];


void setup() {
  size(600,600);
  background(0);
  smooth();
  noStroke();
  for(int i=0 ; i<thingyArray.length ; i++) {
    thingyArray[i]= new Thingy(10,10,50,50,color(random(255),random(255),random(255),130));
    positionX[i] = random(width);
    positionY[i] = random(height);
  }
}

void draw() {
  background(0);
   for(int i=0 ; i<thingyArray.length ; i++){
      thingyArray[i].updateThingy(positionX[i],positionY[i]);
      thingyArray[i].drawThingy(positionX[i],positionY[i]);
   }
}
     
  
    


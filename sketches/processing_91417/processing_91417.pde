
float grey = 0.0;
int[] myX = {50,61,83,69,71,50,29,31,17,39};
int[] myY = {18,37,43,60,82,73,82,60,43,37};

int[] myX2 = new int[5];
int[] myY2 = new int[5];

void setup () {
  size(400,400);
  background(255);
  
  for (int i=0; i <5; i++) {
    myX2[i]=(int)random(100,200);
    myY2[i]=(int)random(150,300);
}
}

void draw(){
  for (int i = 0; i < 400; i++) {
    float percent = (float)i/400;
    stroke(255 * percent,0, 255 *percent);
    line(0,i,400,i);
  }
  
  for(int i = 0; i<400; i +=40){
     stroke(255);
    line(0,i,400,i);
    line(i,0,i,400);
  }
  
pushMatrix();
translate(200,100);
rotate(radians(100));
drawShapes(0,50);
popMatrix();

pushMatrix();
rotate(radians(45));
drawShapes(300,100);
popMatrix();

pushMatrix();
rotate(radians(10));
drawShapes(200,200);
popMatrix();

pushMatrix();
rotate(radians(25));
drawShapes(200,50);
popMatrix();

pushMatrix();
rotate(radians(55));
drawShapes(200,60);
popMatrix();
}

void drawShapes(float offset, float yoffset) {
    beginShape();
  for (int i=0; i < myX.length; i++) { 
    vertex(myX[i] + offset, myY[i] + yoffset); 
  }
  endShape();

}
  



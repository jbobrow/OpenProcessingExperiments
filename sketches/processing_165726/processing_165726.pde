
float[] x = new float[10];
float[] y = new float[10];
 
float[] graphNums = {
  17, 22, 3, 0, 26, 15, 12, 14, 11, 17
};

void setup() {
size(200,210);
}

void draw() {
  
for (int i = 0; i < graphNums.length-1; i++) {
    float width1 = i * 20;
    float height1 =  height - graphNums[i];
 
    float width2 =10;
    float height2 =  graphNums[i];
 
fill(random(255),random(255),random(255));
  rect(width1,height1,width2,height2);

}
}

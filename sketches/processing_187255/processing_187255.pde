
int[] graphNums;
 
void setup() {
  size(500,500);
  
}
 
void draw(){
 
  background(255);
  fill(255, 255, 0);
  
  String[] stringData = loadStrings("population.txt");
  graphNums = new int[stringData.length];


  for (int i = 0; i < graphNums.length-1; i++) {
    float x1 = i * 40;
    float y1 =  (graphNums[i] * 10);
  
    float x2 = (i+1) * 40;
    float y2 =  (graphNums[i+1] * 10);
  
    line(x1, y1, x2, y2);
    
    float x = map(i, 0, graphNums.length -1, 0, width);
    
  }
}

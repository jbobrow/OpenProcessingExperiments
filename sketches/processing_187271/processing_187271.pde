
int[] myStats;
String[] myCities;

float[] margins = { 370, 370, 370, 370 };

float scaleWidth(int i){
  return map (i,
              0, max(myStats),
              0, width - margins[1] - margins[3]);
}

float scaleHeight(int i){
  return map(i,
             0, max(myStats),
             0, height - margins[0] - margins[2]);
             
}

void setup(){
  size(400, 400);
  
  myCities = loadStrings("cities.txt");
  
  String[] statData = loadStrings("population.txt");
  myStats = new int[statData.length];
  
  for(int i = 0; i <= statData.length - 1; i+=1){
    myStats[i] = parseInt(statData[i]);
  }}
  
  
  
 void draw(){
   drawCircles();
 }

void drawCircles(){
  for(int i = 0; i<=myStats.length - 1; i+=1){
    
    float circleWidth = scaleWidth(myStats[i]);
    float circleHeight = scaleHeight(myStats[i]);
    float x = 200;
    float y = 200;
    
    ellipse(x, y, circleWidth, circleHeight);
  }
}


  
  
  






int[] popData;
String[] cities;

float barHeight;
int offset = 10;

void setup(){
  size(1000,600);  

  cities = loadStrings("cities.txt");

  String[] stringData = loadStrings("population.txt");
  popData = new int[stringData.length];

  for(int i = 0; i <= stringData.length - 1; i+=1) {
   popData[i] = parseInt(stringData[i]);
}

barHeight = ((height - 100) / popData.length) * 0.5;

}

void draw(){
  background(255, 255, 255);
    drawSkyline();
  labelYAxis();
  //draw Y axis (horizontal)
  float x1 = 100 - offset;
  float x2 = width - 100 + offset;
  float y1 = height - 100 + barHeight;
  float y2 = y1;
  stroke(233, 70,70);
  line(x1, y1, x2, y2);
  text("Population in Millions", width/2, y1 + 50);
  //draw X axis (vertical)
  float X1 = 100 - offset;
  float X2 = X1;
  float Y1 = X1;
  float Y2 = y1;
  stroke(233, 70,70);
  line(X1, Y1, X2, Y2);
}

void labelYAxis(){
  
  int offset = 10;
  int interval = 5000000;
  for(int value = 0; value < max(popData); value += interval){
    float x1 = 100 + scaleY(value);
    float y1 = height - 100;
    fill(0, 0, 0);
    textAlign(CENTER, BOTTOM);
    text(value/1000000, x1 - offset, y1 + barHeight*2);
  }
}
    
//draw skyline bars
void drawSkyline(){
  for(int i = 0; i <= popData.length -1; i += 1){
    //draw sky
    float barLength = scaleY(popData[i]);
    float barX = 100 - offset;
    float barY = scaleX(i);
    fill (204, 229,255);
    noStroke();
    rect(barX, barY, barLength, barHeight);
    float randomGrey = random (96, 192); 
    fill (randomGrey, randomGrey, randomGrey);
    for(int b = 0; b <= 50 -1; b += 1){
    float randomHeight = random (0, barHeight);
    float randomWidth  = random (1, 20);
    rect(random(barX, barX+barLength), randomHeight, randomWidth, barHeight-randomHeight);};
    fill(0, 0, 0);
    textAlign(RIGHT, TOP);
    text(cities[i], barX, barY + (i % 2)*10);
  }
}    
float scaleY(int n){
  return map(n,                                   // input
             0, max(popData),                   // input range
             0, width - 200);//output range
}

float scaleX(int n){
  return map(n,                                           // input
             0, popData.length - 1,                     // input range
             100, height - 100);  // output range
}



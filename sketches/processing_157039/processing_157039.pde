
int floor = 30;
int d12 = 60;
int[] angles = {  floor, 75, floor-15, 60, d12, 60, d12+15};
color[] c = {  #1C8B98, #EDAA4E, #1C8B98, #D1D2D5, #E14B3B, #FFFFFF, #E14B3B};

int labelWidth;
int rectWidth;

void setup() {
  size(600, 600);
  noStroke();
  noLoop();
  
  labelWidth = width/2+170;
  rectWidth = labelWidth - 10;
}

void draw() {
  background(100);
  pieChart(300, angles);
}

void pieChart(float diameter, int[] data) {

  text("Locate me in 24 hours", width/2-65, 100);
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    float Color = map(i, 0, data.length, 0, 255);

    fill (c[i]);
    arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);
   
   rectMode(CENTER);
//   for (int j = height-105; j <height - 45; j++){
   fill(#1C8B98);
   rect(rectWidth,height-125,10,10);    
   fill(#EDAA4E);
   rect(rectWidth,height-105,10,10); 
   fill(#D1D2D5);
   rect(rectWidth,height-85,10,10);  
   fill(#FFFFFF);
   rect(rectWidth,height-65,10,10);   
   fill(#E14B3B);
   rect(rectWidth,height-45,10,10);

   
   fill(255); 
   text("Floor",labelWidth,height-120);
   text("Suitcase",labelWidth,height-100);
   text("Room308", labelWidth, height-80);
   text("Room402", labelWidth, height-60);
   text("D12", labelWidth, height-40);
  }
}





//Julia Engel-Dagher
//Assignment 4 
//Introduction to Interactive Data Visualization - NYU School of Professional Studies
//Spring, 2015 DATA1-CE9010 #001

String [] cities;
int [] population;

void setup() {
  
   size(800, 300);
   smooth();
   
 cities = loadStrings("cities.txt");
 String[] stringData = loadStrings("population.txt");
 population = new int[stringData.length];
 
  for(int i = 0; i <= stringData.length - 1; i += 1){
    population[i] = parseInt(stringData[i]);
  }
   
}

void draw(){
  background (204,255,229);
  drawChart1();
  drawyaxis();
}

void drawyaxis(){
  int offset = 10;
  int interval = 5000000;
  for(int value = 0; value < max(population); value += interval){
    float x1 = 100 - offset;
    float x2 = width - 100 + offset;
    float y1 = height - 80 - scaleY(value);
    float y2 = y1;
    
    stroke(160, 160, 160);
    fill(160, 160,160);
    line(x1, y1, x2, y2);
    
    textAlign(RIGHT);
    text(value, x1 - offset, y1);
  }
}

float scaleY(int n){return map(n, 0, max(population), 0, height - 180);}

void drawChart1(){
  for (int i=0; i< population.length-1; i++){
  float w = 20;
  float h = map (population[i], 0, max(population), 0 ,height-180);
  float x = map (i, 0, population.length - 1, 50, width - w -100);
  float y = height - 80;
  fill (51, 153, 255);
  rect (x+40,y, w, -h);
  textAlign(CENTER, TOP);
  text(cities[i], x+50, y+10);
  text("Cities", 400, 255);
  pushMatrix();
  rotate(-HALF_PI);
  fill(160, 160,160);
  text("Population",-150,0);
  popMatrix();
  fill (64, 64, 64);
  text ("CITY POPULATIONS", 400, 50);
  }
}





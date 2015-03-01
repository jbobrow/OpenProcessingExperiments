
//Julia Engel-Dagher
//Assignment 4 
//Introduction to Interactive Data Visualization - NYU School of Professional Studies
//Spring, 2015 DATA1-CE9010 #001

String [] cities;
int [] population;

void setup() {
  
   size(500, 300);
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
}

void drawChart1(){
  for (int i=0; i< population.length-1; i++){
  float w = 20;
  float h = map (population[i], 0, max(population), 0 ,height-180);
  float x = map (i, 0, population.length - 1, 50, width - w -100);
  float y = height - 80;
  fill (51, 153, 255);
  rect (x,y, w, -h);
  }
}



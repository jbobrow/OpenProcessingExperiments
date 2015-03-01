
//Julia Engel-Dagher
//Assignment 4 
//Introduction to Interactive Data Visualization - NYU School of Professional Studies
//Spring, 2015 DATA1-CE9010 #001

String [] cities = {
"Tokyo",
"Jakarta",
"Seoul",
"Delhi",
"Shanghai",
"Manila",
"Karachi",
"New York",
"Sao Paulo",
"Mexico City"
};

int [] population = {
37239000,
26746000,
22868000,
22826000,
21766000,
21241000,
20877000,
20673000,
20568000,
20032000
};
int y = 10;
float w;
float h;

void setup() {
  
   size(500, 350);
   smooth();
   background (0, 0, 102);
   
 int y = 20;
  for (int i=0; i< population.length; i++){
  w = map (population[i],20032000,37239200,0,height - 50);
  fill (51, 153, 255);
  rect (10,y,w,20);
  
  fill(255,255,255);
  text(cities[i], w+15, y+15);
  y+=30; 
  }
  
}

void draw(){
}



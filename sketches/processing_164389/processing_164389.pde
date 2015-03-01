
int[] population = {37239000, 26746000, 22868000,
                    22826000, 21766000, 21241000,
                    20877000,20673000, 20568000,
                    20032000};

String[] name = {"Tokyo", "Jakarta", "Seoul",
                 "Delhi", "Shanghai", "Manila",
                 "Karachi", "New York", "Sao Paulo",
                 "Mexico City"};

float hMargin = 100;
float vMargin = 100;

void setup(){
  size(500, 500);
  colorMode(HSB);
  population = new int[width];
  for (int i = 0; i < population.length; i++) {
    population[i] = int(height);
}

}

void draw(){
    background(255);
  
  for (int i=0; i<population.length-1; i++){
    stroke(0);
    strokeWeight(2);
    line(i,population[i],i+1,population[i+1]);
  }
  
  for (int i = 0; i < population.length-1; i++) {
    population[i] = population[i+1]; 
  }
  population[population .length-1] = round(random(height));

}

  



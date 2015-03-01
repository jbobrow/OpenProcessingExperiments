
int[] population = {37239000, 26746000, 22868000,
                    22826000, 21766000, 21241000,
                    20877000,20673000, 20568000,
                    20032000};

String[] name = {"Tokyo", "Jakarta", "Seoul",
                 "Delhi", "Shanghai", "Manila",
                 "Karachi", "New York", "Sao Paulo",
                 "Mexico City"};

float hMargin = 120;
float vMargin = 100;

void setup(){
  size(500, 500);
  colorMode(HSB);
  
}

void draw(){
  
  background(0);
  for(int i = 0; i < population.length; i++){
    float x1, y1, x2, y2, lineWidth;
    x2 = map(population[i], 0, max(population), 0, width - hMargin);
    lineWidth = 6;
    y1 = map(i, 0, population.length -1, vMargin, height - vMargin - lineWidth);
    x1 = hMargin;
    y2 = y1;
        
   strokeWeight(lineWidth);
   float brightness = map(population[i],
                           0, max(population),
                           0, 255);
    stroke(98, 88, brightness);
    line(x1, y1, x2, y2);

    fill(255);
    text(name[i], 0, y1, hMargin, y2);
  }
}




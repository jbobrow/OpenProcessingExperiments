
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
}

void draw(){
  background(0);

  drawScale();  
  drawLollipops();
}

void drawScale(){
  for(int i = 0; i < max(population); i += 5000000){
    float x1, y1, x2, y2;
    x1 = hMargin;
    x2 = width - hMargin;
    y1 = map(i,
             0, max(population),
             height - vMargin, vMargin);
                         
    y2 = y1;
    stroke(200);
    line(x1, y1, x2, y2);
    textAlign(RIGHT);
    fill(255);
    text(i, x1 - 10, y1);
  }  
}

void drawLollipops(){
  // Drawing the lollipop stems
  for(int i = 0; i < population.length; i++){
    float stemX, stemY, stemWidth, stemHeight, lolliTop;
    lolliTop = 20;
    stemWidth = 4;
    stemHeight = map(population[i],
                    0, max(population),
                    0, height - 2 * vMargin);
    stemX = map(i,
               0, population.length - 1,
               0 + hMargin, width - lolliTop - hMargin);
    stemY = height - vMargin;
    noStroke();
    float brightness = map(population[i],
                           0, max(population),
                           0, 255);
    fill(100, 225, brightness);
    rect(stemX, stemY, stemWidth, -stemHeight);
//drawing the tops of the lollipops
      ellipseMode(CENTER);
      ellipse(stemX + stemWidth/2, height - stemHeight - vMargin, lolliTop, lolliTop);
//labeling the X axis    
    pushMatrix();
      translate(stemX + stemWidth/2, height - vMargin + lolliTop);
      rotate(radians(-45));
      textAlign(RIGHT);
      fill(255);
      text(name[i], 0, 0);
    popMatrix();   
   

  }
}




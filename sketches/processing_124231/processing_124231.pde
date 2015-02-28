
int quantity = 300;
float [] xPosition = new float[quantity];
float [] yPosition = new float[quantity];
int [] flakeSize = new int[quantity];
int [] direction = new int[quantity];
int minFlakeSize = 1;
int maxFlakeSize = 5;

void setup() {

  size(1370, 710);
  frameRate(30);
  noStroke();
  smooth();
  
  for(int i = 0; i < quantity; i++) {
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));
    xPosition[i] = random(0, width);
    yPosition[i] = random(0, height);
    direction[i] = round(random(0, 1));
  }
  
}

void draw() {

  background(0);
 
  fill(random(255),random(255),random(255));
  ellipse(pmouseX,pmouseY, 50,50);


      fill(random(255),random(255),random(255));
      textSize(36);
      text("Let  It",220,640);
      textAlign(LEFT);
      text("Snow",240,640);
      textAlign(RIGHT);
      

  for(int i = 0; i < xPosition.length; i++) {
   
    ellipse(xPosition[i], yPosition[i], flakeSize[i], flakeSize[i]);
       fill(255);
    if(direction[i] == 0) {
      xPosition[i] += map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    } else {
      xPosition[i] -= map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    }
    
    yPosition[i] += flakeSize[i] + direction[i]; 
    
    if(xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i] || yPosition[i] > height + flakeSize[i]) {
      xPosition[i] = random(0, width);
      yPosition[i] = -flakeSize[i];


 
    }
    
  }
}

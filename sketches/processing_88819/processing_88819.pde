
int lines = 50;
int frameR = 10;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  stroke(0, 0, 0, 90);
  fill(255);
  frameRate(frameR);
 
}

void draw() {  //draw function loops 

    for(int i = 0; i<lines; i++){
        curve(random(width), random(height), random(width), random(height), random(width), random(height), random(width), random(height));
    }
}

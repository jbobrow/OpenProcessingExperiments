
color[] brewtopia = {#BF9F63, #F2E6CE, #261F1D, #A61C1C, #FFFFFF};

void setup(){
 size(600, 500);
 smooth();
 noFill();
 strokeWeight(5); 
 frameRate(1.5);
 background(188, 194, 198);
}

void draw(){
 float x = random(width);
 float y = random(height);
 float d = random(30, 300);
 stroke(brewtopia[int(random(1, 5))]);
 ellipse(x, y, d, d); 
}


float[] xCoord = new float[100];
float[] yCoord = new float[100];

void setup(){
size(400,400);
for(int i = 0; i < 100; i++){
xCoord[i] = random(width);
yCoord[i] = random(height);
}
}

void draw(){
background(0);
stroke(255);
for(int i = 0; i < 100; i++){
point(xCoord[i], yCoord[i]);
yCoord[i]++;
}
}

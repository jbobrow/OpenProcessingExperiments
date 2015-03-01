
float[] xCoord = new float[100];
float[] yCoord = new float[100];

void setup(){
size(550,550);
for(int i = 0; i < 100; i++){
xCoord[i] = random(width);
yCoord[i] = random(height);


}
}
 
void draw(){
background(255);
stroke(random(255),random(255),random(255));
for(int i = 0; i < 100; i++){
  strokeWeight(random(25));
point(xCoord[i], yCoord[i]);
yCoord[i] += 3;
if(yCoord[i] > height){
  yCoord[i] = 0;
}

}
}

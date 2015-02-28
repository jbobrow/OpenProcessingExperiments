
void setup(){
 size(1680,1050); 
 background(0);
 noCursor();
}

float sizeS = 50;
float growth = 0;

void draw(){
 noStroke();
 for(int i = 0; i < width; i += sizeS){
   for(int ii = 0; ii < height; ii += sizeS){
     fill(dist(i, ii, mouseX, mouseY) - sizeS * 2 - growth, dist(ii, i, mouseY, mouseX) - sizeS * 2 - growth, dist(i, ii, mouseX, mouseY) - sizeS * 2 - growth, 5);
     rect(i, ii, sizeS, sizeS); 
   }
 } 
 sizeS = sin(random(PI/2, PI)) * 100 + 10;
 println(sizeS);
 if(mouseX == pmouseX && mouseY == pmouseY){
  growth += .25;
 }
 else{
  growth = 0; 
 }
}



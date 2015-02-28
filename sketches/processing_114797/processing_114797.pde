
int index;
void setup() {
 
  size(800, 400);
  background(255);
  smooth();
  frameRate(20);
}
 
void draw() {
  background(255);
if (index ==0){
    patternCircle(20);
}
  if (index ==1){
  patternCircle(50);
  }
   if (index ==2){
  rectLine();
  }
}

void mousePressed(){
  index = index +1;
  if(index >2){
    index =0;
  }
}
void patternCircle(int s){
    for (int i =25; i < width - 20; i +=s/2){
     for (int j =25; j < height-20; j +=s/2){
    noFill();
    stroke(random(255),random(255),random(255));
    ellipse(i,j, s,s);
  }
  }
}

void rectLine(){

  for (int i=0;i<width;i=i+100) {
    for (int j =0; j < height; j = j +100){
        noStroke();
    fill(random(0,255),random(0,255),random(0,255));
    rect(i,j,100,100);
    stroke(0);
     line (i, j , i +100, j+100);
     line (i+100, j, i , j+100);
    }
  }
}

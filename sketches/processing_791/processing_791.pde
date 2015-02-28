
 
void setup() {
  size(600, 400);
  background(0,0,0);
  frameRate(5000);
  smooth();
}
int[] upp = new int[600*400+1];

void draw() {
loadPixels();
for (int i = 0; i < width*height; i++) {
  noStroke();
  if(int(random(3))!=0 && i==int(random(width*height))){
     if(mouseX<width && mouseX>0){ upp[i] = 1;}
  }
  if(upp[i] != 1){
    upp[i] = 0;
  }
    if((i>0) && upp[i]==1 && i%width!=0){
      fill(color(random(255),random(255),random(255)),random(255));
      if(mouseX<width && mouseX>0){
       if(mousePressed==true){
         quad(i%width,ceil(i/width-1),mouseX,mouseY,random(width),random(height),random(width),random(height));
       }
      else{
        ellipse(i%width,ceil(i/width-1),sqrt(abs(width/2-(mouseX+mouseY)/2)*10)+1,sqrt(abs(width/2-(mouseX+mouseY)/2)*10)+1);
      }
      upp[i] = 0;
      }
      
    }
}
}





void setup(){
  size(displayWidth,displayHeight);
  
  noStroke();
  
}

void draw(){
  background(255);
  frameRate(4);
 for(int j =0; j<height; j=j+100){
  for(int i=0;i<width;i=i+100){
    fill(random(0,255),random(0,255),random(0,255));
    rect(i,j,20,20);
  }
 }
 stroke(255);
 for(int j=0; j<height; j=j+100){
   for(int i=0; i<width;i=i+100){
     text("iamsb",i,j);
   }
 }
 if(mousePressed){
   save("myProject.jpg");
 }
}
 
void mousePressed() {
   background(255);
   frameRate(1);
   fill(random(0,255),random(0,255),random(0,255));
   ellipse(displayWidth/2,displayHeight/2,200,200);
   text("yesyouare",680,300);
   }
   


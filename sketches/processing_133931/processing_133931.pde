
color c;
 
void setup(){
  size(600,600);
  colorMode(HSB,360,100,100);
  background(#F05000);
  smooth();
  //noLoop();
}
 
void draw(){
   background(map(mouseX,0,width,0,360),100,100);
  for(int i = 0;i<width;i+=10){
    for(int j = 0;j<height;j+=10){
     float d = dist(i,j,mouseX,mouseY);
     noStroke();
     fill(#F05000);
      
     ellipse(i,j,d/3,d/3);
    }
  }
 
}


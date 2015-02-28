
void setup() {
  size(600, 600);
  smooth();
  
  grid();

    colorMode(RGB, 100);
    for (int i = 0; i < width; i=i+1) {
      for (int j = 0; j < height; j=j+1) {
      stroke(j, i, 6000,50);
      point(i, j);
       }
     }
  

  colorMode(RGB, 500);
    for (int i = 0; i < width; i=i+1) {
      for (int j = 0; j < height; j=j+40) {
      stroke(j, i, random(1000),300);
      point(i, j);
       }
     }
     
   
  colorMode(RGB, 500);
    for (int i = 0; i < height; i=i+40) {
      for (int j = 0; j < width; j=j+1) {
      stroke(j, i, random(1000),300);
      point(i, j);
       }
     }
     
     
     PFont[] font = new PFont[1];
     
     font[0] = loadFont("Impact-48.vlw");
     
     textFont(font[0],100);
     textAlign(CENTER);
     fill(255);
     text("GROUP 7",width/2,height/2);
   }
 
void grid() {
   noStroke();
   
   for (int x=0;x<width;x+=40){
     for (int y=0;y<height;y+=40){
       fill(random(55)+200);
       rect(x,y,40,40);
       randomTriangle(x,y);
     }
  }
}
void randomTriangle(int x, int y){
  if(random(1001) > 750){
  fill(random(100)+50,200,200);
  triangle(x,y,x+40,y,x+40,y+40);
  triangle(x,y,x-40,y,x-40,y-40);
  fill(255);
  ellipse(x,y,20,20);
  fill(0);
  text("GR7",x-7,y+4);
  } 
}



 



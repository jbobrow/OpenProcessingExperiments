
int shapes = 100;// how many shapes
float[]speedX = new float[shapes];//arrays are created with the wor dnew
float[]speedY = new float[shapes];//shape is the variable for array
float[]x = new float[shapes];//short cut for multiple arrays and their lengths heights where they go on the x and 
//ys the essentiate the shapes. painting effect
float[]y = new float[shapes];
float[]w = new float[shapes];
float[]h = new float[shapes];
color[]colors = new color[shapes];
 
 void setup(){
   background(0);
   size(800,800);
   frameRate(25);
   smooth();
   
   for(int a=0; a<shapes; a++){//loop over shapes goes up by 1.
     x[a]=random(width);//random size//[position 0]
     y[a]=random(height);
     w[a]=random(width/7);
     h[a]=random(height/10);//size effects
     colors[a]= color(random(200),random(150),200,random(80,70));//color
     speedX[a]=random(-4,9);//speed angle horizontal
     speedY[a]=random(-4,15);
   }
 }
 void draw(){
   for (int a=0; a<shapes; a++){//loops match
   fill(colors[a]);
   stroke(random(200), random(200), random(200), random(40,80)); 
    rect(x[a], y[a], w[a], h[a]);//
    x[a]+=cos(speedX[a]);//speed up slow down
    y[a]+=sin(speedY[a]);
  }
  if (millis() >= 45000) {
  noLoop();
}
 }
void keyPressed(){
  saveFrame("picture4.tif");

}
 

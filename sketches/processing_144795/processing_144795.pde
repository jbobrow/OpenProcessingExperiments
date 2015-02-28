
float x = 0;
int L = 1;
int U = 1;
int R = 1;
int a = 0;
int b = 0;
int c = 0;
int score = 0;
int scoreTime = 0;
 
PImage[] img = new PImage[20];
 
void setup(){
 size(670, 565);
 smooth();
 background(#00C90B);
 frameRate(2);
 img [0] = loadImage("hills1.jpg");
 img [1] = loadImage("field1.jpg");
 img [2] = loadImage("desert1.jpg");
 img [3] = loadImage("roadandmountains1.jpg");
 img [4] = loadImage("winter1.jpg");
 img [5] = loadImage("hills2.jpg");
 img [6] = loadImage("field2.jpg");
 img [7] = loadImage("desert2.jpg");
 img [8] = loadImage("roadandmountains2.jpg");
 img [9] = loadImage("winter2.jpg");
 img [10] = loadImage("hills3.jpg");
 img [11] = loadImage("field3.jpg");
 img [12] = loadImage("desert3.jpg");
 img [13] = loadImage("roadandmountains3.jpg");
 img [14] = loadImage("winter3.jpg");
 img [15] = loadImage("fields.jpg");
 img [16] = loadImage("desert.jpg");
 img [17] = loadImage("winter.jpg");
 img [18] = loadImage("roadandmountains.jpg");
 img [19] = loadImage("hills.jpg");
}
 
void draw(){
  
  if (L != -1) {
       a = floor(random(5));
  }
  if (U != -1) {
       b = floor(random(5, 10));
  }
  if (R != -1) {
       c = floor(random(10, 15));
  }
 
  image(img[a], 28, 125, 213, 428);
  image(img[b], 229, 125, 213, 428);
  image(img[c], 430, 125, 213, 428);
//  for (x = 28; x <= 500; x+=213){
//    strokeWeight(2);
//    rect(x, 125, 213, 428);
//  }
   
  
  //images on top
  image(img [15], 38, 29.146, 94.167, 62.778);
  image(img [16], 162, 29.146, 94.167, 62.778);
  image(img [17], 286, 29.146, 94.167, 62.778);
  image(img [18], 410, 29.146, 94.167, 62.778);
  image(img [19], 534.182, 29.146, 94.167, 62.778);
    for(x = 38; x < 600; x += 124.259){
      fill(255, 0);
      strokeWeight(5);
    rect(x, 29.146, 94.167, 62.778);       
     
     
    if (L == -1 && U == -1 && R == -1) {
          if((a == 0 && b == 5 && c == 10) || (a == 1 && b == 6 && c == 11) || (a == 2 && b == 7 && c == 12) || (a == 3 && b == 8 && c == 13) || (a == 4 && b == 9 && c == 14)) {
          score = score + 10;
            if (scoreTime == 0) {
              score = score + 10;
 
            scoreTime = 1;
          }
          }
             textSize(20);
          fill(0);
          text(score, height/2, width/2);
    }
     
 
}
}
void keyPressed() {
   if (key == CODED){
     if (keyCode == LEFT){
        L *= -1;
     }
     if (keyCode == UP){
        U *= -1;
     }
     if (keyCode == RIGHT){
        R *= -1;
     }
     if (keyCode == DOWN){
        L = 1;
        U = 1;
        R = 1;
        scoreTime = 0;
     }
   }
 
   }




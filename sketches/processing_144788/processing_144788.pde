
float x = 0;
float a = 0;
float b = 0;

PImage[] img = new PImage[5];


void setup(){
 size(650, 565);
 smooth();
 background(#00C90B);
 img [0] = loadImage("roadandmountains.jpg");
 img [1]= loadImage("hills.jpg");
 img [2]= loadImage("winter.jpg");
 img [3]= loadImage("fields.jpg");
 img [4]= loadImage("desert.jpg");
}

void draw(){ 
  int p = int(random(5));
  image(img[p], 28, 125, 592, 394);
  for(x = 28; x < 630; x += 201){
    stroke(0);
    strokeWeight(11);
    rect(x, 125, 191, 395.654);
  }
  image(img [0], 29.146, 29.146, 94.167, 62.778);
  image(img [1], 153.405, 29.146, 94.167, 62.778);
  image(img [2], 277.664, 29.146, 94.167, 62.778);
  image(img [3], 401.923, 29.146, 94.167, 62.778);
  image(img [4], 526.182, 29.146, 94.167, 62.778);
    for(x = 29.146; x < width; x += 124.259){
   fill(255, 0);
   strokeWeight(5);
    rect(x, 29.146, 94.167, 62.778);
    }
 }
 
 void keyPressed(){
   if (key == CODED){
     if (keyCode == LEFT){

     }
     if (keyCode == UP){
       
     }
     if (keyCode == RIGHT){
       
     }
     if (keyCode == DOWN){
       
     }
 }
 }



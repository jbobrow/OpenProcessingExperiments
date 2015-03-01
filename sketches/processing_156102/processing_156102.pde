
PImage bb1;
PImage bb2;
PImage bb3;
PImage bb4;
PImage bb5;
PImage bb6;
PImage bb7;
PImage bb8;
PImage bb9;
PImage bb10;
PImage bb11;
PImage fence;
int count;
int imageNumber;

void setup(){
 size (900, 400);
 background (104, 103, 100);
  //font = loadFont("STLibian-SC-Regular-48.vlw");
  fill(255);
  //textFont (font, 54);
  textAlign(CENTER);
bb1 = loadImage("brooklyn_bridge1.jpg");
bb2 = loadImage("brooklyn_bridge2.jpg");
bb3 = loadImage("brooklyn_bridge3.jpg");
bb4 = loadImage("brooklyn_bridge4.jpg");
bb5 = loadImage("brooklyn_bridge5.jpg");
bb6 = loadImage("brooklyn_bridge6.jpg");
bb7 = loadImage("brooklyn_bridge7.jpg");
bb8 = loadImage("brooklyn_bridge8.jpg");
bb9 = loadImage("brooklyn_bridge9.jpg");
bb10 = loadImage("brooklyn_bridge10.jpg");
bb11 = loadImage("brooklyn_bridge11.jpg");
fence =loadImage("wire_fence.png");
}
void draw(){
 if (count == 0) {
   switch(imageNumber) {
     case 0:
     image(bb1, width/1, height/1);
     break;
     case 1:
      image(bb2, width/3, height/3);
      break;
    case 2:
      image(bb3, width/5, height/5);
      break;
    case 3:
      image(bb4, width/2, height/2);
      break;
    case 4:
      image(bb5, width/7, height/7);
    case 5:
      image(bb6, width/7, height/7);
    case 6:
      image(bb7, width/7, height/7);
    case 7:
      image(bb8, width/7, height/7);
       case 8:
      image(bb9, width/7, height/7);
       case 9:
      image(bb10, width/2, height/2);
       case 10:
      image(bb11, width/10, height/10);
      
      text("//////", width/2, 9 * height/10);
      break;
   }
   imageNumber = (imageNumber + 1)%5;
 }
 count = (count + 1)%40;
 
 image (fence, mouseX, mouseY);
}
     
  
  //if(mousePressed){
  //image(bb1,mouseX,mouseY);
  //} else {
    //image(bb2,mouseX,mouseY);}}



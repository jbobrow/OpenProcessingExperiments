
PImage maii;
PImage mai2;
PImage mai3;
PImage mai4;
PImage mai5;
PImage mai6;
PImage mai7;
PImage mai8;
PImage mai9;


int x;
int imageCount;

void setup(){
  size(800,533);
  stroke(0,0,0,0);
 
  maii= loadImage("maii.jpg");
  mai2= loadImage("mai2.jpg");
  mai3= loadImage("mai3.jpg");
  mai4= loadImage("mai4.jpg");
  mai5= loadImage("mai5.jpg");
  mai6= loadImage("mai6.jpg");
  mai7= loadImage("mai7.jpg");
  mai8= loadImage("mai8.jpg");
  mai9= loadImage("mai9.jpg");
  
  
  image(maii,0,0);
}

void draw(){
   if (mousePressed && (mouseButton == LEFT)){
         fill(234,221,12);
   }
}

void keyPressed(){
     imageCount++;
     if (imageCount % 10 == 0){
        image(maii,0,0);
     }
     if (imageCount % 10 == 1){
        image(mai2,0,0);
     }
     if (imageCount % 10 == 2){
        image(mai3,0,0);
     }  
     if (imageCount % 10 == 3){
        image(mai4,0,0);
     }
       if (imageCount % 10 == 4){
        image(mai5,0,0);
     }  
     if (imageCount % 10 == 5){
        image(mai6,0,0);
     }
       if (imageCount % 10 == 6){
        image(mai7,0,0);
     }  
     if (imageCount % 10 == 7){
        image(mai8,0,0);
     }
       if (imageCount % 10 == 8){
        image(mai9,0,0);
     }
  
    
}


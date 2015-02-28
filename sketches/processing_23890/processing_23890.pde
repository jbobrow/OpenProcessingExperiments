
PImage mai;
PImage mai2;
PImage mai3;



int x;
int imageCount;

void setup(){
  size(800,533);
  stroke(0,0,0,0);
 
  mai= loadImage("Mai1.jpg");
  mai2= loadImage("mai2.jpg");
  mai3= loadImage("mai3.jpg");
  
  
  image(mai,0,0);
}

void draw(){
   if (mousePressed && (mouseButton == LEFT)){
         fill(234,221,12);
   }
}

void keyPressed(){
  
  
     imageCount++;
     if (imageCount % 10 == 0){
        image(mai,0,0);
        
     }
     if (imageCount % 10 == 1){
        image(mai2,0,0);
     }
     if (imageCount % 10 == 2){
        image(mai3,0,0);
     }  
        if (imageCount % 10 == 3){
        image(mai,0,0);

        }
}



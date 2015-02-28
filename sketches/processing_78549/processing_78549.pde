
PImage sandwich;
PImage artichoke;
PImage icecream;
PImage oranges;
PImage avocado;
PImage blackberries;
PImage strawberries;




color c1;
color c2;

void setup(){
  size(1000,750);
  background(0,0,0);
  sandwich = loadImage("rainbow_sandwich.png");
  artichoke = loadImage("artichoke.png");
  icecream = loadImage("green-tea-ice-cream.png");
  oranges = loadImage("oranges.png");
  avocado = loadImage("avocado.png");
  blackberries = loadImage("blackberries.png");
  strawberries = loadImage("strawberries.png");
  


  
  imageMode(CENTER);
  
  
//Gradient learned from http://funprogramming.org/82-Program-a-gradient-of-colors.html 
  colorMode (HSB, 100);
  
   c1 = color(random(100), 100, 100);
   c2 = color(random(100), 100, 30);
   
   for(int y = 0; y < height; y++) {
       float n = map(y,0, height, 0, 1);
       color newc = lerpColor(c1, c2, n);
       stroke(newc);
       line(0, y, width, y);
   }
////////// to make new random rainbow gradient every time it is played
}

void draw (){

  
  
///////////////////// sandwich /////////////////////////////   

          text("PM11", 180,50);
          for(int i = 0; i < 20; i++){
             pushMatrix();
              translate(i*300,50);
                 imageFlip(sandwich,100,0,"h");
                 image(sandwich,0,0);
             popMatrix();
          }
          
          
          
///////////////////// strawberries /////////////////////////////          
         
          text("P1M1", 180,125);
                 for (int i = 0; i < 20; i++) {
       pushMatrix();
            translate(i*50,155);
            rotate (radians(180));
              if(i % 2 == 1){
         rotate(radians(180));
         imageFlip(strawberries,0,0,"v2");
       }else{
     //    image(strawberries,0,0);
       }
          //image(snail,0,0);
//          imageFlip(strawberries,0,0,"v");
       popMatrix();
       }
          
///////////////////// artichoke /////////////////////////////   
          
          text("P112", 170,300);
               pushMatrix();
                  for(int i = 0;i < 20;i++){
                     if (i%2==0){
                     translate (i+33,20);
                     imageFlip (artichoke,-100,250,"h");
                    } else {
                    translate (i+133,-20);
                    imageFlip (artichoke,-100,250,"v");
                    }
                  }
              popMatrix();
    
    
        
///////////////////// avocado /////////////////////////////          

              text("P111", 140,400);
          for(int i = 0; i < 20; i++){
             pushMatrix();
              translate(i*100,500);
                 image(avocado,i,-127);
             popMatrix();
          }
         
    
///////////////////// icecream /////////////////////////////          

              text("P1G1", 138,495);
          for(int i = 0; i < 8; i++){
             pushMatrix();
             translate(i*200,500);
                 imageFlip(icecream,100,0,"v");
                 image(icecream,0,0);
             popMatrix();
          }
          

///////////////////// oranges /////////////////////////////          

              text("PMM2", 140,600);
          for (int i = 0; i < 12; i++) {
              pushMatrix();
              translate(i*100,615);
              if(i % 8 == 0){
                image(oranges,0,100);
                  translate(0,25);
              //   rotate (radians(180));
               imageFlip(oranges,0,0,"h2");
                translate(0,65);
              } else {
                imageFlip(oranges,0,0,"v2");
                  translate(i*100,15);
                  rotate (radians(180));
              //  imageFlip(oranges,0,0,"v");
               }
            popMatrix();
  }

///////////////////// blackberries /////////////////////////////          
         
          text("PMG2", 160,740);
                 for (int i = 0; i < 12; i++) {
       pushMatrix();
            translate(i*150,700);
            rotate (radians(180));
              if(i % 2 == 1){
         rotate(radians(180));
         imageFlip(blackberries,0,0,"v");
       }else{
         image(blackberries,0,0);
       }
          imageFlip(blackberries,0,0,"v");
       popMatrix();
       }
       
       

          
}   









          
  
  
//  for(int i = 0; i < 100; i++){
//     pushMatrix();
//      translate(i*200+200,400);
//      rotate(radians(180));
//      image(myImg,0,0);
//     popMatrix();
//  }




//  imageFlip(myImg,100,500,"v");
//   for(int i = 0; i < 360; i++){
//      image(myImg,12,12);
// }
 


//imageFlip function by nick lally
//paste function at the bottom of your sketch, and use like this: imageFlip(imageName,x,y,"mode")
//modes are "v", "v2", "h", "h2"
//"v" mirrors vertically, "v2" mirrors top half vertically
//"h" mirrors horizontally, "h2" mirrors left half horizontally
void imageFlip(PImage imageName, int xPos, int yPos, String mode){

 //records original pixel config so it can set it back at the end
 imageName.loadPixels();
 int ogImage[] = new int[imageName.width*imageName.height];
 for(int i = 0; i < imageName.width*imageName.height; i++){
   ogImage[i] = imageName.pixels[i];
 }
 imageName.updatePixels();

 //"v2" flips the top half of the image across the x-axis
 if(mode == "v2"){
   imageName.loadPixels();
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = imageName.pixels[i*(imageName.width) + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);

 //"v" flips the entire image across the x-axis
 }else if(mode == "v"){
   imageName.loadPixels();
   int tempImage[] = new int[imageName.width*imageName.height];
   for(int i = 0; i < imageName.width*imageName.height; i++){
    tempImage[i] = imageName.pixels[i];
   }

   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = tempImage[i*(imageName.width) + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);

 //"h2" flips the left half of the image across the y-axis
 }else if(mode == "h2"){
   imageName.loadPixels();
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[i*imageName.width + j] = imageName.pixels[(i+1)*(imageName.width) - j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);

 //"h" flips the entire image across the y-axis
 }else if(mode == "h"){
   imageName.loadPixels();
   int tempImage[] = new int[imageName.width*imageName.height];
   for(int i = 0; i < imageName.width*imageName.height; i++){
    tempImage[i] = imageName.pixels[i];
   }
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(i+1)*(imageName.width) - j] = tempImage[i*imageName.width + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);
 } else {
   println("No mirror direction specified!");
   println("Use v, v2, h, or h2 for the 4th argument");
 }

 //resets image to original
 imageName.loadPixels();
 for(int i = 0; i < imageName.width*imageName.height; i++){
   imageName.pixels[i] = ogImage[i];
 }
 imageName.updatePixels();
}


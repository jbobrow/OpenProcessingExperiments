
//Dana Silberberg Sahar
//Home Assignment #5
// Oct_15th_2012 

 
 //defining my images: 
  PImage skel1;
  PImage skel2;
  PImage skelO1;
  PImage skelO2;
  
//Setup loop:
void setup (){
  size(1800,900);
  skel1= loadImage("Skeleton.png");
  skel2= loadImage("Skeleton2.png"); 
  skelO1= loadImage("SkeletOrng.png");
  skelO2= loadImage("SkeletOrng2.png");
imageMode (CENTER);
colorMode (HSB,0,0,100,100);
//background (30,96,96,100);
} 
void draw(){
      fill (0,0,0);
      rect (0,0,750,300);
      rect (1150,300,750,300);
      rect (0,600,750,300);
     stroke (0,0,0);
     rect (950,0,200,900);   
   
     fill (30,96,96,100);
     rect (0,300,750,300);
     rect (1150,0,750,300);
     rect (1150,600,750,300);
     stroke (30,96,96,100);
     rect (750,0,200,900);
    
     
 //repeated:
 //P111
fill (30,96,96,100);
textSize (30);
text ("P111",90,30);
 pushMatrix();
    for(int i=0;i<6;i++){
    translate (i+135,0);
    image(skelO1,-165,160);
    }
  popMatrix();

    //P112
fill (0,0,0,100);
textSize (30);
text ("P112",90,330);
 pushMatrix();
    for(int i=0;i<5;i++){
       if (i%2==0){
       translate (i+150,0);
       imageFlip (skel2,-100,450,"v");
      } else {
      translate (i+150,0);
      imageFlip (skel2,-100,450,"h");
      }
    }
popMatrix();

    //PM11
fill (30,96,96,100);
textSize (30);
text ("PM11",90,630);
 pushMatrix();
    for(int i=0;i<5;i++){
     if (i%2==0){
     translate (i+150,0);
     imageFlip (skelO1,-100,760,"h2");
    } else {
    translate (i+150,0);
     imageFlip (skelO1,-100,760,"h2");
    }
    }
popMatrix();

 //P1M1
fill (0,0,0,100);
textSize (30);
text ("P1M1",1255,30);
 pushMatrix();
    for(int i=0;i<6;i++){
            translate (i+136,0);
          //  if (i%2==0){
            imageFlip (skel1,1100,150,"v2");
          //  }else{
           //translate (i+136,0);
          // image(skel1,1100,150);
  //  }
   }
  popMatrix();
 
  //PMM2
fill (30,96,96,100);
textSize (30);
text ("PMM2",1255,330);
 pushMatrix();
    for(int i=0;i<6;i++){
            translate (i+136,0);
         //   if (i%2==0){
            imageFlip (skelO2,1100,450,"v2");
           //}else{
           imageFlip(skelO2,1100,450,"h2");
 //   }
   }
  popMatrix();

 //P1G1
fill (0,0,0,100);
textSize (30);
text ("P1G1",1255,630);
 pushMatrix();
    for(int i=0;i<6;i++){
            translate (i+136,0);
            if (i%2==0){
            imageFlip (skel1,1100,750,"v");
           }else{
    //     println("rectan");
   //      translate (i+136,0);
            image(skel1,1100,750);
  //       fill (70,0,0,100);
  //       rect (1200,900,150,150);
          }
   }
  popMatrix();
          
  //PMG2
fill (0,0,0,100);
textSize (30);
text ("PM",907,30);
fill (30,96,96,100);
textSize (30);
text ("G2",953,30);
       pushMatrix();
       for(int i=0;i<9;i++){
            translate (0,i+100);
                if (i%2==0){
                //imageFlip(skelO2,1020,-50,"h");
                imageFlip(skelO2,1020,-50,"v");
                //imageFlip(skelO2,1020,-70,"h2");
                
                }else{
                image(skel2,870,-50);

            //     imageFlip (skel2,870,-70,"h2");

   //      translate (i+136,0);
            //image(skel1,1100,750);
  //       fill (70,0,0,100);
  //       rect (1200,900,150,150);
           }
  }
 popMatrix();
          
          
          
          
           
//if (i%2==0){
 // imageFlip (skel2,150,450,"v");
 // }
 // image(skel2,100,450);
 //image(skel1,1250,750); 
 // image(skelO2,1250,450);
//  image(skelO1,100,750);
//  image(skelO2,850,150);  
  //image(skel2,1050,150);



    }







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




// Homework 4 Denali Schmidt
//James Brown all over the place

PImage jamesBrown;
int mode = 0;

void setup() {
  size(600, 780);
  smooth();
  jamesBrown = loadImage("images.jpeg");
  
  switch(mode){
  }
  
  //pma2
 for (int a = 50; a < 600; a += 80) {   
      image(jamesBrown, a, 0);
        imageFlip(jamesBrown, a, 900, "v");
        fill(0);
        textSize(14);
        textAlign(LEFT); 
        text ("pma2", 0, 50);
      }
        //p112
   for (int a = 50; a < 600; a += 80) {
   //  pushMatrix ();
   //  rotate(radians(180));
    image(jamesBrown, a, 130);
        fill(0);
        textSize(14);
        textAlign(LEFT); 
        text ("p1a1", 0, 80);
        text ("p1m1", 0, 130);
        text ("p112", 0, 200);
        imageFlip(jamesBrown,a,900,"v");
    //    popMatrix();
   }
      //p111
  for (int a = 50; a < 600; a += 80) {
    image(jamesBrown, a, 260);
        fill(0);
        textSize(14);
        textAlign(LEFT); 
        text ("p111", 0, 325);  
      }
       //pm11
  for (int a = 50; a < 600; a += 80) {
    image(jamesBrown, a, 390);
        fill(0);
        textSize(14);
        textAlign(LEFT); 
        text ("pm11", 0, 450); 
        imageFlip(jamesBrown,a,900,"h");
      }
        //pmm2
  for (int a = 50; a < 600; a += 80) {
    pushMatrix();
    //rotate(radians(180));
    image(jamesBrown, a, 520);
        fill(0);
        textSize(14);
        textAlign(LEFT); 
        text ("pmm2", 0, 570); 
        imageFlip(jamesBrown,a,900,"v2");
        imageFlip(jamesBrown,a,900,"h2");
      //  pushMatrix();
    //rotate(radians(90));
    //imageFlip(jamesBrown,a,00,"v");
       popMatrix();
      }
           //pm11
  for (int a = 50; a < 600; a += 80) {
    image(jamesBrown, a, 650);
        fill(0);
        textSize(14);
        textAlign(LEFT); 
        text ("all of", 0, 710); 
        text ("them!", 0, 730);
        imageFlip(jamesBrown,a,900,"v");
      }
}
void keyPressed(){ // THIS WASN'T WORKING
  mode = keyCode;
  println(mode);
}  






/*  
void draw() {
  background(255);


 for (int a = 0; a < 600; a += 100) {   //glide reflection with alternating vertical mirrors and 180 degree rotation. (p1a1)
    for (int b = 0; b < 600; b +=200) {
      image(jamesBrown, a, 400);

      if (b % 100) {

        imageFlip(jamesBrown, b, 700, "v");
        // imageFlip(jamesBrown,a,100,"h");
      }
    }

  }     
   
for( int b = 0; b < 600; b += 90){   //
   for( int c = 0; c < 600; c +=90){
   
   image(jamesBrown,b,c);
   }
   } 

  //pushMatrix();
  //for(int b = 0; b < 300; b += 30){ 
  //     imageFlip(jamesBrown,b,100,"h");
  //   println(mouseY);
  //popMatrix();
  for ( int a = 0; a < 600; a += 30) {
    //triangle ((a + 10),(a+10),a,a,(a-10), (a-10));
    ellipse(a, 550, 10, 30);
    fill(0);
    rect(a, 550, 20, 20);
  }

 

    //}
}

//println(mouseX);    
*/









//imageFlip function by nick lally
//paste function at the bottom of your sketch, and use like this: imageFlip(imageName,x,y,"mode")
//modes are "v", "v2", "h", "h2"
//"v" mirrors vertically, "v2" mirrors top half vertically
//"h" mirrors horizontally, "h2" mirrors left half horizontally
void imageFlip(PImage imageName, int xPos, int yPos, String mode) {
  //"v2" flips the top half of the image across the x-axis
  if (mode == "v2") {
    imageName.loadPixels();
    for (int i = 0; i < imageName.height; i++) {
      for (int j = 1; j < imageName.width; j++) {
        imageName.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = imageName.pixels[i*(imageName.width) + j];
      }
    }
    imageName.updatePixels();
    image(imageName, xPos, yPos);

    //"v" flips the entire image across the x-axis
  }
  else if (mode == "v") {
    imageName.loadPixels();
    int tempImage[] = new int[imageName.width*imageName.height];
    for (int i = 0; i < imageName.width*imageName.height; i++) {
      tempImage[i] = imageName.pixels[i];
    }

    for (int i = 0; i < imageName.height; i++) {
      for (int j = 1; j < imageName.width; j++) {
        imageName.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = tempImage[i*(imageName.width) + j];
      }
    }
    imageName.updatePixels();
    image(imageName, xPos, yPos);

    //"h2" flips the left half of the image across the y-axis
  }
  else if (mode == "h2") {
    imageName.loadPixels();
    for (int i = 0; i < imageName.height; i++) {
      for (int j = 1; j < imageName.width; j++) {
        imageName.pixels[i*imageName.width + j] = imageName.pixels[(i+1)*(imageName.width) - j];
      }
    }
    imageName.updatePixels();
    image(imageName, xPos, yPos);  

    //"h" flips the entire image across the y-axis
  }
  else if (mode == "h") {
    imageName.loadPixels();
    int tempImage[] = new int[imageName.width*imageName.height];
    for (int i = 0; i < imageName.width*imageName.height; i++) {
      tempImage[i] = imageName.pixels[i];
    }
    for (int i = 0; i < imageName.height; i++) {
      for (int j = 1; j < imageName.width; j++) {
        imageName.pixels[(i+1)*(imageName.width) - j] = tempImage[i*imageName.width + j];
      }
    }
    imageName.updatePixels();
    image(imageName, xPos, yPos);
  } 
  else {
    println("No mirror direction specified!");
    println("Use v, v2, h, or h2 for the 4th argument");
  }
}     



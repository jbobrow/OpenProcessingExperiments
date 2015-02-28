
 //CigFrieze by Jordan Dozzi
 // Imageflip function by Nick Lally &
 // All other functions (push/popMatrix, 
 // rotate/scale & translate from processing book
 // on p.135, 141,142, and 133-134 respectively
 
 PImage ciga;
 PImage cigb;
 
 void setup(){
 background (0);
  size (900,900);
   ciga = loadImage("ciga.png");
   cigb = loadImage("cigb.png");
 
pushMatrix(); 

scale(0.5);
for (int y = -200; y <= 4000; y += 300) {
for (int x = -200; x <= 2400; x += 100) {
    translate (x + 100, y + 100);
    rotate (PI);
    imageFlip (cigb, x, y, "h");
  }
}
  
popMatrix();
  
pushMatrix();

scale(0.5);
for (int y = -200; y <= 4000; y += 300) {
for (int x = -200; x <= 2400; x += 100) {
    translate (x + 600, y + 100);
    rotate (PI);
    imageFlip (cigb, x, y, "h");
  }
}

popMatrix();
 
/*The two operations above create a lattice that both exhibits p2m1 
within each cross of the lattice and p11g between segments due to 
the even pixel spacings of the cigarettes enabling a multiplicity of 
glide reflections.
 */
 
pushMatrix();

translate (370, 200);
for (int j = 0; j < 500; j++) {
scale (0.9); // Cumulative scaling
rotate (PI/15);
image (ciga, 100, 150);
}

popMatrix();
  
pushMatrix();

translate (520, 200);
rotate (PI/2);
for (int j = 0; j < 500; j++) {
scale (0.9); // Cumulative scaling
rotate (-PI/15);
image (ciga, 100, 150);
}

popMatrix();
}
 
//the two spiraling patterns create a p1m1 symmetry

  
//imageFlip function by nick lally
//paste function at the bottom of your sketch, and use like this: imageFlip(imageName,x,y,"mode")
//modes are "v", "v2", "h", "h2"
//"v" mirrors vertically, "v2" mirrors top half vertically
//"h" mirrors horizontally, "h2" mirrors left half horizontally
void imageFlip(PImage imageName, int xPos, int yPos, String mode){
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
}



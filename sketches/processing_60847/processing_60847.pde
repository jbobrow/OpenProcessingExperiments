
// HW 4 
// Sarah Lesnikoski

/* This project was the most difficult. I kept having 'out of memory'
   errors and I'm not sure what I was doing wrong yet. For that, the code
   may be choppy... because I basically had to chip away at other projects 
   to figure it out. So I'd like to work further at it. */
   

PImage rowingaway; //image taken from photo stock online
                   // mutilated and retitled: 'Old Man Icarus, in Piss', by me.

void setup() {
size(600,600);
background(255,255,0); //yellow sea
smooth();
rowingaway = loadImage("fallingoverboard.jpg");
}
void draw() {
   
  
for (int i = 0; i<600; i++) {
  if (i % 180 ==0){
    image (rowingaway, i-100, 30);
  }
}
 
for (int i = 0; i<600; i++) {
  if (i % 180 ==0) {
    pushMatrix();
    translate(600,300);
    rotate(radians(180));
    imageFlip (rowingaway, i-100, 0, "v2");
    popMatrix();
  }
}
 
for (int i = 0; i<600; i++) {
  if (i % 180 ==0){
    pushMatrix();
    translate(0,310);
    imageFlip (rowingaway, i-100, 0, "h2");
    popMatrix();
  }
}
 
for (int i = 0; i<600; i++) {
  if (i % 180 ==0) {
    pushMatrix();
    translate(0,460);
    imageFlip (rowingaway, i-100, 0, "h2");
    popMatrix();
  }
}
  
for(int i = 0; i <600; i++) {
   pushMatrix();
   translate(i*180,530);
   if(i%2 == 0) {
      imageFlip(rowingaway,0,-220,"v");
   } else {
      image(rowingaway,0,-220);
   }
   popMatrix(); 
 
  } 
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



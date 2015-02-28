
float glowLight,angle,x,y,cos,sin,radians;
int i,dir;
int myImage;

void setup(){
  size(700,700);
  background(0);
  colorMode(HSB,360,100,100,100);
  loadImage("LOL.png");
}

void draw(){
  
  x=200*cos(radians(angle))*sin(radians(angle));
  y=200*sin(radians(angle))*cos(radians(angle/2));
  ellipse(x+width/2,y+height/2,70,30);
  
  
  background(155);
    if (dist(mouseX,mouseY,350,350)< 50){
    //(mouseX < 360 && mouseY < 360 && mouseX > 340 && mouseY > 340){
    }else{background(random(360),100,50);
    }    
  
  myTri
  (mouseX,mouseY);
}


void myTri(float posX, float posY){
 line(posX,posY,posX+10,posY+20);
 line(posX+10,posY+20,posX+30,posY+12);
 line(posX,posY,posX+30,posY+12);
 stroke(random(360),100,100);

glowLight=abs(150*sin(radians(angle)));
  fill(glowLight,90,40,20);
  ellipse(width/2,height/2,100,100);
  angle+=60; 

 noFill();
 i+=dir;
  ellipse(height/2,width/2,i,i++);
  line(mouseX,mouseY,pmouseX,pmouseY);
  stroke(10);
  fill(#CEFC59);
  if(i > 250){
    dir=-5;
  }
  if(i < 560){
    dir=1;
  }

if(millis()>30000){
  background(0);
  pushMatrix();
  translate(i,CENTER);
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
 imageName. loadPixels();
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
 
 




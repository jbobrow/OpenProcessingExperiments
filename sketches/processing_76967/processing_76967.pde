
PImage myImg;
int i;
float x,y,angle,glowLight;
int dir = 5;

void setup(){
  size(800,800);
  myImg = loadImage("LOL.png");
  background(#93DDF7);
  x=0;
  y=0;
  angle=0;
  smooth();
  
  
}

void draw(){
  
//for(int i=0; i<4; i++){

  //for(int i = 3; i< 200; i+=4){
  // ellipse(20,height/2,mouseX,i*2);
  // fill(274,91,66,10);
// }
 //^orange ellipses  

for(int i=-1; i<15; i++){
  pushMatrix();
  translate(i*120,0);
  imageFlip(myImg,5,5,"v2");
    popMatrix();   
  }
//^laughing peeps with the mouse  

 noFill();
 i+=dir;
  ellipse(height/2,width/2,i,i);
  line(mouseX,mouseY,pmouseX,pmouseY);
  stroke(10);
  fill(#CEFC59);
  if(i > 450){
    dir=-5;
  }
 //^middle dot and line draw


  
  
for(float i = -600; i < 800; i++){
  float x = i;
  float y = x;
  
  y = sq(x);
  ellipse(x*2,y*1.5,i+=10,i+=10);
  fill(29,91,56,10);
}
//^green ellipses





for(float i =-800; i < 600; i++){
  float x = i;
  float y = x*2;
  
  x = pow(y,3);
  ellipse(x+10,y+10,mouseX,mouseY);
  fill(78,20,58,50);
}
//^purple ellipses





myTri
  (mouseX,mouseY);
}




void myTri(float posX, float posY){
 line(posX,posY,posX+10,posY+20);
 line(posX+10,posY+20,posX+30,posY+12);
 line(posX,posY,posX+30,posY+12);
 stroke(random(360),100,100);

//^pointer click?

if(millis() < 4000){
  background(0);
  noFill();
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

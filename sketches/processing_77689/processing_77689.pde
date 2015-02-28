
//TWEAK OF MY PREVIOUS SKETCH http://www.openprocessing.org/sketch/70962

float myNum; 
float myNum2;
float x,y,angle;
float angle2;
PImage myImg;



void setup(){
  smooth();
  size(800,800);
  x=0;
  y=0;
  angle=0;
  angle2=0;
  myImg=loadImage("splat.png");

}


void draw(){
  println("x: "+mouseX+"y: "+mouseY);
  background(myNum/2,89,125);
  myNum++;
  myNum2++;
  angle+=.1;
  strokeWeight(4);
  //noStroke();

//----------------------------------------------------------------------------  
  fill(150,myNum2,myNum2,50);
  quad(400,0,800,400,400,800,0,400);
  quad(400,100,700,400,400,700,100,400);
  quad(400,200,600,400,400,600,200,400);
  
  fill(random(550),myNum/2,126,45);
  ellipse(width/2,height/2,myNum,myNum);
  ellipse(0,400,myNum,myNum);
  ellipse(800,400,myNum,myNum);
  ellipse(400,0,myNum,myNum);
  ellipse(400,800,myNum,myNum);
  ellipse(800,0,myNum,myNum);
  ellipse(0,0,myNum,myNum);
  ellipse(0,800,myNum,myNum);
  ellipse(800,800,myNum,myNum);
  if(myNum > 1200){
    myNum=0;
  }


//----------------------------------------------------------------------------  
    pushMatrix();
    for(int i=0; i<100; i++){
    translate(1*170,0);
    tint(255, 150);
    imageFlip(myImg,-355,325,"h2");
    }
  popMatrix();


//----------------------------------------------------------------------------  
  x= 400*cos(radians(angle*5))*sin(radians(angle*5))*sin(radians(angle*5));
  y= 400*sin(radians(angle*5))*cos(radians(angle*5))*cos(radians(angle*5));
  strokeWeight(.5);
  ellipse(x+width/2,y+height/2,500,500);


//----------------------------------------------------------------------------
  beginShape();
  for(int i=0;i<17;i++){
    angle2=i*60;
 
  x=400*cos(radians(angle2));
  y=400*sin(radians(angle2));
  vertex(x+400,y+400);
  strokeWeight(.1);
  }
  endShape();  

//----------------------------------------------------------------------------

    
}
  








//----------------------------------------------------------------------------



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


  



/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/75906*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
float x, y, angle, angle2, glow, glow2, worms, worms2, a, b;
PImage space,alligator;
int dir, dir2;
PFont font;

//black diamond stamp with hover mouse

void setup() {
  size(800, 800);
  x=0;
  y=0;
  a=-1;
  b=-1;
  angle=0;
  angle2=0;
  smooth();
  glow=500;
  glow2=1;
  dir=1;
  dir2=1;
  worms=750;
  worms2=1;
  space=loadImage("outer-space.jpeg");
  alligator=loadImage("alligator_toy_white.gif");
  image(space, 0, 0);
  strokeWeight(1);
}

/*void myFun(float posX, float posY){
    fill(0);
    quad(mouseX-20,mouseY,mouseX,mouseY-20,mouseX+20,mouseY,mouseX,mouseY+20);
 }*/

void draw() {
  glow+=glow;
  dir+=5;
  dir2-=5;
  angle+=1;
  angle2--;
  for (int i=0;i<90;i+=30) {
    x=200*cos(radians(angle));
    y=200*sin(radians(angle));
    a=200/sin(radians(angle2));
    b=-200/cos(radians(angle2));
  font = loadFont("Tahoma-Bold-48.vlw");
  textFont(font,16); 
  fill(250,250,240,50);
  stroke(250,250,240,50);
  text("ALLIGATOR",357,340);
    pushMatrix();
      translate(400, 400);
      rotate(radians(angle));
      fill(0, glow/3, glow/4, 5);
      stroke(glow/3, glow/6, 0, 10);
      triangle(x+i,y+i,400,400,x+i+10,y+i+10);
      stroke(glow/2, glow/4, 0, 1);
      triangle(a+i,b+i,900,900,a+i+10, b+i+10);
        if (mousePressed) {
          stroke(255, 0, 0);
          }     
    popMatrix();
  }
  if (mouseX>370 && mouseX<430 && mouseY>250 && mouseY<310) {
    noFill();
    stroke(dir, 0, 0,90);
    quad(dir+400, 280, 400, dir+280, dir2+400, 280, 400, dir2+280);
      if(mousePressed){
        stroke(0,0,0,dir);
        fill(0,0,0,dir);
        quad(390,245,400,235,410,245,400,255);
        for(int j=40;j<800;j+=400){
          tint(255,255,255,dir/10);
        imageFlip(alligator,j,550,"h2"); 
        }
      }
    if (dir>900) {
      dir=0;
      dir2=0;
    }
  }
  else {
    dir=0;
    dir2=0;
    noStroke();
  }
  if (mousePressed && mouseX>390 && mouseX<410 && mouseY>235 && mouseY<255){
    stroke(0,0,0,dir);
        fill(0,0,0,dir);
        quad(390,245,400,235,410,245,400,255);
        }
  if (mousePressed && mouseX>375 && mouseX<425 && mouseY>750 && mouseY<800) {
    worms+=worms2;
    stroke(255, 100, 0, 50);
    triangle(375, 795, 400, 750, 425, 795); 
    imageFlip(space, 0, 0, "h");
    stroke(255,0,0);
    noFill();
    quad(dir+380,280,400,dir2+260,dir2+420,280,400,dir2+300);
      stroke(0);
      imageFlip(space,0,0,"h");     
  }
    fill(255, 255, 0, 90);
    stroke(255, 100, 0, 15);
    triangle(374, 795, 386, 773, 399, 795);
    triangle(401, 795, 413, 773, 425, 795);
    triangle(387, 772, 412, 772, 400, 750);
    stroke(dir, 0, 0,90);
    fill(dir,0,0,80);
    quad(380,280,400,260,420,280,400,300); 


  //myFun(mouseX,mouseY);
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


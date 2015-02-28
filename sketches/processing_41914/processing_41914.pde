
//Moonlit kitty
//The rotate function did not work, evidently. I tried to go on, skipping PIGI and 
//applying it to the others but ended up with similarly unaffected images, 
//still right-side up. I also had difficulty cutting the images in half, as you can see. I tried using both
//the "translate(width/2, height/2)" function but to no avail. 


PImage kitten;
int x;
int y;

void setup(){
  background(255);
  size (800,900);
  scale(.60);
  background(20,20,40);
  fill(250,255,183);
  ellipse(1300,50,160,160);
  noStroke();
  //PIII
  kitten = loadImage("590233007.png");
  image(kitten, 0, 0);
  image(kitten,100,0);
  image(kitten,200,0);
  image(kitten,300,0);
  image(kitten,400,0);
  imageFlip(kitten,x+50,y+250,"v2");
  
  //PIMI
  
 pushMatrix();
translate(40, 40);
image(kitten,100,200);
image(kitten,200,200);
image(kitten,300,200);
image(kitten,400,200);
popMatrix();

  //PII2
pushMatrix();
translate(40,40);
imageFlip(kitten,x+10,y+450,"h2");
image(kitten,100,450);
image(kitten,200,450);
image(kitten,300,450);
image(kitten,400,450);

popMatrix();

//PIGI
pushMatrix();
translate(width/2,height/2);
image(kitten,-350,300);
imageFlip(kitten,x+10,y+300,"v");
pushMatrix();
rotate(radians(180));
popMatrix();

image(kitten,-250,300);
image(kitten,-350,300);
//rotate(radians(180));
image(kitten,-150,300);
image(kitten,-70,300);
//rotate(radians(180));

}

//PMM2










   



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


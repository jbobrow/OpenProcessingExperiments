
PImage myimage; 
PImage imagetwo; 
PImage imagethree;
PImage imagefour;

int value = 0; 

void setup (){
   size(1900, 1000); 
        myimage = loadImage("tumblr.jpg");
   imagetwo = loadImage("Elizabethz.jpg");
   imagethree = loadImage("boy.jpg");
   imagefour = loadImage("smoking.jpg");
}


  
void draw(){
  tint(value, 30);
  image(imagefour, mouseX, mouseY, random (550), random(880));
}

void mouseDragged(){
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
  
  tint(219, 130, 144);
  image (imagethree, 500, 2);
  image(myimage, 0, 0);
  image(imagetwo, 0, height/2, width, height/2);
 
  
}




   
   


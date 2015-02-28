
PImage img0; 
PImage img1;
PImage img2;

float xpos=-60;//x posiion of brush
float ypos=-75;//y position of brush
float stir= 1;//horizontal stir speed
float stirUp= 0.6;//vertical stir speed
float counter=0;//holds info on how far left and right brush has traveled
float counterUp=0;//holds info on how far up and down brush has traveled



void setup() {
  size(628, 600);
  img0 = loadImage("water.jpg");
  img1 = loadImage("arm2.png");
  img2 = loadImage("tint.png");

}


void draw() {

noTint(); //will prevent from applying tint on the whole image
  image(img0,0,0);//is in draw in order to be drawn on top of the images made by moving hand

  
  image(img1, xpos, ypos);//sets brush starting point
  
  
  xpos=xpos+stir;//moves brush left and right
  ypos=ypos+stirUp;//moves brush up and down
  counter=counter+stir;//notes how far brush has moved
  counterUp=counterUp+stirUp;//notes how far brush has moved up and down
 
 //starts horizontal brush movement back to starting point
  if (counter >  40) {
    stir = -2;
  }
  else if (counter<0){
   stir=2; 
  }
  
   //starts vertical brush movement back to starting point
  if (counterUp >  8) {
    stirUp = -0.4;
  }
  else if (counterUp<0){
   stirUp=0.4; 
  }
  

//tinting of the water on key numbers command       
  if (keyPressed == true){   
    if(key == '1'){
    tint(255,255,0,255);
    }
    else if(key == '2'){
    tint(255,125,0,255);
    }
    else if(key == '3'){
    tint(255,0,0,255);
    }
    else if(key == '4'){
    tint(100,0,204,255);
    }
    else if(key == '5'){
    tint(255,0,155,255);
    }
    else if(key == '6'){
    tint(111,0,255,255);
    }
    else if(key == '7'){
    tint(12,5,255,255);
    }
    else if(key == '8'){
    tint(0,169,255,255);
    }
    else if(key == '9'){
    tint(5,250,227,255);
    }
    else if(key == '0'){
    tint(94,250,5,255);
    }
  }
  image(img2,210,428);
 
}

  



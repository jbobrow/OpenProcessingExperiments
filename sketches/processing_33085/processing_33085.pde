
PImage bee;
PImage cloud;
PImage cloud1;
PImage logo;


float img_x= 0;
float img_y= 0;
int img_w = 245;
int img_h = 127;
int img_x1= 0;
int img_x2= -100; 
int img_speedx= 3;
int img_speedx_1= 1;

Boolean isBlack = false; 


void setup() {
  size(700, 500);
  bee = loadImage("bee.png");
  cloud = loadImage("cloud.gif");
  cloud1 = loadImage("cloud1.gif");
  logo = loadImage("logo.png");
}
 
void draw() {
  img_x = mouseX;
  img_y = mouseY;
  if (isBlack == true){
    background(0); 
  } else { 
    background(0,146,230);
  };
  
  //if isBlack is true, make the background black
  //else make the background blue

  
  
  image(bee, img_x, img_y, img_w, img_h);
  
  img_x1 = img_x1 + img_speedx; 
  image(cloud, img_x1, 40, 500, 170);
  if(img_x1 > 1000){img_x1 = -1000;} ;
  
  
  img_x2 = img_x2 + img_speedx_1 ; 
  image(cloud1, img_x2, 220, 1200, 450);
  if(img_x2 > 1000){img_x2 = -1300;} ;
  
  
  if((mouseX > 100) && (mouseY > 200)){
    image(logo, 61, 210, 367, 79);
    isBlack = true;
  } else {
    isBlack = false;
  };
      
      //change isBlack to true
   //else change isBlack to false
  
  
  
}




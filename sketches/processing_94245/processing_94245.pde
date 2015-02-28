

PImage img; 
PImage img2; 
PImage img3; 
PImage img4; 
int counter; 
float angle; 

int rColor; 

void setup() {

  size (400,500); 
  img = loadImage("images.jpg");
  img2 = loadImage("images2.jpg");
  img3 = loadImage("images.jpg"); 
  img4 = loadImage("images2.jpg"); 
  rColor= 0;
 counter  = 0; 
angle =  PI/3.0;  
}



void draw(){

 // bildname, Bildposition (x,y)
  tint(rColor,0,0); 
image (img2, width/2, 0);


if (mousePressed ) {
 tint (rColor++,30,0); 
 image (img2, width/2, 0); 
 
  if(rColor > 255){
  rColor = 0; 
  }
 
}

if (mouseX < 198 || mouseY < 255){
  
  counter = (int) random(0,255); 
  tint (233,123 , counter); 
  image (img, 0, 0);
  
}




if (mousePressed){
  
  
noTint(); 
image(img4, 0, height/2);
rotate(angle); 

angle = angle + angle;

if(angle > 360){
angle = 0; 
}
}


noTint();
image(img3, width/2, height/2); 


}



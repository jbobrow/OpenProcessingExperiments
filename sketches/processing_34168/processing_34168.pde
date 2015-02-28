
//http://forum.processing.org/topic/alpha-chan-from-pgraphics

PGraphics pg;
PImage[] myPics=new PImage [4];
PImage img2;  //mask
PImage img5; //interface
PImage img6; //header 

int saveC = 1; //saving counter

int rand = round(random(0,3));
//int pressCount = 0;

void setup() {
  println(rand);
  size(500,800);
  pg = createGraphics(500,800,P2D);  //uploading the images
  myPics[0]=loadImage("img1.png");//me
  myPics[1]=loadImage("img3.png"); //old lady
  myPics[2]=loadImage("img4.png"); //young lady
  myPics[3]=loadImage("img6.png"); //baby
  img2=loadImage("img2.png"); //mask
  img5=loadImage("face.png"); //interface
  img6=loadImage("header.png"); //header
  image(myPics[rand], 0, 0); 
  background(myPics[rand]); 
}

void draw() {
image(img5, 0, 700);
image(img6, 0, 0);
//background(img5);  //load the inteface    
}


void mouseDragged(){   //drawing the mask      
  pg.beginDraw();
  pg.background(0);
  pg.noStroke();
  pg.fill(150,90);
  pg.ellipse(mouseX,mouseY,40,40);
  pg.endDraw();
  
  img2.mask(pg);
  image(img2, 0, 0);
 
  if(key=='b'){
  pg.beginDraw();
  pg.background(0);
  pg.noStroke();
  pg.fill(150,90);
  pg.ellipse(mouseX,mouseY,110,110);
  pg.endDraw();
  
 img2.mask(pg);
 image(img2, 0, 0);   
}
  if(key=='o'){
  pg.beginDraw();
  pg.background(0);
  pg.noStroke();
  pg.fill(150,90);
  pg.ellipse(mouseX,mouseY,40,40);
  pg.endDraw();
  
  img2.mask(pg);
  image(img2, 0, 0);  //do not touch that this is the mask image!!!!!!//
}

}

void keyTyped(){
    if(key=='n'){
    int rand = round(random(0,3));
    image(myPics[rand], 0, 0); 
 }
  if(key=='s'){
   
   save("image"+saveC+".jpg");  //saving   
   saveC++;   
  } 
     
}
  
  



  





 
  





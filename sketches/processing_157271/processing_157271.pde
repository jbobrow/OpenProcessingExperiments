
int ellipseX;
int ellipseY;
int rectA;
PImage logo,logoW;
PFont Helvetica50;
int pupil=200;
float posX,posY,dist=0;


void setup(){
  size(1200,700);
  ellipseX = 2;
  ellipseY = 0;
  rectA = 0;
  //initialize that image by connecting it with an actual file
  logo = loadImage("NOSISlogoOPAQUE.jpg");
  logoW = loadImage("NOSISlogoWHITE.jpg");
  
  Helvetica50 = loadFont("Helvetica-Light-48.vlw");
}

void draw() {
  background(10);

  ellipseX = ellipseX +1;
  ellipseY = ellipseY +1;
  if(mousePressed){
  image(logoW, 600-(ellipseX/2), 350-(ellipseX/2), ellipseX-20, ellipseX-20) ;
  }
  else{
  image(logo, 600-(ellipseX/2), 350-(ellipseX/2), ellipseX-20, ellipseX-20) ;}
  dist=dist+1;
  
  float limx1=width/2+dist/20-10;
  float limx2=width/2-dist/20-10;
   posX=mouseX;
  if(mouseX>limx1){
    posX=limx1;
  }
  if(mouseX<limx2){
    posX=limx2;
  }
   int offsetY=5;
   
   
  float limy1=height/2+dist/19+offsetY;
  float limy2=height/2-dist/19+offsetY;
   posY=mouseY;
  if(mouseY>limy1){
    posY=limy1;
  }
  if(mouseY<limy2){
    posY=limy2;
  } 


  
  noStroke();
  fill(10);
  pupil = mouseX; 
  pupil = mouseY;
  
  
    if (mouseX <400); {
    pupil=400;
 
    if (mouseY <400); 
    pupil=400;
  
    if (mouseX >300); 
    pupil=300;
    
    if (mouseY >300); 
    pupil=300;
  }
    
//  fill(255,0,0);
  ellipse(posX, posY , (ellipseX/13), (ellipseY/13));
  
  
  fill(250);
  text("V I S I ON   2 0 1 4", 537 , 350+(ellipseX/2)) ;
  
}



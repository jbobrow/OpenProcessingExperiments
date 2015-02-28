
PImage weedtitle;
PImage ailanthusbig;
PImage ailanthussmall;
PImage cloverbig;
PImage cloversmall;
PImage curlydockbig;
PImage curlydocksmall;
PImage knotweedbig;
PImage knotweedsmall;
PImage mallowbig;
PImage mallowsmall;
PImage plantainbig;
PImage plantainsmall;
PImage ragweedbig;
PImage ragweedsmall;
PImage yarrowbig;
PImage yarrowsmall;


void setup(){
  size(500,800);
  background(245,243,218);
  imageMode(CENTER);
  
  weedtitle=loadImage("weeds.jpg");
  ailanthusbig= loadImage("ailanthusbig.jpg");
  ailanthussmall=loadImage("ailanthussmall.jpg");
  cloverbig=loadImage("cloverbig.jpg");
  cloversmall=loadImage("cloversmall.jpg");
  curlydockbig=loadImage("curlydockbig.jpg");
  curlydocksmall=loadImage("curlydocksmall.jpg");
  knotweedbig=loadImage("knotweedbig.jpg");
  knotweedsmall=loadImage("knotweedsmall.jpg");
  mallowbig=loadImage("mallowbig.jpg");
  mallowsmall=loadImage("mallowsmall.jpg");
  plantainbig=loadImage("plantainbig.jpg");
  plantainsmall=loadImage("plantainsmall.jpg");
  ragweedbig=loadImage("ragweedbig.jpg");
  ragweedsmall=loadImage("ragweedsmall.jpg");
  yarrowbig=loadImage("yarrowbig.jpg");
  yarrowsmall=loadImage("yarrowsmall.jpg");
  
}

void draw(){
  println(mouseX + ","+mouseY);
  smooth();
  image(ailanthussmall, 60, 100);
  image(cloversmall, 60, 185);
  image(curlydocksmall, 60, 270);
  image(knotweedsmall, 60, 355);
  image(mallowsmall, 60, 440);
  image(plantainsmall, 60, 525);
  image(ragweedsmall, 60, 610);
  image(yarrowsmall,60, 695);
  image(weedtitle, 300, 100);
  textSize(20);
  fill(77,102,78);
  text("Click", 35, 50);
  
  if (mousePressed==true){
    if (mouseX>24 && mouseX<100){
      if(mouseY>68 && mouseY<136){
          image(ailanthusbig, 295, 400);
      }
      if (mouseY>153 && mouseY<220){
        image(cloverbig, 295, 400);
      }
      
     if (mouseY>238 && mouseY<300){
       image(curlydockbig, 295, 400);
     }
     if (mouseY>323 && mouseY<389){
       image(knotweedbig, 295, 400);
     }
     if (mouseY>408 && mouseY<478){
       image(mallowbig, 295,400);
     }
     if (mouseY>495 && mouseY<557){
       image(plantainbig, 295, 400);
     }
     if (mouseY>577 && mouseY<642){
       image(ragweedbig, 295, 400);
     }
     if (mouseY>665 && mouseY<725){
       image(yarrowbig, 295, 400);
     }
    }
    
  
      
    
    

  }
}




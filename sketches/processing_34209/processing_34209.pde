
PImage dadaImage;
PImage plainImage;
PImage monroeImage;
PImage typeImage;

boolean transparency = false;
int i;

boolean smallsize = true;

PGraphics cover;
PGraphics cover2;
PGraphics cover3;
PGraphics cover4;


void setup (){
   size(600,400);
   background(255);
   dadaImage = loadImage("dada.jpg");
   monroeImage = loadImage("monroe.jpg");
   typeImage = loadImage("type.jpg");

   cover = createGraphics(dadaImage.width, dadaImage.height,P2D);
    // P2D is thename of the renderer that uses PGraphics
   smooth(); 
   
   
   cover2 = createGraphics(monroeImage.width, monroeImage.height,P2D);
   smooth(); 
   
    
  cover3 = createGraphics(typeImage.width,typeImage.height,P2D);
  smooth();
}

void mouseMoved(){
  if(transparency==true)
    {i=5;}
  else{i=100;}
 
  
  if(keyPressed){
    if(key=='a'){
    cover.beginDraw();
    cover.noStroke();
    cover.fill(i);
      if(smallsize == true){
        cover.ellipse(mouseX,mouseY,20,20);
      }
      if(smallsize == false){
        cover.ellipse(mouseX,mouseY,50,50);
        }
        cover.endDraw();
    }
    }
  if(keyPressed){
    if(key=='s'){
    cover2.beginDraw();
    cover2.noStroke();
    cover2.fill(i);
    if(smallsize == true){
        cover.ellipse(mouseX,mouseY,20,20);
    }
    if(smallsize == false){
        cover2.ellipse(mouseX,mouseY,50,50);
    }
        cover2.endDraw();
    }
    }
  
    if(keyPressed){
    if(key=='d'){
    cover3.beginDraw();
    cover3.noStroke();
    cover3.fill(i);
    if(smallsize == true){
        cover3.ellipse(mouseX,mouseY,20,20);
    }
      if(smallsize == false){
        cover3.ellipse(mouseX,mouseY,50,50);
    }
        cover3.endDraw();
    }
    }
 
  
}
      
void draw(){
  if(keyPressed) {
     if(key=='a') {
    dadaImage.mask(cover);
    image(dadaImage,0,0);
      
     }  
  }
  if(keyPressed){
    if(key=='s'){
      monroeImage.mask(cover2);
      image(monroeImage,0,0);
    }    
  }
  
   if(keyPressed){
    if(key=='d'){
      typeImage.mask(cover3);
      image(typeImage,0,0);
    }    
  }

 
  if(keyPressed){
    if(key=='t'){
      if(transparency == false){
          transparency = true;
      }
      else{
        transparency = false;  
    }
    }
  }
  
}

void keyPressed(){
 if(key =='c'){
    if(smallsize == true){
        smallsize = false;
 } 
   else{
     smallsize = true;
   }
}
}




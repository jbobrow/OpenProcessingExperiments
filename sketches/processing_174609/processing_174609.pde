
/*@pjs preload="8.png,2.png";*/
PImage img1,img2; 
 
void setup() {
  size(440, 500);
    background(255);
  img1 = loadImage( "8.png" );
  img2 = loadImage( "2.png" );
  image(img1,0,250,440,228);
  image(img2,0,0,440,228);
  noStroke();
  smooth();
  fill(0);
}
 
void draw() {

}

void mouseDragged() {
   ellipse(mouseX, mouseY, 5, 5);
}

void keyPressed(){
  if(keyPressed){
    if(key == 'X'){ 
    fill(255,255,255);
    }
  } 
    if(keyPressed){
    if(key == 'Z'){ 
    fill(0,0,0);
    }
  }
  
    if(keyPressed){
    if(key == 'C'){ 
    fill(255,0,0);
    }
  }
  
      if(keyPressed){
    if(key == 'V'){ 
    fill(0,255,0);
    }
  }
  
      if(keyPressed){
    if(key == 'B'){ 
    fill(0,0,255);
    }
  }
  
      if(keyPressed){
    if(key == 'A'){ 
    fill(240,236,233); //Pkao
    }
  }
  
      if(keyPressed){
    if(key == 'S'){ 
    fill(251,231,206); //Zkao
    }
  }
  
       if(keyPressed){
    if(key == 'D'){ 
    fill(18,10,34); //Pkami
    }
  }
  
       if(keyPressed){
    if(key == 'F'){ 
    fill(59,25,25); //Zkami
    }
  }
  
         if(keyPressed){
    if(key == 'N'){ 
    fill(255,255,0); 
    }
  }

  
  
  
  if(key == CODED) {
    if(keyCode == ALT) {
    background(255);
    image(img1,0,250,440,228);
  image(img2,0,0,440,228);
    }
  }
}



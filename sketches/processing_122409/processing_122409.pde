
/* @pjs preload="iconLoader.gif"; */
/* global var */ 
PImage imported_image;
int X, Y;
int nX, nY;
int delay = 16;

void setup() {  //setup function called initially, only once
  size(1280 , 720);
  // load img
  sos = 'iconLoader.gif';
  
  frameRate(60);
  
  nX = X;
  nY = Y; 
  
}
void imgload(imgs){
    imported_image = loadImage(imgs);
}

void draw() {  //draw function loops]
    // load background 
    background(0,0,0);  //set background white
    
    
    X+=(nX-X)/delay;
    Y+=(nY-Y)/delay;
    
    if(imported_image != null ) {
        if(imported_image.loaded) {
            image(imported_image,0,0);
            
        }
    }
    imgload(sos);
    fill(255,255,255);
    // Rectangle shows area being copied
    rect(15, 25, 10, 10);
    framelate(); 
    
}

void page1(){
    background(0,0,0);
    
}
void framelate(){
    //fill(255, 255, 0);
    textFont('Ubuntu',50); 
    var temp = text(frameRate, 15, 60);
    println(temp)
}

void mouseMoved(){
    nX = mouseX;
    nY = mouseY;  
}

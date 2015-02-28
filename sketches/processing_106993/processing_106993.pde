
//-----------------------------------------------------//
 //-- modify the whole variables to fit your project----//
//-----------------------------------------------------//

//working area parameters
color bg_color = #ffffff;
int real_dpi = 300;//--> Your atual DPI
int target_dpi = 300;//--> Target DPI
int target_w = 1024;//--> Target device width in pixels
int target_h = 768;//--> Target device height in pixels
boolean use_ruler = true;//--> if you need a ruler tool
boolean use_ruler_index = true;//--> if you need to number rows and colums
int ruler_spacing = 50;//--> grid square size in pixels

//WIREboxes parameters 
boolean fluid            = false; //--> for fluid width boxes
color   stroke           = #999999; 
color   box              = #f7f7f7;
color   font             = #00cc00;
String  box_preffix      = "";


//------ if you're a newbie, don't touch the lines above ----------//

//scale the viewport to fit the targeted DPI
float scale = (float)real_dpi/ (float)target_dpi;
float aprox_w = target_w * scale;
float aprox_h = target_h * scale;
float aprox_ruler_spacing = ruler_spacing * scale;

//creates a ruler tool on the background of the viewport
void ruler(){
    int count = 1; 
    for(int x = (int)aprox_ruler_spacing; x < (int)aprox_w; x += (int)aprox_ruler_spacing){
      line(x, 0, x, 5);  
      if(use_ruler_index){
        fill(200);
        text(count, x-5, 20);
        count ++;
      }
    }
    count = 1;
    for(int y = (int)aprox_ruler_spacing; y < (int)aprox_h; y += (int)aprox_ruler_spacing){
      line(0, y, 5, y); 
      if(use_ruler_index){
        fill(200);
        text(count, 10, y+5);
        count ++; 
      }
    }
}

void setup() {
  //workarea setup
  size((int)aprox_w, (int)aprox_h);
  background(bg_color);
  rectMode(CORNER);
}

//verify if the cursor is over the box ()
boolean isHover(int x, int y, int w, int h){
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) 
    return true; 
  else
    return false;
}

//verify zooming keys (inside draw function)
void isZoom(){
  if(keyPressed){
    if(key == 's' && boxSizeH <= aprox_h - by)
      boxSizeH += 2; 
    else if(key == 'w' && boxSizeH > 0)
      boxSizeH -=2; 
    else if(key == 'd' && boxSizeW <= aprox_w - bx)
      boxSizeW +=2;
    else if(key == 'a' && boxSizeH > 0)
      boxSizeW -=2;
    
  }
}

//draw a quad shape
void newRect(int x,int  y,int  w,int  h, String background){
  
  //obviously the shape
  fill(box);
  rect(x, y, w, h);
  
  //naming or modifying the background of the element
  if(background == ""){
    line(x+1,y+1,x+w, y+h); line(x+w-1, y+1, x+1, y+h-1);
  }else{
    PImage img;
    img = loadImage(background);
    image(img, x, y, w, h);
  }
}


int bx;
int by;
int boxSizeW = 100;
int boxSizeH = 100;
boolean locked = false;
int xOffset; 
int yOffset; 

void draw() 
{ 
  background(bg_color);
  //create a background grid
  if(use_ruler)
    ruler();
    
  // Draw the box
  newRect((int)bx, (int)by, boxSizeW, boxSizeH, "http://mirrors.creativecommons.org/presskit/icons/cc.large.png");
  
  isZoom();

}


void mousePressed() {
  if(isHover(bx, by, boxSizeW, boxSizeH))
    locked = true; 
  else 
    locked = false;
    
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 
}

void mouseDragged() {
  if(locked) {
    if(mouseX-xOffset >= 0 && mouseX-xOffset <= aprox_w-boxSizeW)
      bx = mouseX-xOffset; 
    if(mouseY-yOffset >= 0 && mouseY-yOffset <= aprox_h-boxSizeH)
      by = mouseY-yOffset; 
  }
}

void mouseReleased() {
  locked = false;
}


float Lval = random(1);
float v1 = random(1);
float v2 = random(1);
float w, h;
float UDLR;
float dis = random(100);
float x, y;
float posx, posy;
int value = 0;

void setup(){
 size(400,400);
background(255);
strokeWeight(random(10));
strokeCap (SQUARE);
 strokeJoin (MITER);
//-----proceed with image----
x = random(300);
y = random(300);

 if (v1 < 0.5){ // cal if the line is up, left or right, down.
    UDLR = 0;
  } else{
   UDLR= 400;
  }

 if (v2 < 0.5){//---cal if using x or y axis---
 w = UDLR;
} else {
 h = UDLR; 
}

if  (Lval < 0.5) {//--- draw line using value------
   line(w,y,w,y+dis); //down or up
    posx = w;
    posy = y; 
 } else {
  line(x,h,x+dis,h);//right or left
  posy = h;
  posx = x;
 }
}

void draw(){
fill (value);
  float step = random (6);
  float dis2 = random(-120,120);
  float _val = random(1);
strokeWeight(random(10));  
 for (int i = 0; i < 2;  i = i+1){
  if (_val < 0.5){
   
    x = posx + dis2;
    y = posy;
    line(posx, posy, x, y);
         if (x <= 0){ //if function keeps the lines within the frame
         x = 0;
         dis2 = random(20);
        }else if (x >= width){
         x = width;
         dis2 = random(-20);
        } 
    posx = x;
    posy = y;
    line (posx, posy, x, y);
    

  }else {
    x = posx;
    y = posy + dis2;
    line(posx, posy, x, y);
         if ( y <= 0){
         y = 0;
         dis2 = height;
        }else if ( y >= height){
         y = height;
         dis2 = 0 + 20;
        }
    posx = x;
    posy = y;
    line (posx, posy, x, y);
    
  }
}
}
void keyPressed() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}


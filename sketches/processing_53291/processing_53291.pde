
int mode = 1;
float x,y,angle;


void setup(){
  size(500,800);
  smooth(); 
  x = 0;
  y = 0;
  angle = 0;
  
}


void draw(){
  if(mode == 1){
     x = cos(radians(angle)) * 200 + 2;
    y = sin(radians(angle)) * 200 + height/2;
    triangle(x+angle,angle, angle, angle+30, 3, y+angle);
    angle++;
  } else if (mode == 2){ 
    background(0);
    float ellSize = 0;
   for(int x = 0; x < width; x+=10){
   for(int y = 0; y < 60; y+=100){
     ellSize = cos(x+y)+sin(x-8)*10;
     triangle(x, y, mouseX, mouseY, ellSize+x, ellSize*80);
     
   }
 }
 
  } else  if(mode ==3){
     float ellSize = 0;
     for(int x = 0; x < width; x+=10){
       for(int y = 0; y < height; y+=10){
         ellSize = cos(x+y)+sin(x-8)*10;
         triangle(x, y, ellSize, mouseY, mouseX, ellSize);
     }
    }
  }
}

void keyPressed(){
  if(key == 'a'){
     mode = 1;
  }else if (key =='s'){
   mode = 2;
  }else if (key == 'd'){
   mode = 3;
  } 
}


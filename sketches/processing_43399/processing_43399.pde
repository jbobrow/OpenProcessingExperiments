
PImage pig;
int pigW, pigH, pigx, pigy;
int pixel [][] = new int [100000][3];
int total = 6000;
dot [] dots = new dot [total];

void setup(){
  size(500,375);
  background(255);
  
  picture();
  pixelate();
  move();
}
void picture(){
  pig = loadImage("pig2.jpg");
  pigW = pig.width;
  pigH = pig.height;
}
int p = 0;
void pixelate(){
  pig.loadPixels();
  for(int i=0; i<pigW*pigH; i++){
    if(pig.pixels[i] != color(255,255,255)){
      pixel[p][0] = i%pigW + pigx;
      pixel[p][1] = int(i/pigW) + pigy;
      pixel[p][2] = pig.pixels[i];
      p++;
    }
  }
  pig.updatePixels();
}

void move(){
  for(int i=0; i<total; i++){    
    int rand = (int)random(p);    
    dots[i] = new dot();
    dots[i].ox = pixel[rand][0];
    dots[i].oy = pixel[rand][1];
    
    dots[i].tx = dots[i].ox;
    dots[i].ty = dots[i].oy;
    dots[i].x = dots[i].ox;
    dots[i].y = dots[i].oy;
    
    dots[i].col = pixel[rand][2];
  }
}

void draw(){
  background(255);
  for(int i=0;i<total; i++){
    dots[i].move();
  }
}

class dot{
  float ox,oy,tx,ty,x,y;
  float dx,dy,dist;
  float mdx,mdy,mdist;
  float damperX,damperY;
  color col;
  dot(){
    damperX = 5 + random(15);
    damperY = 5 + random(15);
    col = color(255,255,255);    
  }

  void move(){
    mdx = x;
    mdy = y;
    mdist = sqrt(sq(mdx)+sq(mdy));
    if(mdist<(20+random(20))){      
      if(random(10)<0.5){
        int rand = (int)random(p); 
    }   
    }else    
    
    if(abs(tx-x)<1+random(10) && abs(ty-y)<1+random(10)){
      tx = ox + random(20) - 10;
      ty = oy + random(20) - 10;
    }
    
    dx = tx-x;
    dy = ty-y;
    dist = sqrt(sq(dx)+sq(dy));
    x += dx/damperX;
    y += dy/damperY;
    
    drawPig();
  }
  void drawPig(){
    noStroke();
    fill(col);
    ellipse(x,y,4,4);
  }
}



void setup(){
  size(512, 512);
  background(0, 0, 0);
  stroke(255);
  smooth();
  frameRate(30);
  strokeWeight(0.01);
}

void draw(){
  int times = 1;
  drawKoch(200, 300, 250, 214, times);
  drawKoch(250, 214, 300, 300, times);
  drawKoch(300, 300, 200, 300, times);
  drawKoch(100, 100, 125, 60 , times);
  drawKoch(125, 60 , 150, 100, times);
  drawKoch(150, 100, 100, 100, times);
  drawKoch(400, 400, 420, 370, times);
  drawKoch(420, 370, 440, 400, times);
  drawKoch(440, 400, 400, 400, times);
  drawKoch(100, 400, 110, 385, times);
  drawKoch(110, 385, 120, 400, times);
  drawKoch(120, 400, 100, 400, times);
}

void drawKoch(int ax,int ay,int bx,int by, int n){
  int cx, cy, dx, dy, ex, ey;
  float angle1, angle2, distance;
  
  cx = (2 * ax + bx) / 3;
  cy = (2 * ay + by) / 3;
  dx = (ax + 2 * bx) / 3;
  dy = (ay + 2 * by) / 3;
  
  int xx = bx - ax;
  int yy = -(by - ay);
  
  distance = sqrt(xx*xx + yy*yy)/sqrt(3);
  
  if(xx >= 0){
    angle1 = atan((float)yy/xx) + PI/6;
    ex = ax + (int)(distance * cos(angle1));
    ey = ay - (int)(distance * sin(angle1));
  }else{
    angle2 = atan((float)yy/xx) - PI/6;
    ex = bx + (int)(distance * cos(angle2));
    ey = by - (int)(distance * sin(angle2));
  }
  
  if(n<=0){
    line(ax,ay,cx,cy);
    line(cx,cy,ex,ey);
    line(ex,ey,dx,dy);
    line(dx,dy,bx,by);
  }
  else{
    drawKoch(ax,ay,cx,cy,n-1);
    drawKoch(cx,cy,ex,ey,n-1);
    drawKoch(ex,ey,dx,dy,n-1);
    drawKoch(dx,dy,bx,by,n-1);
  } 
}

void keyPressed() {
    if(key == 'p'){

        // 画面をpngファイルに保存
        save("screenshot.jpg"); 
    }
    
    if(key == 'P'){

        // 画面をpngファイルに保存
        save("screenshot.png"); 
    }
    
    if(key == 'b' || key == 'B'){
      background(0);
      stroke(255);
    }
    if(key == 'w' || key == 'W'){
      background(255);
      stroke(0);
    }
}




/*  Chris Driscoll
    Nov 16, 2011
     
    Mouse x and y coordinates control camera rotation around image.
    Keys 's' and 'a' zoom towards and away from image.
    Clicking mouse replaces points with spheres vertically spaced by a factor of 5 and having a detail level of 1.
     
    Much of this code is modified various pages of http://processing.org/reference/
*/
 
PImage pic;
int[][] e;
int[][] r;
int[][] g;
int[][] b;
int d;
 
void setup(){
  size(800, 800, P3D);
  sphereDetail(5);
  pic = loadImage("a.jpg");
  pic.loadPixels();
  e = new int[pic.width][pic.height];
  r = new int[pic.width][pic.height];
  g = new int[pic.width][pic.height];
  b = new int[pic.width][pic.height];
  for (int y = 0; y < pic.height; y++) {
    for (int x = 0; x < pic.width; x++) {
      color pixel = pic.get(x, y);
      e[x][y] = int(brightness(pixel));
      r[x][y] = int(red(pixel));
      g[x][y] = int(green(pixel));
      b[x][y] = int(blue(pixel));
    }
  }
}
void keyPressed(){
  if(key=='a')d=d+10;
  if(key=='s')d=d-10;
}
 
void draw(){
  background(0);
  camera(mouseX*2-width/2, mouseY*2-height/2, d+((height/2.0) / tan(PI*60.0 / 360.0)), width/2.0, height/2.0, 0, 0, 1, 0);
  translate((width/2)-(pic.width/2),(height/2)-(pic.height/2),0);
  if(mousePressed){
    if(mouseButton==LEFT){
      drawLines();
    }else{
      drawLines();
      drawSpheres();
    }
  }else
  drawDots();
}

void drawDots(){  
  for (int y = 0; y < pic.height; y++) {
    for (int x = 0; x < pic.width; x++) {
      stroke(r[x][y],g[x][y],b[x][y],e[x][y]);
      point(x, y, e[x][y]);
    }
  }
}

void drawLines(){  
  for (int y = 0; y < pic.height; y++) {
    for (int x = 0; x < pic.width; x++) {
      stroke(r[x][y],g[x][y],b[x][y],255);
      line(x, y, e[x][y],x,y,-1000);
    }
  }
}

void drawSpheres(){      noStroke();
  for (int y = 0; y < pic.height; y++) {
    for (int x = 0; x < pic.width; x++) {
      if(x%7==1&&y%7==1){
        fill(r[x][y],g[x][y],b[x][y],e[x][y]/5);
        translate(x,y,e[x][y]+12);
        sphere(12);
        translate(-x, -y, -e[x][y]-12);
      }else if(x%4==1&&y%4==1){
        fill(r[x][y],g[x][y],b[x][y],e[x][y]);
        noStroke();
        translate(x,y,e[x][y]+15);
        sphere(5);
        translate(-x, -y, -e[x][y]-15);
      }    
    }
  } 
}


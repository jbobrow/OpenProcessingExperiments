
 /* made by Ariel Nevarez and Matt Richard.  Drawing heavily from 
 
 */
 
 
class Ball { 
  float x, y, dx, dy;  
  float ox, oy; 
  float r, g, b, variance; 
  PImage marlon;
  color icolor;
   
  Ball(float x, float y, float dx, float dy, float r, float g, float b, float v) { 
    this.x = x; 
    this.y = y; 
    this.dx = dx; 
    this.dy = dy; 
    this.r = r; 
    this.g = g; 
    this.b = b; 
    variance = v; 
    //pull color from image
    marlon = loadImage("data/marlon.png"); //load ong into PImage
    int ix = floor(random(marlon.width));  //random x coord for pixel
    int iy = floor(random(marlon.height));   //random y coord for pixel
    icolor = marlon.get(ix, iy);  //extract color from x&y coords
  }   
   
  void run() { 
    ox = x; 
    oy = y; 
//    x += dx; 
//    y += dy; 
//    dx += (mouseX-x)/100; 
//    dy += (mouseY-y)/100; 
    float ang = atan2(mouseY-y, mouseX-x); 
    float dist = dist(x, y, mouseX, mouseY); 
    if(dist == 0) return; 
    x += 25*cos(ang)/sqrt(dist)*m; 
    y += 25*sin(ang)/sqrt(dist)*m; 
//    size = 10/dist; 
  } 
   
  void show() { 
    r += random(-variance, variance); 
    
    r ++;
    r = r % 255;
   // g += random(-variance, variance); 
   // b += random(-variance, variance); 
    graphics.strokeWeight(size); 
   // graphics.stroke(color(r, g, b, 50)); 
    
    graphics.stroke(icolor, 50);
    graphics.line(x, y, ox, oy); 
  } 
} 



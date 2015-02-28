
/*

 JTNIMOY "Myron_CameraAsMouse"
 with 
 Rick Companje "Metaball" http://www.openprocessing.org/sketch/10275
 Mash-up by park
 
*/

import JMyron.*;

JMyron m;//a camera object

//variables to maintain the floating green circle
float objx = 160;
float objy = 120;
float objdestx = 160;
float objdesty = 120;
float force=.001;

//blob settings
int numBlobs = 10;
float scale = .5;
Blob b[] = new Blob[numBlobs];
  
PGraphics pg;
   
int w;
int h;
//

void setup(){
  size(640,480,P2D);
  m = new JMyron();//make a new instance of the object
  m.start(width,height);//start a capture at 320x240
  m.trackColor(255,255,255,256*3-100);//track white
  m.update();
  m.adaptivity(10);
  m.adapt();// immediately take a snapshot of the background for differencing
  println("Myron " + m.version());
  rectMode(CENTER);
  noStroke();
  
  //blob settings
  w = int(width*scale);
  h = int(height*scale);
  
  pg = createGraphics(w, h, P2D);
   
  for (int i=0; i<numBlobs; i++) {
   b[i] = new Blob(random(w),random(h),random(-1,1),random(-1,1), 1+random(15));
  }
  //
}


void draw(){
  m.update();//update the camera view
  //drawCamera();
  
  int[][] centers = m.globCenters();//get the center points
  //draw all the dots while calculating the average.
  float avX=0;
  float avY=0;
  for(int i=0;i<centers.length;i++){
    fill(80);
    rect(centers[i][0],centers[i][1],5,5);
    avX += centers[i][0];
    avY += centers[i][1];
  }
  if(centers.length-1>0){
    avX/=centers.length-1;
    avY/=centers.length-1;
  }

  //draw the average of all the points in red.
  fill(255,0,0);
  rect(avX,avY,5,5);

  //update the location of the thing on the screen.
  if(!(avX==0&&avY==0)&&centers.length>0){
    objdestx = avX;
    objdesty = avY;
  }
  objx += (objdestx-objx)/10.0f;
  objy += (objdesty-objy)/10.0f;
  
  fill(30,100,0);
  ellipseMode(CENTER);
  ellipse(objx,objy,60,60);

////blob settings
 for (int i=0; i<numBlobs-1; ++i) { b[i].update(i); }
 // Output into a buffered image for reuse
 int[] img = m.differenceImage(); //get the normal image of the camera
 drawCamera();
 pg.loadPixels();
 for (int y=0; y<h; y++) {
   for (int x=0; x<w; x++) {
     int m1 = 1;
     for (int i=0; i <numBlobs-1; i++) {
     // Increase this number to make your blobs bigger
     m1 += b[i].getbs()*1000/(b[i].bx[x] + b[i].by[y] + 1);
     }
     pg.pixels[x+y*w] = color(m1,m1,m1,200);
   //pg.pixels[x+y*w] = color(255-dist(x,y,width*.5,height*.5), m1+dist(x,y,width*.5,height*.5)*.3, (x+m1+y)*scale); //in HSB mode: color((m+x+y),255,255);
   //pixels[x+y+w] = img[x+y+w];
 }
 }
 
 pg.updatePixels();
// updatePixels();
 // Display the results
 
 image(pg,0,0,width,height);

}

void drawCamera(){
  int[] img = m.differenceImage(); //get the normal image of the camera
  loadPixels();
  for(int i=0;i<width*height;i++){ //loop through all the pixels
    pixels[i] = img[i]; //draw each pixel to the screen
  }
  updatePixels();
}



class Blob {
 float blobsize;
// float force=.001;
 float fluid=.0005;
 float forcerad=120;
 float x,y, vx,vy;
 int[] bx,by;
 public float getx() { return x; } public float gety() { return y; } public float getbs() { return blobsize; }

 Blob(float x, float y, float vx, float vy, float bs) {
  this.x = x;
  this.y = y;
  this.vx = vx;
  this.vy = vy;
  this.bx = new int[w];
  this.by = new int[h];
  blobsize=bs;
 }
 void update(int num) {
    x+=vx;
    y+=vy;
    vx*=.995;
    vy*=.99;
   if (x<blobsize*.5 || x>w-blobsize*.5) vx=-vx*.9;
   if (y<blobsize*.5 || y>h-blobsize*.5) vy=-vy*.9;
     
   for (int i=0; i<w; i++) bx[i] = int(sq(x-i));
   for (int i=0; i<h; i++) by[i] = int(sq(y-i));
     
  //if(mousePressed){
    float dis = dist(x, y, objx*scale, objy*scale);
    float ang1 = atan2(objx*scale-y, objy*scale-x);
    vx += dis * force * cos(ang1);
    vy += dis * force * sin(ang1);
  //}
  
  Blob bi = (Blob) b[(num+1)];
    
   float tx = bi.getx();
   float ty = bi.gety();
   float radius = dist(x, y, tx, ty);
   if (radius < blobsize*11) {
     float ang = atan2(ty-y, tx-x);
     vx += radius * fluid * cos(ang);
     vy += radius * fluid * sin(ang);
    if (radius < blobsize*.5) {
       vx -= radius * fluid*3 * cos(ang);
       vy -= radius * fluid*3 * sin(ang);
     }
    }
 }
}
//blob class end

void mousePressed(){
  m.settings();//click the window to get the settings
}

public void stop(){
  m.stop();//stop the object
  super.stop();
}



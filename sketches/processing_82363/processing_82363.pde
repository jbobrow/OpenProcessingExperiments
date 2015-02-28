
//Mod of http://www.openprocessing.org/sketch/10275 by qdiiibp
// added self-attraction and self-rejection to blob class to make behavior more bloblike
// added mouse action to blob class
// added blobsize to blob class
// modded colors
 
int numBlobs = 30;
 float scale = .5;
Blob b[] = new Blob[numBlobs];
 
PGraphics pg;
  
int w,h;
  
void setup() {
 size(320, 240);
 w = int(width*scale);
 h = int(height*scale);
  
 pg = createGraphics(w, h, P2D);
  
 for (int i=0; i<numBlobs; i++) {
 b[i] = new Blob(random(w),random(h),random(-1,1),random(-1,1), 1+random(15));
 }
}
  
void draw() { for (int i=0; i<numBlobs-1; ++i) { b[i].update(i); }
  
 // Output into a buffered image for reuse
 pg.loadPixels();
 for (int y=0; y<h; y++) {for (int x=0; x<w; x++) { int m = 1;
 for (int i=0; i <numBlobs-1; i++) {
   // Increase this number to make your blobs bigger
 m += b[i].getbs()*1000/(b[i].bx[x] + b[i].by[y] + 1); }
 pg.pixels[x+y*w] = color(255-dist(x,y,width*.5,height*.5), m+dist(x,y,width*.5,height*.5)*.3, (x+m+y)*scale); //in HSB mode: color((m+x+y),255,255);
 } } pg.updatePixels();
 
 // Display the results
image(pg,0,0,width,height);
    
      selectedThumbnail.src=externals.canvas.toDataURL("image/jpeg",0.7);// take a screenshot from the sketch and place it in the imgElement
      }
     
   HTMLElement selectedThumbnail=parent.document.body.getElementsByClassName('visThumbnail50 selected')[0].children[0];// get the right HTMLElement
 selectedThumbnail.style.width="50px";
 
 
 

 
class Blob {
  float blobsize;
 float force=.001;
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
 x+=vx; y+=vy;
vx*=.995;vy*=.99;
 if (x<blobsize*.5 || x>w-blobsize*.5) vx=-vx*.9;
 if (y<blobsize*.5 || y>h-blobsize*.5) vy=-vy*.9;
  
 for (int i=0; i<w; i++) bx[i] = int(sq(x-i));
 for (int i=0; i<h; i++) by[i] = int(sq(y-i));
  
if(mousePressed){float dis = dist(x, y, mouseX*scale, mouseY*scale);
if (dis < forcerad) {float ang = atan2(mouseY*scale-y, mouseX*scale-x); 
if (mouseButton==LEFT) {vx += dis * force * cos(ang); vy += dis * force * sin(ang); }
else if (mouseButton==RIGHT) {vx -= dis * force * cos(ang); vy -= dis * force * sin(ang); }}}
Blob bi = (Blob) b[(num+1)];
 
 float tx = bi.getx();float ty = bi.gety();
 float radius = dist(x, y, tx, ty);
if (radius < blobsize*11) {float ang = atan2(ty-y, tx-x); vx += radius * fluid * cos(ang); vy += radius * fluid * sin(ang);
if (radius < blobsize*.5) { vx -= radius * fluid*3 * cos(ang); vy -= radius * fluid*3 * sin(ang); }
} }}




 /*

Daniela Gill
08-09-11
lelagillny@mac.com
copyright 2011
Bootcamp/ Gradient homework 5  

*/
 
 void setup() {
  size(256,256); /* size should be 256 since the colors go up to 255 */
  noLoop();
}
 
void draw () {
  for (int x=0;x<256;x=x+1){ /* 256 since the colors go up to 255 */
      for (int y=0;y<256;y=y+1) {
        stroke(128,x,y); /* the stroke is to color the point */
        point(y,x);
      }
  }
} 


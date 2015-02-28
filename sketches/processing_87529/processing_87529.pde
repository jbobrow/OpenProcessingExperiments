
int n = 600;
int a = 1;
int b = 1;
int s = 1;
int d = 1;
int f = 1;
int g = 1;
int h = 1;
int j = 1;
int k = 1;
int l = 1;
int z = 1;

float counter;
int nn=1;
int x =1;

// Constants
int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, c1, c2;

void setup() {
  
  counter=0.0;

  
  size (600,600);
  background (255);
    // Define colors
  b1 = color(255);
  b2 = color(0);
c1 = color(random(100,250),random(150,250),random(100,250));
  c2 = color(random(150,250),random(100,250),random(150,250));
   setGradient(0, 0, 800, 800, c1, c2, Y_AXIS);
}





void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }}
  
}



//if (keyPressed == true) {
//c1 = color(random(100,250),random(100,250),random(100,250));
//  c2 = color(random(100,250),random(100,250),random(100,250));
//  PImage pic7;
//  tint (255);
//pic7 = loadImage("pic77.png");
//image(pic7, 0,0);
//}

void draw() {
  
if ( mousePressed ==true) {


 nn = nn+ 360;
  PImage cutter;
  imageMode(CENTER);
cutter = loadImage("Chain2.png");
//translate(((width/2)-mouseX*2), ((height/2)-mouseY*2));
//rotate(PI/2);
image(cutter, mouseX, mouseY);


//  background (random(50,240),random(50,240),random(50,240)); 
c1 = color(random(100,250),random(100,250),random(100,250));
  c2 = color(random(100,250),random(100,250),random(100,250));
}











    
//    
//    if(keyPressed) {
//    if (key == 'a') {
//   a = a+1;
//  loadPixels();
// for (int i=n*n-n;i>n;i--) 
////   pixels[i]=int((pixels[i-n]-pixels[i+2]+pixels[i-1])/23);
//
//pixels [i]=  n - i*n/a;
//
//  updatePixels();
//    }}
//    
//    
//    
//        if(keyPressed) {
//    if (key == 's') {
//   s = s+1;
//  loadPixels();
// for (int i=n*n-n;i>n;i--) 
////   pixels[i]=int((pixels[i-n]-pixels[i+2]+pixels[i-1])/23);
//
//pixels [i]=  n - (i/n)*(n/115)*s;
//  updatePixels();
//}}
//    
//            if(keyPressed) {
//    if (key == 'd') {
//      
//   d = d+1;
//  loadPixels();
// for (int i=n*n-n;i>n;i--) 
////   pixels[i]=int((pixels[i-n]-pixels[i+2]+pixels[i-1])/23);
//
//pixels [i]=  n - i*n*d;
//  updatePixels();
//    }}
//    
                if(keyPressed) {
    if (key == '2') {
         point(mouseX/300, mouseY-367);
   f = f+1;
  loadPixels();
 for (int i=n*n-10;i>n;i--) 
//   pixels[i]=int((pixels[i-n]-pixels[i+2]+pixels[i-1])/23);

pixels [i]=  int(pixels [i/f]+ pixels [i] - pixels [n+f*f] );
  updatePixels();

    }}
    
//                    if(keyPressed) {
//    if (key == 'g') {
//         point(mouseX/300, mouseY-367);
//   g = g+1;
//  loadPixels();
// for (int i=n*n-n;i>n;i--) 
////   pixels[i]=int((pixels[i-n]-pixels[i+2]+pixels[i-1])/23);
//
//    pixels [i]=  int(pixels [i]+ pixels [i-g]);
//  updatePixels();
//
//    }}
    
                        if(keyPressed) {
    if (key == '3') {
         point(mouseX/300, mouseY-367);
   h = h+1;
  loadPixels();
 for (int i=n*n-n;i>n;i--) 
//   pixels[i]=int((pixels[i-n]-pixels[i+2]+pixels[i-1])/23);

    pixels [i]=  int((pixels[i/n]+pixels[i-h]+pixels[i-1])/n-h*2 +pixels [i] );
  updatePixels();

    }}
    
        
                        if(keyPressed) {
    if (key == '4') {
         point(mouseX/300, mouseY-367);
   j = j+1;
  loadPixels();
 for (int i=n*n-n;i>n;i--) 
//   pixels[i]=int((pixels[i-n]-pixels[i+2]+pixels[i-1])/23);

    pixels [i]=  int((pixels[i/n]+pixels[i-j]+pixels[i-1])/ n-h*2 +pixels [i-j] );
  updatePixels();

    }}
    
                            if(keyPressed) {
    if (key == '1') {
         point(mouseX/300, mouseY-367);
   k = k+1;
  loadPixels();
 for (int i=n*n-n;i>n;i--) 
//   pixels[i]=int((pixels[i-n]-pixels[i+2]+pixels[i-1])/23);

    pixels [i]=  int((pixels[n/i]-pixels[i+j]+pixels[i-k])/ n-k *2 +pixels [i] );
  updatePixels();

    }}
    
//                                if(keyPressed) {
//    if (key == 'l') {
//         point(mouseX/300, mouseY-367);
//   l = l+1;
//  loadPixels();
// for (int i=n*n-n;i>n;i--) 
////   pixels[i]=int((pixels[i-n]-pixels[i+2]+pixels[i-1])/23);
//
//    pixels [i/l*l]=  int(pixels [i-n]+pixels[i/12] + pixels [i-n] + pixels [i/(n/l)] - pixels [i/n]+ pixels [i/n]+ (pixels [i/n]+ pixels [l/n]+ pixels [i-n]));
//  updatePixels();
//
//    }}


                                if(keyPressed) {
    if (key == '5') {
         point(mouseX/300, mouseY-367);
   z = z+1;
  loadPixels();
 for (int i=n*n-n;i>n;i--) 
//   pixels[i]=int((pixels[i-n]-pixels[i+2]+pixels[i-1])/23);

    pixels [i/((l+z)/z*z)]=  int(pixels [i-n]+pixels[i/2] );
  updatePixels();

    }}


}






  
  



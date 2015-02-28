
/* shapes clock
   by a very sleepy lily zhou
   february 2011
                             */

/* hours are denoted by TRIANGLES
   minutes are denoted by CIRCLES
   seconds are denoted by SQUARES
                                 */
 
/* i know this code is a mess,
   i'll make it more efficient
                              */

PImage ht;
PImage mc;
PImage ss;

float hx;
float mx;
float sx;

void setup() {
  size(640, 480);
  background(255);
  fill(0);
}

void draw() {
  smooth();
  // hour triangles
  ht = loadImage ("hourtriangle.png");
  float h = hour();
  hx = (110 + (30*h));

  if (h == 1) {
    image(ht, hx, 75);
  }

  if (h == 2) {
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 3) {
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 4) {
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 5) {
    image(ht, hx - ((h-4)*30), 75); 
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 6) {
    image(ht, hx - ((h-5)*30), 75); 
    image(ht, hx - ((h-4)*30), 75); 
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 7) {
    image(ht, hx - ((h-6)*30), 75); 
    image(ht, hx - ((h-5)*30), 75); 
    image(ht, hx - ((h-4)*30), 75); 
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 8) {
    image(ht, hx - ((h-7)*30), 75); 
    image(ht, hx - ((h-6)*30), 75); 
    image(ht, hx - ((h-5)*30), 75); 
    image(ht, hx - ((h-4)*30), 75); 
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 9) {
    image(ht, hx - ((h-8)*30), 75); 
    image(ht, hx - ((h-7)*30), 75); 
    image(ht, hx - ((h-6)*30), 75); 
    image(ht, hx - ((h-5)*30), 75); 
    image(ht, hx - ((h-4)*30), 75); 
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 10) {
    image(ht, hx - ((h-9)*30), 75); 
    image(ht, hx - ((h-8)*30), 75); 
    image(ht, hx - ((h-7)*30), 75); 
    image(ht, hx - ((h-6)*30), 75); 
    image(ht, hx - ((h-5)*30), 75); 
    image(ht, hx - ((h-4)*30), 75); 
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 11) {
    image(ht, hx - ((h-10)*30), 75); 
    image(ht, hx - ((h-9)*30), 75); 
    image(ht, hx - ((h-8)*30), 75); 
    image(ht, hx - ((h-7)*30), 75); 
    image(ht, hx - ((h-6)*30), 75); 
    image(ht, hx - ((h-5)*30), 75); 
    image(ht, hx - ((h-4)*30), 75); 
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 12) {
    image(ht, hx - ((h-11)*30), 75); 
    image(ht, hx - ((h-10)*30), 75); 
    image(ht, hx - ((h-9)*30), 75); 
    image(ht, hx - ((h-8)*30), 75); 
    image(ht, hx - ((h-7)*30), 75); 
    image(ht, hx - ((h-6)*30), 75); 
    image(ht, hx - ((h-5)*30), 75); 
    image(ht, hx - ((h-4)*30), 75); 
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 13) {
    image(ht, 140, 75);
  }

  if (h == 14) {
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 15) {
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 16) {
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 17) {
    image(ht, hx - ((h-4)*30), 75); 
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 18) {
    image(ht, hx - ((h-5)*30), 75); 
    image(ht, hx - ((h-4)*30), 75); 
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 19) {
    image(ht, hx - ((h-6)*30), 75); 
    image(ht, hx - ((h-5)*30), 75); 
    image(ht, hx - ((h-4)*30), 75); 
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 20) {
    image(ht, hx - ((h-7)*30), 75); 
    image(ht, hx - ((h-6)*30), 75); 
    image(ht, hx - ((h-5)*30), 75); 
    image(ht, hx - ((h-4)*30), 75); 
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 21) {
    image(ht, hx - ((h-8)*30), 75); 
    image(ht, hx - ((h-7)*30), 75); 
    image(ht, hx - ((h-6)*30), 75); 
    image(ht, hx - ((h-5)*30), 75); 
    image(ht, hx - ((h-4)*30), 75); 
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 22) {
    image(ht, hx - ((h-9)*30), 75); 
    image(ht, hx - ((h-8)*30), 75); 
    image(ht, hx - ((h-7)*30), 75); 
    image(ht, hx - ((h-6)*30), 75); 
    image(ht, hx - ((h-5)*30), 75); 
    image(ht, hx - ((h-4)*30), 75); 
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 23) {
    image(ht, hx - ((h-10)*30), 75); 
    image(ht, hx - ((h-9)*30), 75); 
    image(ht, hx - ((h-8)*30), 75); 
    image(ht, hx - ((h-7)*30), 75); 
    image(ht, hx - ((h-6)*30), 75); 
    image(ht, hx - ((h-5)*30), 75); 
    image(ht, hx - ((h-4)*30), 75); 
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }

  if (h == 24) {
    image(ht, hx - ((h-11)*30), 75); 
    image(ht, hx - ((h-10)*30), 75); 
    image(ht, hx - ((h-9)*30), 75); 
    image(ht, hx - ((h-8)*30), 75); 
    image(ht, hx - ((h-7)*30), 75); 
    image(ht, hx - ((h-6)*30), 75); 
    image(ht, hx - ((h-5)*30), 75); 
    image(ht, hx - ((h-4)*30), 75); 
    image(ht, hx - ((h-3)*30), 75);
    image(ht, hx - ((h-2)*30), 75);
    image(ht, hx - ((h-1)*30), 75);
    image(ht, hx, 75);
  }





  // minute circles
  mc = loadImage ("minutecircle.png");
  float m = minute();
  mx = (110 + (30*m));

  if (m == 1) {
    image(mc, mx, 105);
  }

  if (m == 2) {
    image(mc, mx - ((m-1)*30), 105);
    image(mc, mx, 105);
  }

  if (m == 3) {
    image(mc, mx - ((m-2)*30), 105);
    image(mc, mx - ((m-1)*30), 105);
    image(mc, mx, 105);
  }

  if (m == 4) {
    image(mc, mx - ((m-3)*30), 105);
    image(mc, mx - ((m-2)*30), 105);
    image(mc, mx - ((m-1)*30), 105);
    image(mc, mx, 105);
  }

  if (m == 5) {
    image(mc, mx - ((m-4)*30), 105);
    image(mc, mx - ((m-3)*30), 105);
    image(mc, mx - ((m-2)*30), 105);
    image(mc, mx - ((m-1)*30), 105);
    image(mc, mx, 105);
  }

  if (m == 6) {
    image(mc, mx - ((m-5)*30), 105);       
    image(mc, mx - ((m-4)*30), 105);
    image(mc, mx - ((m-3)*30), 105);
    image(mc, mx - ((m-2)*30), 105);
    image(mc, mx - ((m-1)*30), 105);
    image(mc, mx, 105);
  }

  if (m == 7) {
    image(mc, mx - ((m-6)*30), 105);   
    image(mc, mx - ((m-5)*30), 105);       
    image(mc, mx - ((m-4)*30), 105);
    image(mc, mx - ((m-3)*30), 105);
    image(mc, mx - ((m-2)*30), 105);
    image(mc, mx - ((m-1)*30), 105);
    image(mc, mx, 105);
  }

  if (m == 8) {   
    image(mc, mx - ((m-7)*30), 105);  
    image(mc, mx - ((m-6)*30), 105);   
    image(mc, mx - ((m-5)*30), 105);       
    image(mc, mx - ((m-4)*30), 105);
    image(mc, mx - ((m-3)*30), 105);
    image(mc, mx - ((m-2)*30), 105);
    image(mc, mx - ((m-1)*30), 105);
    image(mc, mx, 105);
  }

  if (m == 9) {  
    image(mc, mx - ((m-8)*30), 105);  
    image(mc, mx - ((m-7)*30), 105);  
    image(mc, mx - ((m-6)*30), 105);   
    image(mc, mx - ((m-5)*30), 105);       
    image(mc, mx - ((m-4)*30), 105);
    image(mc, mx - ((m-3)*30), 105);
    image(mc, mx - ((m-2)*30), 105);
    image(mc, mx - ((m-1)*30), 105);
    image(mc, mx, 105);
  }

  if (m == 10) {  
    image(mc, mx - ((m-9)*30), 105);  
    image(mc, mx - ((m-8)*30), 105);  
    image(mc, mx - ((m-7)*30), 105);  
    image(mc, mx - ((m-6)*30), 105);   
    image(mc, mx - ((m-5)*30), 105);       
    image(mc, mx - ((m-4)*30), 105);
    image(mc, mx - ((m-3)*30), 105);
    image(mc, mx - ((m-2)*30), 105);
    image(mc, mx - ((m-1)*30), 105);
    image(mc, mx, 105);
  }

  if (m == 11) {
    image(mc, mx - ((m-10)*30), 105);   
    image(mc, mx - ((m-9)*30), 105);  
    image(mc, mx - ((m-8)*30), 105);  
    image(mc, mx - ((m-7)*30), 105);  
    image(mc, mx - ((m-6)*30), 105);   
    image(mc, mx - ((m-5)*30), 105);       
    image(mc, mx - ((m-4)*30), 105);
    image(mc, mx - ((m-3)*30), 105);
    image(mc, mx - ((m-2)*30), 105);
    image(mc, mx - ((m-1)*30), 105);
    image(mc, mx, 105);
  }

  if (m == 12 || m > 12) {
    image(mc, mx - ((m-11)*30), 105);  
    image(mc, mx - ((m-10)*30), 105);   
    image(mc, mx - ((m-9)*30), 105);  
    image(mc, mx - ((m-8)*30), 105);  
    image(mc, mx - ((m-7)*30), 105);  
    image(mc, mx - ((m-6)*30), 105);   
    image(mc, mx - ((m-5)*30), 105);       
    image(mc, mx - ((m-4)*30), 105);
    image(mc, mx - ((m-3)*30), 105);
    image(mc, mx - ((m-2)*30), 105);
    image(mc, mx - ((m-1)*30), 105);
    image(mc, 470, 105);
  }

  if (m == 13) {
    image(mc, mx, 135);
  }

  if (m == 14) {
    image(mc, mx - ((m-1)*30), 135);
    image(mc, mx, 135);
  }

  if (m == 15) {
    image(mc, mx - ((m-2)*30), 135);
    image(mc, mx - ((m-1)*30), 135);
    image(mc, mx, 135);
  }

  if (m == 16) {
    image(mc, mx - ((m-3)*30), 135);
    image(mc, mx - ((m-2)*30), 135);
    image(mc, mx - ((m-1)*30), 135);
    image(mc, mx, 135);
  }

  if (m == 17) {
    image(mc, mx - ((m-4)*30), 135);
    image(mc, mx - ((m-3)*30), 135);
    image(mc, mx - ((m-2)*30), 135);
    image(mc, mx - ((m-1)*30), 135);
    image(mc, mx, 135);
  }

  if (m == 18) {
    image(mc, mx - ((m-5)*30), 135);       
    image(mc, mx - ((m-4)*30), 135);
    image(mc, mx - ((m-3)*30), 135);
    image(mc, mx - ((m-2)*30), 135);
    image(mc, mx - ((m-1)*30), 135);
    image(mc, mx, 135);
  }

  if (m == 19) {
    image(mc, mx - ((m-6)*30), 135);   
    image(mc, mx - ((m-5)*30), 135);       
    image(mc, mx - ((m-4)*30), 135);
    image(mc, mx - ((m-3)*30), 135);
    image(mc, mx - ((m-2)*30), 135);
    image(mc, mx - ((m-1)*30), 135);
    image(mc, mx, 135);
  }

  if (m == 20) {   
    image(mc, mx - ((m-7)*30), 135);  
    image(mc, mx - ((m-6)*30), 135);   
    image(mc, mx - ((m-5)*30), 135);       
    image(mc, mx - ((m-4)*30), 135);
    image(mc, mx - ((m-3)*30), 135);
    image(mc, mx - ((m-2)*30), 135);
    image(mc, mx - ((m-1)*30), 135);
    image(mc, mx, 135);
  }

  if (m == 21) {  
    image(mc, mx - ((m-8)*30), 135);  
    image(mc, mx - ((m-7)*30), 135);  
    image(mc, mx - ((m-6)*30), 135);   
    image(mc, mx - ((m-5)*30), 135);       
    image(mc, mx - ((m-4)*30), 135);
    image(mc, mx - ((m-3)*30), 135);
    image(mc, mx - ((m-2)*30), 135);
    image(mc, mx - ((m-1)*30), 135);
    image(mc, mx, 135);
  }

  if (m == 22) {  
    image(mc, mx - ((m-9)*30), 135);  
    image(mc, mx - ((m-8)*30), 135);  
    image(mc, mx - ((m-7)*30), 135);  
    image(mc, mx - ((m-6)*30), 135);   
    image(mc, mx - ((m-5)*30), 135);       
    image(mc, mx - ((m-4)*30), 135);
    image(mc, mx - ((m-3)*30), 135);
    image(mc, mx - ((m-2)*30), 135);
    image(mc, mx - ((m-1)*30), 135);
    image(mc, mx, 135);
  }

  if (m == 23) {
    image(mc, mx - ((m-10)*30), 135);   
    image(mc, mx - ((m-9)*30), 135);  
    image(mc, mx - ((m-8)*30), 135);  
    image(mc, mx - ((m-7)*30), 135);  
    image(mc, mx - ((m-6)*30), 135);   
    image(mc, mx - ((m-5)*30), 135);       
    image(mc, mx - ((m-4)*30), 135);
    image(mc, mx - ((m-3)*30), 135);
    image(mc, mx - ((m-2)*30), 135);
    image(mc, mx - ((m-1)*30), 135);
    image(mc, mx, 135);
  }

  if (m == 24 || m > 24) {
    image(mc, mx - ((m-11)*30), 135);  
    image(mc, mx - ((m-10)*30), 135);   
    image(mc, mx - ((m-9)*30), 135);  
    image(mc, mx - ((m-8)*30), 135);  
    image(mc, mx - ((m-7)*30), 135);  
    image(mc, mx - ((m-6)*30), 135);   
    image(mc, mx - ((m-5)*30), 135);       
    image(mc, mx - ((m-4)*30), 135);
    image(mc, mx - ((m-3)*30), 135);
    image(mc, mx - ((m-2)*30), 135);
    image(mc, mx - ((m-1)*30), 135);
    image(mc, 470, 135);
  }


  if (m == 25) {
    image(mc, mx, 165);
  }

  if (m == 26) {
    image(mc, mx - ((m-1)*30), 165);
    image(mc, mx, 165);
  }

  if (m == 27) {
    image(mc, mx - ((m-2)*30), 165);
    image(mc, mx - ((m-1)*30), 165);
    image(mc, mx, 165);
  }

  if (m == 28) {
    image(mc, mx - ((m-3)*30), 165);
    image(mc, mx - ((m-2)*30), 165);
    image(mc, mx - ((m-1)*30), 165);
    image(mc, mx, 165);
  }

  if (m == 29) {
    image(mc, mx - ((m-4)*30), 165);
    image(mc, mx - ((m-3)*30), 165);
    image(mc, mx - ((m-2)*30), 165);
    image(mc, mx - ((m-1)*30), 165);
    image(mc, mx, 165);
  }

  if (m == 30) {
    image(mc, mx - ((m-5)*30), 165);       
    image(mc, mx - ((m-4)*30), 165);
    image(mc, mx - ((m-3)*30), 165);
    image(mc, mx - ((m-2)*30), 165);
    image(mc, mx - ((m-1)*30), 165);
    image(mc, mx, 165);
  }

  if (m == 31) {
    image(mc, mx - ((m-6)*30), 165);   
    image(mc, mx - ((m-5)*30), 165);       
    image(mc, mx - ((m-4)*30), 165);
    image(mc, mx - ((m-3)*30), 165);
    image(mc, mx - ((m-2)*30), 165);
    image(mc, mx - ((m-1)*30), 165);
    image(mc, mx, 165);
  }

  if (m == 32) {   
    image(mc, mx - ((m-7)*30), 165);  
    image(mc, mx - ((m-6)*30), 165);   
    image(mc, mx - ((m-5)*30), 165);       
    image(mc, mx - ((m-4)*30), 165);
    image(mc, mx - ((m-3)*30), 165);
    image(mc, mx - ((m-2)*30), 165);
    image(mc, mx - ((m-1)*30), 165);
    image(mc, mx, 165);
  }

  if (m == 33) {  
    image(mc, mx - ((m-8)*30), 165);  
    image(mc, mx - ((m-7)*30), 165);  
    image(mc, mx - ((m-6)*30), 165);   
    image(mc, mx - ((m-5)*30), 165);       
    image(mc, mx - ((m-4)*30), 165);
    image(mc, mx - ((m-3)*30), 165);
    image(mc, mx - ((m-2)*30), 165);
    image(mc, mx - ((m-1)*30), 165);
    image(mc, mx, 165);
  }

  if (m == 34) {  
    image(mc, mx - ((m-9)*30), 165);  
    image(mc, mx - ((m-8)*30), 165);  
    image(mc, mx - ((m-7)*30), 165);  
    image(mc, mx - ((m-6)*30), 165);   
    image(mc, mx - ((m-5)*30), 165);       
    image(mc, mx - ((m-4)*30), 165);
    image(mc, mx - ((m-3)*30), 165);
    image(mc, mx - ((m-2)*30), 165);
    image(mc, mx - ((m-1)*30), 165);
    image(mc, mx, 165);
  }

  if (m == 35) {
    image(mc, mx - ((m-10)*30), 165);   
    image(mc, mx - ((m-9)*30), 165);  
    image(mc, mx - ((m-8)*30), 165);  
    image(mc, mx - ((m-7)*30), 165);  
    image(mc, mx - ((m-6)*30), 165);   
    image(mc, mx - ((m-5)*30), 165);       
    image(mc, mx - ((m-4)*30), 165);
    image(mc, mx - ((m-3)*30), 165);
    image(mc, mx - ((m-2)*30), 165);
    image(mc, mx - ((m-1)*30), 165);
    image(mc, mx, 165);
  }

  if (m == 36 || m > 36) {
    image(mc, mx - ((m-11)*30), 165);  
    image(mc, mx - ((m-10)*30), 165);   
    image(mc, mx - ((m-9)*30), 165);  
    image(mc, mx - ((m-8)*30), 165);  
    image(mc, mx - ((m-7)*30), 165);  
    image(mc, mx - ((m-6)*30), 165);   
    image(mc, mx - ((m-5)*30), 165);       
    image(mc, mx - ((m-4)*30), 165);
    image(mc, mx - ((m-3)*30), 165);
    image(mc, mx - ((m-2)*30), 165);
    image(mc, mx - ((m-1)*30), 165);
    image(mc, 470, 165);
  }


  if (m == 37) {
    image(mc, mx, 195);
  }

  if (m == 38) {
    image(mc, mx - ((m-1)*30), 195);
    image(mc, mx, 195);
  }

  if (m == 39) {
    image(mc, mx - ((m-2)*30), 195);
    image(mc, mx - ((m-1)*30), 195);
    image(mc, mx, 195);
  }

  if (m == 40) {
    image(mc, mx - ((m-3)*30), 195);
    image(mc, mx - ((m-2)*30), 195);
    image(mc, mx - ((m-1)*30), 195);
    image(mc, mx, 195);
  }

  if (m == 41) {
    image(mc, mx - ((m-4)*30), 195);
    image(mc, mx - ((m-3)*30), 195);
    image(mc, mx - ((m-2)*30), 195);
    image(mc, mx - ((m-1)*30), 195);
    image(mc, mx, 195);
  }

  if (m == 42) {
    image(mc, mx - ((m-5)*30), 195);       
    image(mc, mx - ((m-4)*30), 195);
    image(mc, mx - ((m-3)*30), 195);
    image(mc, mx - ((m-2)*30), 195);
    image(mc, mx - ((m-1)*30), 195);
    image(mc, mx, 195);
  }

  if (m == 43) {
    image(mc, mx - ((m-6)*30), 195);   
    image(mc, mx - ((m-5)*30), 195);       
    image(mc, mx - ((m-4)*30), 195);
    image(mc, mx - ((m-3)*30), 195);
    image(mc, mx - ((m-2)*30), 195);
    image(mc, mx - ((m-1)*30), 195);
    image(mc, mx, 195);
  }

  if (m == 44) {   
    image(mc, mx - ((m-7)*30), 195);  
    image(mc, mx - ((m-6)*30), 195);   
    image(mc, mx - ((m-5)*30), 195);       
    image(mc, mx - ((m-4)*30), 195);
    image(mc, mx - ((m-3)*30), 195);
    image(mc, mx - ((m-2)*30), 195);
    image(mc, mx - ((m-1)*30), 195);
    image(mc, mx, 195);
  }

  if (m == 45) {  
    image(mc, mx - ((m-8)*30), 195);  
    image(mc, mx - ((m-7)*30), 195);  
    image(mc, mx - ((m-6)*30), 195);   
    image(mc, mx - ((m-5)*30), 195);       
    image(mc, mx - ((m-4)*30), 195);
    image(mc, mx - ((m-3)*30), 195);
    image(mc, mx - ((m-2)*30), 195);
    image(mc, mx - ((m-1)*30), 195);
    image(mc, mx, 195);
  }

  if (m == 46) {  
    image(mc, mx - ((m-9)*30), 195);  
    image(mc, mx - ((m-8)*30), 195);  
    image(mc, mx - ((m-7)*30), 195);  
    image(mc, mx - ((m-6)*30), 195);   
    image(mc, mx - ((m-5)*30), 195);       
    image(mc, mx - ((m-4)*30), 195);
    image(mc, mx - ((m-3)*30), 195);
    image(mc, mx - ((m-2)*30), 195);
    image(mc, mx - ((m-1)*30), 195);
    image(mc, mx, 195);
  }

  if (m == 47) {
    image(mc, mx - ((m-10)*30), 195);   
    image(mc, mx - ((m-9)*30), 195);  
    image(mc, mx - ((m-8)*30), 195);  
    image(mc, mx - ((m-7)*30), 195);  
    image(mc, mx - ((m-6)*30), 195);   
    image(mc, mx - ((m-5)*30), 195);       
    image(mc, mx - ((m-4)*30), 195);
    image(mc, mx - ((m-3)*30), 195);
    image(mc, mx - ((m-2)*30), 195);
    image(mc, mx - ((m-1)*30), 195);
    image(mc, mx, 195);
  }

  if (m == 48 || m > 48) {
    image(mc, mx - ((m-11)*30), 195);  
    image(mc, mx - ((m-10)*30), 195);   
    image(mc, mx - ((m-9)*30), 195);  
    image(mc, mx - ((m-8)*30), 195);  
    image(mc, mx - ((m-7)*30), 195);  
    image(mc, mx - ((m-6)*30), 195);   
    image(mc, mx - ((m-5)*30), 195);       
    image(mc, mx - ((m-4)*30), 195);
    image(mc, mx - ((m-3)*30), 195);
    image(mc, mx - ((m-2)*30), 195);
    image(mc, mx - ((m-1)*30), 195);
    image(mc, 470, 195);
  }


  if (m == 49) {
    image(mc, mx, 225);
  }

  if (m == 50) {
    image(mc, mx - ((m-1)*30), 225);
    image(mc, mx, 225);
  }

  if (m == 51) {
    image(mc, mx - ((m-2)*30), 225);
    image(mc, mx - ((m-1)*30), 225);
    image(mc, mx, 225);
  }

  if (m == 52) {
    image(mc, mx - ((m-3)*30), 225);
    image(mc, mx - ((m-2)*30), 225);
    image(mc, mx - ((m-1)*30), 225);
    image(mc, mx, 225);
  }

  if (m == 53) {
    image(mc, mx - ((m-4)*30), 225);
    image(mc, mx - ((m-3)*30), 225);
    image(mc, mx - ((m-2)*30), 225);
    image(mc, mx - ((m-1)*30), 225);
    image(mc, mx, 225);
  }

  if (m == 54) {
    image(mc, mx - ((m-5)*30), 225);       
    image(mc, mx - ((m-4)*30), 225);
    image(mc, mx - ((m-3)*30), 225);
    image(mc, mx - ((m-2)*30), 225);
    image(mc, mx - ((m-1)*30), 225);
    image(mc, mx, 225);
  }

  if (m == 55) {
    image(mc, mx - ((m-6)*30), 225);   
    image(mc, mx - ((m-5)*30), 225);       
    image(mc, mx - ((m-4)*30), 225);
    image(mc, mx - ((m-3)*30), 225);
    image(mc, mx - ((m-2)*30), 225);
    image(mc, mx - ((m-1)*30), 225);
    image(mc, mx, 225);
  }

  if (m == 56) {   
    image(mc, mx - ((m-7)*30), 225);  
    image(mc, mx - ((m-6)*30), 225);   
    image(mc, mx - ((m-5)*30), 225);       
    image(mc, mx - ((m-4)*30), 225);
    image(mc, mx - ((m-3)*30), 225);
    image(mc, mx - ((m-2)*30), 225);
    image(mc, mx - ((m-1)*30), 225);
    image(mc, mx, 225);
  }

  if (m == 57) {  
    image(mc, mx - ((m-8)*30), 225);  
    image(mc, mx - ((m-7)*30), 225);  
    image(mc, mx - ((m-6)*30), 225);   
    image(mc, mx - ((m-5)*30), 225);       
    image(mc, mx - ((m-4)*30), 225);
    image(mc, mx - ((m-3)*30), 225);
    image(mc, mx - ((m-2)*30), 225);
    image(mc, mx - ((m-1)*30), 225);
    image(mc, mx, 225);
  }

  if (m == 58) {  
    image(mc, mx - ((m-9)*30), 225);  
    image(mc, mx - ((m-8)*30), 225);  
    image(mc, mx - ((m-7)*30), 225);  
    image(mc, mx - ((m-6)*30), 225);   
    image(mc, mx - ((m-5)*30), 225);       
    image(mc, mx - ((m-4)*30), 225);
    image(mc, mx - ((m-3)*30), 225);
    image(mc, mx - ((m-2)*30), 225);
    image(mc, mx - ((m-1)*30), 225);
    image(mc, mx, 225);
  }

  if (m == 59) {
    image(mc, mx - ((m-10)*30), 225);   
    image(mc, mx - ((m-9)*30), 225);  
    image(mc, mx - ((m-8)*30), 225);  
    image(mc, mx - ((m-7)*30), 225);  
    image(mc, mx - ((m-6)*30), 225);   
    image(mc, mx - ((m-5)*30), 225);       
    image(mc, mx - ((m-4)*30), 225);
    image(mc, mx - ((m-3)*30), 225);
    image(mc, mx - ((m-2)*30), 225);
    image(mc, mx - ((m-1)*30), 225);
    image(mc, mx, 225);
  }

  if (m == 60) {
    image(mc, mx - ((m-11)*30), 225);  
    image(mc, mx - ((m-10)*30), 225);   
    image(mc, mx - ((m-9)*30), 225);  
    image(mc, mx - ((m-8)*30), 225);  
    image(mc, mx - ((m-7)*30), 225);  
    image(mc, mx - ((m-6)*30), 225);   
    image(mc, mx - ((m-5)*30), 225);       
    image(mc, mx - ((m-4)*30), 225);
    image(mc, mx - ((m-3)*30), 225);
    image(mc, mx - ((m-2)*30), 225);
    image(mc, mx - ((m-1)*30), 225);
    image(mc, 470, 225);
  }





  // second squares
  ss = loadImage ("secondsquare.png");
  float s = second();
  sx = (110 + (30*s));

  if (s == 1) {
    image(ss, sx, 255);
  }

  if (s == 2) {
    image(ss, sx - ((s-1)*30), 255);
    image(ss, sx, 255);
  }

  if (s == 3) {
    image(ss, sx - ((s-2)*30), 255);
    image(ss, sx - ((s-1)*30), 255);
    image(ss, sx, 255);
  }

  if (s == 4) {
    image(ss, sx - ((s-3)*30), 255);
    image(ss, sx - ((s-2)*30), 255);
    image(ss, sx - ((s-1)*30), 255);
    image(ss, sx, 255);
  }

  if (s == 5) {
    image(ss, sx - ((s-4)*30), 255);
    image(ss, sx - ((s-3)*30), 255);
    image(ss, sx - ((s-2)*30), 255);
    image(ss, sx - ((s-1)*30), 255);
    image(ss, sx, 255);
  }

  if (s == 6) {
    image(ss, sx - ((s-5)*30), 255);       
    image(ss, sx - ((s-4)*30), 255);
    image(ss, sx - ((s-3)*30), 255);
    image(ss, sx - ((s-2)*30), 255);
    image(ss, sx - ((s-1)*30), 255);
    image(ss, sx, 255);
  }

  if (s == 7) {
    image(ss, sx - ((s-6)*30), 255);   
    image(ss, sx - ((s-5)*30), 255);       
    image(ss, sx - ((s-4)*30), 255);
    image(ss, sx - ((s-3)*30), 255);
    image(ss, sx - ((s-2)*30), 255);
    image(ss, sx - ((s-1)*30), 255);
    image(ss, sx, 255);
  }

  if (s == 8) {   
    image(ss, sx - ((s-7)*30), 255);  
    image(ss, sx - ((s-6)*30), 255);   
    image(ss, sx - ((s-5)*30), 255);       
    image(ss, sx - ((s-4)*30), 255);
    image(ss, sx - ((s-3)*30), 255);
    image(ss, sx - ((s-2)*30), 255);
    image(ss, sx - ((s-1)*30), 255);
    image(ss, sx, 255);
  }

  if (s == 9) {  
    image(ss, sx - ((s-8)*30), 255);  
    image(ss, sx - ((s-7)*30), 255);  
    image(ss, sx - ((s-6)*30), 255);   
    image(ss, sx - ((s-5)*30), 255);       
    image(ss, sx - ((s-4)*30), 255);
    image(ss, sx - ((s-3)*30), 255);
    image(ss, sx - ((s-2)*30), 255);
    image(ss, sx - ((s-1)*30), 255);
    image(ss, sx, 255);
  }

  if (s == 10) {  
    image(ss, sx - ((s-9)*30), 255);  
    image(ss, sx - ((s-8)*30), 255);  
    image(ss, sx - ((s-7)*30), 255);  
    image(ss, sx - ((s-6)*30), 255);   
    image(ss, sx - ((s-5)*30), 255);       
    image(ss, sx - ((s-4)*30), 255);
    image(ss, sx - ((s-3)*30), 255);
    image(ss, sx - ((s-2)*30), 255);
    image(ss, sx - ((s-1)*30), 255);
    image(ss, sx, 255);
  }

  if (s == 11) {
    image(ss, sx - ((s-10)*30), 255);   
    image(ss, sx - ((s-9)*30), 255);  
    image(ss, sx - ((s-8)*30), 255);  
    image(ss, sx - ((s-7)*30), 255);  
    image(ss, sx - ((s-6)*30), 255);   
    image(ss, sx - ((s-5)*30), 255);       
    image(ss, sx - ((s-4)*30), 255);
    image(ss, sx - ((s-3)*30), 255);
    image(ss, sx - ((s-2)*30), 255);
    image(ss, sx - ((s-1)*30), 255);
    image(ss, sx, 255);
  }

  if (s == 12 || s > 12) {
    image(ss, sx - ((s-11)*30), 255);  
    image(ss, sx - ((s-10)*30), 255);   
    image(ss, sx - ((s-9)*30), 255);  
    image(ss, sx - ((s-8)*30), 255);  
    image(ss, sx - ((s-7)*30), 255);  
    image(ss, sx - ((s-6)*30), 255);   
    image(ss, sx - ((s-5)*30), 255);       
    image(ss, sx - ((s-4)*30), 255);
    image(ss, sx - ((s-3)*30), 255);
    image(ss, sx - ((s-2)*30), 255);
    image(ss, sx - ((s-1)*30), 255);
    image(ss, 470, 255);
  }

  if (s == 13) {
    image(ss, sx, 285);
  }

  if (s == 14) {
    image(ss, sx - ((s-1)*30), 285);
    image(ss, sx, 285);
  }

  if (s == 15) {
    image(ss, sx - ((s-2)*30), 285);
    image(ss, sx - ((s-1)*30), 285);
    image(ss, sx, 285);
  }

  if (s == 16) {
    image(ss, sx - ((s-3)*30), 285);
    image(ss, sx - ((s-2)*30), 285);
    image(ss, sx - ((s-1)*30), 285);
    image(ss, sx, 285);
  }

  if (s == 17) {
    image(ss, sx - ((s-4)*30), 285);
    image(ss, sx - ((s-3)*30), 285);
    image(ss, sx - ((s-2)*30), 285);
    image(ss, sx - ((s-1)*30), 285);
    image(ss, sx, 285);
  }

  if (s == 18) {
    image(ss, sx - ((s-5)*30), 285);       
    image(ss, sx - ((s-4)*30), 285);
    image(ss, sx - ((s-3)*30), 285);
    image(ss, sx - ((s-2)*30), 285);
    image(ss, sx - ((s-1)*30), 285);
    image(ss, sx, 285);
  }

  if (s == 19) {
    image(ss, sx - ((s-6)*30), 285);   
    image(ss, sx - ((s-5)*30), 285);       
    image(ss, sx - ((s-4)*30), 285);
    image(ss, sx - ((s-3)*30), 285);
    image(ss, sx - ((s-2)*30), 285);
    image(ss, sx - ((s-1)*30), 285);
    image(ss, sx, 285);
  }

  if (s == 20) {   
    image(ss, sx - ((s-7)*30), 285);  
    image(ss, sx - ((s-6)*30), 285);   
    image(ss, sx - ((s-5)*30), 285);       
    image(ss, sx - ((s-4)*30), 285);
    image(ss, sx - ((s-3)*30), 285);
    image(ss, sx - ((s-2)*30), 285);
    image(ss, sx - ((s-1)*30), 285);
    image(ss, sx, 285);
  }

  if (s == 21) {  
    image(ss, sx - ((s-8)*30), 285);  
    image(ss, sx - ((s-7)*30), 285);  
    image(ss, sx - ((s-6)*30), 285);   
    image(ss, sx - ((s-5)*30), 285);       
    image(ss, sx - ((s-4)*30), 285);
    image(ss, sx - ((s-3)*30), 285);
    image(ss, sx - ((s-2)*30), 285);
    image(ss, sx - ((s-1)*30), 285);
    image(ss, sx, 285);
  }

  if (s == 22) {  
    image(ss, sx - ((s-9)*30), 285);  
    image(ss, sx - ((s-8)*30), 285);  
    image(ss, sx - ((s-7)*30), 285);  
    image(ss, sx - ((s-6)*30), 285);   
    image(ss, sx - ((s-5)*30), 285);       
    image(ss, sx - ((s-4)*30), 285);
    image(ss, sx - ((s-3)*30), 285);
    image(ss, sx - ((s-2)*30), 285);
    image(ss, sx - ((s-1)*30), 285);
    image(ss, sx, 285);
  }

  if (s == 23) {
    image(ss, sx - ((s-10)*30), 285);   
    image(ss, sx - ((s-9)*30), 285);  
    image(ss, sx - ((s-8)*30), 285);  
    image(ss, sx - ((s-7)*30), 285);  
    image(ss, sx - ((s-6)*30), 285);   
    image(ss, sx - ((s-5)*30), 285);       
    image(ss, sx - ((s-4)*30), 285);
    image(ss, sx - ((s-3)*30), 285);
    image(ss, sx - ((s-2)*30), 285);
    image(ss, sx - ((s-1)*30), 285);
    image(ss, sx, 285);
  }

  if (s == 24 || s > 24) {
    image(ss, sx - ((s-11)*30), 285);  
    image(ss, sx - ((s-10)*30), 285);   
    image(ss, sx - ((s-9)*30), 285);  
    image(ss, sx - ((s-8)*30), 285);  
    image(ss, sx - ((s-7)*30), 285);  
    image(ss, sx - ((s-6)*30), 285);   
    image(ss, sx - ((s-5)*30), 285);       
    image(ss, sx - ((s-4)*30), 285);
    image(ss, sx - ((s-3)*30), 285);
    image(ss, sx - ((s-2)*30), 285);
    image(ss, sx - ((s-1)*30), 285);
    image(ss, 470, 285);
  }


  if (s == 25) {
    image(ss, sx, 315);
  }

  if (s == 26) {
    image(ss, sx - ((s-1)*30), 315);
    image(ss, sx, 315);
  }

  if (s == 27) {
    image(ss, sx - ((s-2)*30), 315);
    image(ss, sx - ((s-1)*30), 315);
    image(ss, sx, 315);
  }

  if (s == 28) {
    image(ss, sx - ((s-3)*30), 315);
    image(ss, sx - ((s-2)*30), 315);
    image(ss, sx - ((s-1)*30), 315);
    image(ss, sx, 315);
  }

  if (s == 29) {
    image(ss, sx - ((s-4)*30), 315);
    image(ss, sx - ((s-3)*30), 315);
    image(ss, sx - ((s-2)*30), 315);
    image(ss, sx - ((s-1)*30), 315);
    image(ss, sx, 315);
  }

  if (s == 30) {
    image(ss, sx - ((s-5)*30), 315);       
    image(ss, sx - ((s-4)*30), 315);
    image(ss, sx - ((s-3)*30), 315);
    image(ss, sx - ((s-2)*30), 315);
    image(ss, sx - ((s-1)*30), 315);
    image(ss, sx, 315);
  }

  if (s == 31) {
    image(ss, sx - ((s-6)*30), 315);   
    image(ss, sx - ((s-5)*30), 315);       
    image(ss, sx - ((s-4)*30), 315);
    image(ss, sx - ((s-3)*30), 315);
    image(ss, sx - ((s-2)*30), 315);
    image(ss, sx - ((s-1)*30), 315);
    image(ss, sx, 315);
  }

  if (s == 32) {   
    image(ss, sx - ((s-7)*30), 315);  
    image(ss, sx - ((s-6)*30), 315);   
    image(ss, sx - ((s-5)*30), 315);       
    image(ss, sx - ((s-4)*30), 315);
    image(ss, sx - ((s-3)*30), 315);
    image(ss, sx - ((s-2)*30), 315);
    image(ss, sx - ((s-1)*30), 315);
    image(ss, sx, 315);
  }

  if (s == 33) {  
    image(ss, sx - ((s-8)*30), 315);  
    image(ss, sx - ((s-7)*30), 315);  
    image(ss, sx - ((s-6)*30), 315);   
    image(ss, sx - ((s-5)*30), 315);       
    image(ss, sx - ((s-4)*30), 315);
    image(ss, sx - ((s-3)*30), 315);
    image(ss, sx - ((s-2)*30), 315);
    image(ss, sx - ((s-1)*30), 315);
    image(ss, sx, 315);
  }

  if (s == 34) {  
    image(ss, sx - ((s-9)*30), 315);  
    image(ss, sx - ((s-8)*30), 315);  
    image(ss, sx - ((s-7)*30), 315);  
    image(ss, sx - ((s-6)*30), 315);   
    image(ss, sx - ((s-5)*30), 315);       
    image(ss, sx - ((s-4)*30), 315);
    image(ss, sx - ((s-3)*30), 315);
    image(ss, sx - ((s-2)*30), 315);
    image(ss, sx - ((s-1)*30), 315);
    image(ss, sx, 315);
  }

  if (s == 35) {
    image(ss, sx - ((s-10)*30), 315);   
    image(ss, sx - ((s-9)*30), 315);  
    image(ss, sx - ((s-8)*30), 315);  
    image(ss, sx - ((s-7)*30), 315);  
    image(ss, sx - ((s-6)*30), 315);   
    image(ss, sx - ((s-5)*30), 315);       
    image(ss, sx - ((s-4)*30), 315);
    image(ss, sx - ((s-3)*30), 315);
    image(ss, sx - ((s-2)*30), 315);
    image(ss, sx - ((s-1)*30), 315);
    image(ss, sx, 315);
  }

  if (s == 36 || s > 36) {
    image(ss, sx - ((s-11)*30), 315);  
    image(ss, sx - ((s-10)*30), 315);   
    image(ss, sx - ((s-9)*30), 315);  
    image(ss, sx - ((s-8)*30), 315);  
    image(ss, sx - ((s-7)*30), 315);  
    image(ss, sx - ((s-6)*30), 315);   
    image(ss, sx - ((s-5)*30), 315);       
    image(ss, sx - ((s-4)*30), 315);
    image(ss, sx - ((s-3)*30), 315);
    image(ss, sx - ((s-2)*30), 315);
    image(ss, sx - ((s-1)*30), 315);
    image(ss, 470, 315);
  }


  if (s == 37) {
    image(ss, sx, 345);
  }

  if (s == 38) {
    image(ss, sx - ((s-1)*30), 345);
    image(ss, sx, 345);
  }

  if (s == 39) {
    image(ss, sx - ((s-2)*30), 345);
    image(ss, sx - ((s-1)*30), 345);
    image(ss, sx, 345);
  }

  if (s == 40) {
    image(ss, sx - ((s-3)*30), 345);
    image(ss, sx - ((s-2)*30), 345);
    image(ss, sx - ((s-1)*30), 345);
    image(ss, sx, 345);
  }

  if (s == 41) {
    image(ss, sx - ((s-4)*30), 345);
    image(ss, sx - ((s-3)*30), 345);
    image(ss, sx - ((s-2)*30), 345);
    image(ss, sx - ((s-1)*30), 345);
    image(ss, sx, 345);
  }

  if (s == 42) {
    image(ss, sx - ((s-5)*30), 345);       
    image(ss, sx - ((s-4)*30), 345);
    image(ss, sx - ((s-3)*30), 345);
    image(ss, sx - ((s-2)*30), 345);
    image(ss, sx - ((s-1)*30), 345);
    image(ss, sx, 345);
  }

  if (s == 43) {
    image(ss, sx - ((s-6)*30), 345);   
    image(ss, sx - ((s-5)*30), 345);       
    image(ss, sx - ((s-4)*30), 345);
    image(ss, sx - ((s-3)*30), 345);
    image(ss, sx - ((s-2)*30), 345);
    image(ss, sx - ((s-1)*30), 345);
    image(ss, sx, 345);
  }

  if (s == 44) {   
    image(ss, sx - ((s-7)*30), 345);  
    image(ss, sx - ((s-6)*30), 345);   
    image(ss, sx - ((s-5)*30), 345);       
    image(ss, sx - ((s-4)*30), 345);
    image(ss, sx - ((s-3)*30), 345);
    image(ss, sx - ((s-2)*30), 345);
    image(ss, sx - ((s-1)*30), 345);
    image(ss, sx, 345);
  }

  if (s == 45) {  
    image(ss, sx - ((s-8)*30), 345);  
    image(ss, sx - ((s-7)*30), 345);  
    image(ss, sx - ((s-6)*30), 345);   
    image(ss, sx - ((s-5)*30), 345);       
    image(ss, sx - ((s-4)*30), 345);
    image(ss, sx - ((s-3)*30), 345);
    image(ss, sx - ((s-2)*30), 345);
    image(ss, sx - ((s-1)*30), 345);
    image(ss, sx, 345);
  }

  if (s == 46) {  
    image(ss, sx - ((s-9)*30), 345);  
    image(ss, sx - ((s-8)*30), 345);  
    image(ss, sx - ((s-7)*30), 345);  
    image(ss, sx - ((s-6)*30), 345);   
    image(ss, sx - ((s-5)*30), 345);       
    image(ss, sx - ((s-4)*30), 345);
    image(ss, sx - ((s-3)*30), 345);
    image(ss, sx - ((s-2)*30), 345);
    image(ss, sx - ((s-1)*30), 345);
    image(ss, sx, 345);
  }

  if (s == 47) {
    image(ss, sx - ((s-10)*30), 345);   
    image(ss, sx - ((s-9)*30), 345);  
    image(ss, sx - ((s-8)*30), 345);  
    image(ss, sx - ((s-7)*30), 345);  
    image(ss, sx - ((s-6)*30), 345);   
    image(ss, sx - ((s-5)*30), 345);       
    image(ss, sx - ((s-4)*30), 345);
    image(ss, sx - ((s-3)*30), 345);
    image(ss, sx - ((s-2)*30), 345);
    image(ss, sx - ((s-1)*30), 345);
    image(ss, sx, 345);
  }

  if (s == 48 || s > 48) {
    image(ss, sx - ((s-11)*30), 345);  
    image(ss, sx - ((s-10)*30), 345);   
    image(ss, sx - ((s-9)*30), 345);  
    image(ss, sx - ((s-8)*30), 345);  
    image(ss, sx - ((s-7)*30), 345);  
    image(ss, sx - ((s-6)*30), 345);   
    image(ss, sx - ((s-5)*30), 345);       
    image(ss, sx - ((s-4)*30), 345);
    image(ss, sx - ((s-3)*30), 345);
    image(ss, sx - ((s-2)*30), 345);
    image(ss, sx - ((s-1)*30), 345);
    image(ss, 470, 345);
  }


  if (s == 49) {
    image(ss, sx, 375);
  }

  if (s == 50) {
    image(ss, sx - ((s-1)*30), 375);
    image(ss, sx, 375);
  }

  if (s == 51) {
    image(ss, sx - ((s-2)*30), 375);
    image(ss, sx - ((s-1)*30), 375);
    image(ss, sx, 375);
  }

  if (s == 52) {
    image(ss, sx - ((s-3)*30), 375);
    image(ss, sx - ((s-2)*30), 375);
    image(ss, sx - ((s-1)*30), 375);
    image(ss, sx, 375);
  }

  if (s == 53) {
    image(ss, sx - ((s-4)*30), 375);
    image(ss, sx - ((s-3)*30), 375);
    image(ss, sx - ((s-2)*30), 375);
    image(ss, sx - ((s-1)*30), 375);
    image(ss, sx, 375);
  }

  if (s == 54) {
    image(ss, sx - ((s-5)*30), 375);       
    image(ss, sx - ((s-4)*30), 375);
    image(ss, sx - ((s-3)*30), 375);
    image(ss, sx - ((s-2)*30), 375);
    image(ss, sx - ((s-1)*30), 375);
    image(ss, sx, 375);
  }

  if (s == 55) {
    image(ss, sx - ((s-6)*30), 375);   
    image(ss, sx - ((s-5)*30), 375);       
    image(ss, sx - ((s-4)*30), 375);
    image(ss, sx - ((s-3)*30), 375);
    image(ss, sx - ((s-2)*30), 375);
    image(ss, sx - ((s-1)*30), 375);
    image(ss, sx, 375);
  }

  if (s == 56) {   
    image(ss, sx - ((s-7)*30), 375);  
    image(ss, sx - ((s-6)*30), 375);   
    image(ss, sx - ((s-5)*30), 375);       
    image(ss, sx - ((s-4)*30), 375);
    image(ss, sx - ((s-3)*30), 375);
    image(ss, sx - ((s-2)*30), 375);
    image(ss, sx - ((s-1)*30), 375);
    image(ss, sx, 375);
  }

  if (s == 57) {  
    image(ss, sx - ((s-8)*30), 375);  
    image(ss, sx - ((s-7)*30), 375);  
    image(ss, sx - ((s-6)*30), 375);   
    image(ss, sx - ((s-5)*30), 375);       
    image(ss, sx - ((s-4)*30), 375);
    image(ss, sx - ((s-3)*30), 375);
    image(ss, sx - ((s-2)*30), 375);
    image(ss, sx - ((s-1)*30), 375);
    image(ss, sx, 375);
  }

  if (s == 58) {  
    image(ss, sx - ((s-9)*30), 375);  
    image(ss, sx - ((s-8)*30), 375);  
    image(ss, sx - ((s-7)*30), 375);  
    image(ss, sx - ((s-6)*30), 375);   
    image(ss, sx - ((s-5)*30), 375);       
    image(ss, sx - ((s-4)*30), 375);
    image(ss, sx - ((s-3)*30), 375);
    image(ss, sx - ((s-2)*30), 375);
    image(ss, sx - ((s-1)*30), 375);
    image(ss, sx, 375);
  }

  if (s == 59) {

    image(ss, sx - ((s-10)*30), 375);   
    image(ss, sx - ((s-9)*30), 375);  
    image(ss, sx - ((s-8)*30), 375);  
    image(ss, sx - ((s-7)*30), 375);  
    image(ss, sx - ((s-6)*30), 375);   
    image(ss, sx - ((s-5)*30), 375);       
    image(ss, sx - ((s-4)*30), 375);
    image(ss, sx - ((s-3)*30), 375);
    image(ss, sx - ((s-2)*30), 375);
    image(ss, sx - ((s-1)*30), 375);
    image(ss, sx, 375);

    fill(255);
    noStroke();
    rect (140, 255, 360, 150);
  }

  if (s == 60) {
  }
  //    image(ss, sx - ((s-11)*30), 375);  
  //    image(ss, sx - ((s-10)*30), 375);   
  //    image(ss, sx - ((s-9)*30), 375);  
  //    image(ss, sx - ((s-8)*30), 375);  
  //    image(ss, sx - ((s-7)*30), 375);  
  //    image(ss, sx - ((s-6)*30), 375);   
  //    image(ss, sx - ((s-5)*30), 375);       
  //    image(ss, sx - ((s-4)*30), 375);
  //    image(ss, sx - ((s-3)*30), 375);
  //    image(ss, sx - ((s-2)*30), 375);
  //    image(ss, sx - ((s-1)*30), 375);
  //    image(ss, 470, 375);
}



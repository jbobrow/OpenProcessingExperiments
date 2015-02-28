
int x =20;
int y =20;

int m =40;
int n =20;

int dx = 20;
int dy = 20;

int dm = 10;
int dn = 30;


void setup() {  //setup function called initially, only once
  size(300, 400);
 
}

void draw() {  //draw function loops 
   background(0,0,0);
   fill(200,200,255);
   ellipse(x,y,20,20);
  
   if (x>300) {
       dx = -dx;
       
   }  
   if (y>400){
       dy = -dy;
   }
   if (x<0){
  
   dx = -dx;
   }
   if (y<0){
   dy = -dy;
   }
   y = y+dy
   x = x+dx
   
   if (mousePressed) {
     x = mouseX;
     y = mouseY;
   }
    fill(255,200,200);
   ellipse(m,n,20,20);
   if (m>300) {
       dm = -dm;
       
   }  
   if (n>400){
       dn = -dn;
   }
   if (m<0){
  
   dm = -dm;
   }
   if (n<0){
   dn = -dn;
   }
   n = n+dn
   m = m+dm
   
   if (mousePressed) {
     m = mouseX+20;
     n = mouseY;
   }
}

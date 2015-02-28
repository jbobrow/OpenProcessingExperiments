
//dana gloria
//21 September 2011
//Loop

void setup (){
  size(600,600);
  colorMode(HSB, 360,360,160,300);
  background (196,61,8);
  
}

void draw (){
  background(0);
  stroke(10);
  smooth ();
 
 for(int x = 0; x < width; x+=20){
   for(int y = 0; y < height; y +=10) {
     fill (random (10,255), random (100), random (126));
     
     if ((x % 600) == 0) {
       ellipse(x,y,x+100, y- 100);
     } else {
       fill (random ( 0,255), random (255), random (255));
       ellipse(x,y,10,10);
       line( x, y, x + 100, y +100);
       ellipse( x,y,10,10);
       strokeWeight (26);
       stroke (random(100,255), random (255),random (255)); }
       
   }
 }
}




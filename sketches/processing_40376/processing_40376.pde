
//By Alex Kong
//USE DA MOUSE

int p,x,y;

 void setup() {
   size(320,320);
   p = 20;
   y = 0;
   x = 0;
   noStroke();
   smooth();
 }

 void draw() 
 {
   background(0);
   for(int y=0; y<height; y+=p) {
     for(int x=160; x<width; x+=p) {
       fill(random(0,100),random(100,250),random(100));
       rotate(20);
       noStroke();
       //rect(320,160,p,p);
       ellipse(mouseX,mouseY,p-10,p-10);
            for(int l=315; l<height; l+=p) {
      for(int k=0; k<width; k+=p) {
        fill(random(0,50),random(100,200),random(100),30);
        noStroke();
        rotate(100);
        rect(l,k,p,p);
        ellipse(1-315,k,p,p);
     }
   }
     }
   }
   if(x<320)
 {
   x=0;
 }
   if(y<320)
   {
     y=0;
   }
   if (mousePressed == true)
   {
   for(int o=160; o<height; o+=p) {
     for(int i=0; i<width; i+=p) {
       fill(random(0,100),random(100,250),random(90,255),90);
       rotate(10);
       stroke(0,255,255,30);
       line(mouseX-10,mouseY-10,p,p);
       rect(mouseX,mouseY,p,p);
       fill(255,255,0);
     }
   }
 }
      }


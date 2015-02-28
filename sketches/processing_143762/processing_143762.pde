

void setup(){
  size(300,300);
}

void draw(){

//testing stuff

int x = 150;
  
//background
background(255);
fill(255,0,0); //red
rect(0,0,x,x);
fill(0,255,0); //green
rect(0,x,x,x);
fill(0,0,255); //blue
rect(x,x,x,x);
//==============================
fill(232,23,23); //red
rect(x,0,x/2,x/2);
fill(23,232,23); //green
rect(x,x/2,x/2,x/2);
fill(23,23,232); //blue
rect(225,x/2,x/2,x/2);
//==============================
fill(206,42,42); //red
rect(x+(x/2),0,x/4,x/4);
fill(42,206,42); //green
rect(x+(x/2),x/4,x/4,x/4);
fill(42,42,206); //blue
rect(x+(x/2)+(x/4),x/4,x/4,x/4);
//==============================
fill(185,54,54); //red
rect(x+(x/2)+(x/4),0,x/8,x/8);
fill(54,185,54); //green
rect(x+(x/2)+(x/4),x/8,x/8,x/8);
fill(54,54,185); //blue
rect(x+(x/2)+(x/4)+(x/8),x/8,(x/8)+1,x/8);
//==============================
fill(157,65,65); //red
rect(x+(x/2)+(x/4)+(x/8),0,x/16,x/16);
fill(65,157,65); //green
rect(x+(x/2)+(x/4)+(x/8),x/16,x/16,x/16);
fill(65,65,157); //blue
rect(x+(x/2)+(x/4)+(x/8)+(x/16),x/16,(x/16)+1,x/16);
//==============================
fill(118,69,69); //red
rect(x+(x/2)+(x/4)+(x/8)+(x/16),0,(x/32)+1,x/32);
fill(69,118,69); //green
rect(x+(x/2)+(x/4)+(x/8)+(x/16),x/32,(x/32)+1,x/32);
fill(69,69,118); //blue
rect(x+(x/2)+(x/4)+(x/8)+(x/16)+(x/32)+1,x/32,(x/32)+1,x/32);
//==============================
fill(85,58,58); //red
rect(x+(x/2)+(x/4)+(x/8)+(x/16)+(x/32)+1,0,(x/64)+1,x/64);
fill(58,85,58); //green
rect(x+(x/2)+(x/4)+(x/8)+(x/16)+(x/32)+1,x/64,(x/64)+1,x/64);
fill(58,58,85); //blue
rect(x+(x/2)+(x/4)+(x/8)+(x/16)+(x/32)+2+(x/64),x/64,(x/64)+1,x/64);

fill(255,50);
ellipse(x/2,x/2,x/2,x/2);
fill(255,100);
triangle(x,x,x+50,x+20,x+20,x+50);
triangle(2*x,2*x,2*x-50,2*x-20,2*x-20,2*x-50);
triangle(2*x,x,2*x-50,x+20,2*x-20,x+50);
triangle(x,2*x,x+50,2*x-20,x+20,2*x-50);
line(x+50,x+20,2*x-50,2*x-20);
line(x+20,x+50,2*x-20,2*x-50);
line(2*x-50,x+20,x+50,2*x-20);
line(x+20,2*x-50,2*x-20,x+50);
float a = random(20);
float b = random(303);
float c = random(50);
float d = random(220);

fill(138,240,186,150);
bezier(34,256,a,b,c,d,100,194);


//junk

//fill(255,0,0); //red
//ellipse(10,10,10,10); //top left 
//fill(0,0,255); //blue
//ellipse(290,290,10,10); //bottom right 
//fill(0,255,0); //green
//ellipse(290,10,10,10); //top right 
//fill(255,0,255); //purple
//ellipse(10,290,10,10); //bottom left 


}





float x = 380;   // x location of square
float y = 300;     // y location of square
float p= 50;
float speed = 0;
float gravity = 0.1; 
float mio = 300;

void setup() {
size (800,600);

//frameRate (30);
}

void draw () {
 // frameRate (5);
  background (128,128,0);


strokeWeight (20);
line (200,310,100,350);
line (150,410,98,350);
strokeWeight (1);  
ellipse (260,300,60,60);
rect (200,400,20,200);
fill (255);
rect (300,400,20,200);
fill (0);
rect (200,400,120,40);
fill (200,0,0);
rect (200,300,120,100);
fill (200,100,0);
ellipse(x,y++,p,p);
strokeWeight (20);
line (x,mio,310,300);
y = y + speed;
p=p-0.05;
 speed = speed + gravity;
 if (y > height ) {
    speed = speed * -0.95;  
    
   // mio = mio-50;
  }
  if (mio > 500) {
    speed = speed * -0.95;  
   // mio = mio-50;
  
  }
    mio = mio + speed;
 for (int r= 10; r<800; r=r+50){
 for ( int t= 10; t<250; t=t+30){
  
 strokeWeight (1);
 fill (100,80,r/2);
 ellipse (r,t,50,50);//cabeza
 fill (random (0,255));
 ellipse (r,t+5,20,20);//boca
 fill (255);
 ellipse (r-10,t-10,10,10);
 ellipse (r+10,t-10,10,10);//ojo izq
 //rect (200,200,200,200);
  }
 }
 }

//rotate (2);





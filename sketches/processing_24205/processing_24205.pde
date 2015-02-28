

void setup () {
  size (400, 400);
  smooth ();
  }

void draw(){
  println(mousePressed);
  
//background 
for (int r = 380; r>=15 ; r-=30){
noStroke();
fill(255,255,255, 30);
ellipse (200, 200, r, r);

int x=200;
int y=200;

fill(70);
stroke(0); 
ellipse(200,260, 200/2, 200);  
ellipse(200, 200, 200,200/2);


//mouth 
stroke (255,0,0);
strokeWeight(4);
arc(200, 200, 90, 90, PI/32, PI);
arc(200, 200, 80, 85, PI/32, PI);
  
//necks
strokeWeight(3);
line (110, 160, 140, 200);
line (200, 160, 200, 200);
line (290, 160, 260, 200);

//eyes
fill(255);
int a = 150;
int b = 60; 
ellipse(100, a, b, b); 
ellipse(200, a, b, b); 
ellipse(300, a, b, b);


int c = 150;
int d = 40; 
ellipse(100, c, d, d); 
ellipse(200, c, d, d); 
ellipse(300, c, d, d); 
 

int e = 150;
int f = 25;
fill(0); 
ellipse(100, e, f, f/2); 
ellipse(200, e, f, f/2); 
ellipse(300, e, f, f/2); 

//arms
strokeWeight(2);
quad(108, 310, 156, 260, 139, 310, 60, 280);
quad(255, 310, 235, 260, 200, 310, 140, 280);


//leg(right)
stroke(0);
strokeWeight(5);
line(224, 350, 250, 390);
line(222, 351, 254, 389);
line(220, 352, 258, 388);
//leg(left)
line(154, 390, 179, 350);
line(158, 391, 177, 349);
line(162, 392, 175, 348);

if(mouseX<100){
ellipse(100, a, b, b); 
ellipse(200, a, b, b); 
ellipse(300, a, b, b);
ellipse(100, c, d, d); 
ellipse(200, c, d, d); 
ellipse(300, c, d, d); 
ellipse(100, e, f, f/2); 
ellipse(200, e, f, f/2); 
ellipse(300, e, f, f/2); 
}
else if (mouseX>300){
ellipse(100, a, b, b); 
ellipse(200, a, b, b); 
ellipse(300, a, b, b);
ellipse(100, c, d, d); 
ellipse(200, c, d, d); 
ellipse(300, c, d, d); 
ellipse(100, e, f, f/2); 
ellipse(200, e, f, f/2); 
ellipse(300, e, f, f/2); 
}}}



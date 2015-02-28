
//moving trunks position
int y = 110;


//colors of ellipse
int r;
int g;
int b;
int a;

//variables of ellipse
int d;
int x;
int k;

void setup(){
background(0);
size(500,500);
smooth();

}

void draw(){
 
  frameRate(14);
//ellipse
  fill(r,g,b,a);
  noStroke();
  ellipse(x,k,d,d);  
  stroke(255);
  strokeWeight(9);
 
  
  if (mouseX < width/2) {
  background(0);
}
  
  x = int(random(500));
  k = int(random(500));
  d = int(random(200));
  r = int(random(0));
  g = int(random(400));
  b = int(random(100));
  a = int(random(120));


line(250,0,250,500);

//left trunks, bottom to top
line(250,240,25,190);
line(250,170,100,90);
line(250,90,220,10);

//right trunks
line(250,240,475,190);
line(250,170,400,90);
line(250,90,280,10);
 
//small trunks, bottom to top
stroke(0);
line(150,218,110,y+10);
line(200,143,180,y);
line(238,60,200,y-80);
line(325,130,350,y);


y = int(random(100,150));

}

void mousePressed(){
noStroke();
fill(255,500,0);
ellipse(475,190,15,15);
ellipse(400,90,15,15);
ellipse(280,10,15,15);
}



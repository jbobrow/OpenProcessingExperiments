
color c;
int x=300;
int y=350;
float diameter;
float a,b;
float theta=0.0;
PImage leaf;
PImage vine1;
PImage vine2;
int inc=50;
int e,f,g;


void setup(){
  size(600,600);
  smooth();
  frameRate(8);
leaf=loadImage("leaf.png");
vine1=loadImage("vine1.png");
vine2=loadImage("vine2.png");
}

void draw(){
  background(0);
    noStroke(); 
    
//buildings
  fill(0,0,129,1000);//blue
  rect(0,450,100,150);
  rect(150,450,150,150);
  rect(400,400,110,200);
  fill(117,117,117);//grey
  rect(100,400,50,200);
  rect(300,450,100,150);
  rect(510,430,110,200);
   
  //windows
 for(int i=20; i<width; i+=inc){
   for(int j=470; j<height; j+=inc){
    noStroke();
    fill(254,239,57);
    rect(i,j,20,20);
   }
   
   fill(254,239,57);
   rect(120,420,20,20);  
   rect(420,420,20,20);
   rect(470,420,20,20);
   
   
pushMatrix();
  scale(0.2);
  image(leaf,1500,550);
popMatrix();

//legs
image(vine1,100+a/4,380+b/4);
  image(vine2,300+a/4,360+b/4);

//head
    fill(34,139,34);
  ellipse(300,300,200,250);
  
  
//eyes
  fill(255);
  ellipse(270,250,30,50);
  ellipse(330,250,30,50);
  strokeWeight(10);
  fill(0);
  ellipse(270,255,10,10);
  ellipse(330,255,10,10);
   
//mouth
   stroke(0);
   line(300,350,300,350);
  
//arms
   stroke(34,139,34);
  strokeWeight(4);
   line(380,300,550+a,300+b);
   line(220,300,50+a,300+b);
  

 c = get(mouseX, mouseY);
  if (c == color(34,139,34)){
  a=random(-1,1)*50;
  b=random(-1,1)*50;
  
 //mouth
   diameter= random(20,50);
   fill(0);
   ellipse(x,y,diameter,diameter);
   
  e=10;
  f=30;
  noStroke();
  colorMode(RGB,width);
  for (int q=0; q<300; q+=inc){
   // for(int r=0; r<100; r +=in){
     g = q/50 ;
 
     fill(q,400,g); 
    ellipse(q,f,f,q); 
  
  

    }
    
  }
  
  }
  

 }



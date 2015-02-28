
void setup() {
size(800,800);
background(125,200,140);
 frameRate(10);
 stroke(100,150,200,5);
}
int x = 10;
int y = 10;
int g = 790;
int e = 0;



void draw(){
    if (mousePressed) {
x = 10;
y = 10;
g = 790;
e = 0;

  }
    if (x>1300){
  x =10;
  y=10;
  g=790;
  e=0;

}


for (int i=0; i<25; i=i+1){
  fill(g*0.4-50,x*2-5,100,10);
  ellipse(g,g,x,x);
  fill(x*0.5+25,x*2-15,225,10);
  ellipse(e,g,x,x);
  fill(g*0.3-10,e*0.4,200,10);
  ellipse(g+2,e,x,x);
  fill(x+50,g,e*0.8,10);
  ellipse(e,e,x,x);
  fill(x*0.8-10,x*0.2-20,x*0.1-35,10);
  ellipse(400,400,x,x);
  
}
  x = x+35;
  g = g-28;
  e = e+28;


  }

 
  
  
  

  

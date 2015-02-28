
int x=525;
float y=50;
int a=0;
int b=0;
int r=250;
int v=250;
int g=250;
float px;
float py;
float easing=0.1;


void setup() {
size(750,475);
background(255,255,255);
smooth();

}


void draw() {
  background(240);
  float targetX = mouseX;
  a+=(targetX-a)*easing;
  float targetY = mouseY;
  b+=(targetY-b)*easing;
  float weight=dist(a,b,px,py);
  strokeWeight(weight*2);
  stroke(mouseX,mouseY,255);
  line(a,b,px,py);
  px=a;
  py=b;
  
  
/*background quads*/
strokeWeight(1);
stroke(210);
for (int i=0; i<width; i=i+50){
  for (int j=0; j<height; j=j+15) {
    noFill();
    quad(i,j,i,j+15,i+50,j+25,i+50,j+10);
  }
}
  
  /*pink quads*/
  
if ((mouseX>x) && (mouseX<x+150) && 
(mouseY>y+75) && (mouseY<y+150)){
  fill(245,72,132);
} else {
  fill(260,217,217);
}


strokeWeight(9);
stroke(0,0,0);

y= random(-y,y);
quad(x,y-100,x+150,y-125,x+150,y-50,x,y-25);
quad(x,y,x+150,y-25,x+150,y+50,x,y+75);
quad(x,y+100,x+150,y+75,x+150,y+150,x,y+175);
quad(x,y+200,x+150,y+175,x+150,y+250,x,y+275);
quad(x,y+300,x+150,y+275,x+150,y+350,x,y+375);
quad(x,y+400,x+150,y+375,x+150,y+450,x,y+475);


}


                                                

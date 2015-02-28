
void setup(){
   size(400, 400); 
   background (/*random(230,255),random(230,253),random(10,18)*/255);   
  int a=200; int b=333 ;int c=282;
  int d=67; int e=118; int f=255;
  int g=145; int h=197; int i=246;
  int j=148; int k=276; int l=55;
  int m=99; int n=295; int o=349;
noStroke();
//top
fill(48,4,66,random(80,100)); triangle(a,l,a,m,d,e);//1
fill(45,9,129,random(50,130)); triangle(a,l,d,e,e,j);//2
fill(45,9,129,random(50,130)); triangle(a,l,e,j,c,j);//3
fill(45,9,129,random(50,130)); triangle(a,l,c,j,b,e);//4
fill(48,4,66,random(80,100)); triangle(a,l,b,e,a,m);//5
//Middle
fill(48,4,66,random(80,100)); triangle(a,m,e,i,c,i);//1
fill(48,4,66,random(80,100)); triangle(a,m,d,e,e,i);//2
fill(48,4,66,random(80,100)); triangle(d,e,e,i,d,k);//3
fill(45,9,129,random(50,130)); triangle(d,e,d,k,e,j);//4
fill(45,9,129,random(50,130));triangle(e,j,d,k,a,n);//5
fill(45,9,129,random(50,130)); triangle(e,j,a,n,c,j);//6
fill(45,9,129,random(50,130)); triangle(c,j,a,n,b,k);//7
fill(45,9,129,random(50,130)); triangle(c,j,b,k,b,e);//8
fill(48,4,66,random(80,100)); triangle(b,e,c,i,b,k);//9
fill(48,4,66,random(80,100)); triangle(a,m,c,i,b,e);//10
//bottom
fill(45,9,129,random(50,130)); triangle(e,i,a,o,c,i);//1
fill(45,9,129,random(50,130));triangle(e,i,d,k,a,o);//2
fill(48,4,66,random(80,100)); triangle(d,k,a,n,a,o);//3
fill(48,4,66,random(80,100)); triangle(a,n,a,o,b,k);//4
fill(45,9,129,random(50,130)); triangle(c,i,a,o,b,k);//5
}

void randomizerFigure(float x, float y, float type){
//draw rectangle
 if(type < 0.2) {
  float z=random(5,10);
  noStroke();
  fill(random(255),random(255),random(255),random(40,67));
   rect(x, y, z, z);
//draw ellipse
 } else if (type < 0.5) {
  float d=random(5,20);
  noStroke();
  fill(random(255),random(255),random(255),random(40,67));
  ellipse(x, y, d, d);
//draw line
 } else if(type < .8) {
  float w= random(width/2,height/2);
  stroke(random(255),random(255),random(255),30);
  strokeWeight(1);
  line(x,y,w,w);
//draw triangle
 } else if (type < 1) {
    float bx = x-10;
    float by = y+15;
    float cx = x+10;
    float cy = by;
    noStroke();
    fill(random(255),random(255),random(255),random(40,67));
    triangle(x,y, bx, by, cx, cy);
    }
}

void parametricCircle(float originX, float originY, float radius) {
  for(float t = 0; t < TWO_PI; t += .1) {
     float x = originX + radius * cos(t);
     float y = originY + radius * sin(t);
     randomizerFigure(x, y, random(0.0, 1.0));     
  }  
}

void draw() {
    for(int i = 25; i < 200; i += 30) {
       parametricCircle(400/2, 400/2, i); 
       noLoop();
    } 
}



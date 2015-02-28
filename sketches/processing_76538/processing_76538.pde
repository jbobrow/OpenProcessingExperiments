
//Alex Wainwright
//10/22/12
void setup(){
 {
size(500,350);
noStroke();
int centerx = width/8;
int centery = height/2;
background(148,78,93);
noStroke();
int c = 0;
float triangle_scale=300;
float ax=centerx + triangle_scale;
float bx=centerx - triangle_scale;
float cx=centerx + triangle_scale;
float ay=centery - triangle_scale;
float by=triangle_scale;
float cy=centery + triangle_scale;
fill(0,195,118);
triangle(ax,ay,bx,by,cx,cy);
for(float b = triangle_scale; b > 0; b = b - 3){
ax=centerx + b;
bx=centerx + b;
cx=centerx - b;
ay=centery + b;
by=centery - b;
cy=centery - b;
fill(15,b+146,18-by);
triangle(ax-b,b-ay,b-bx+145,by,cx-b,b+cy-45);
c=c+25;
ellipse(c,175,90,190);
fill(187,187,187);
    }
  frameRate(100);}
}
int v=500;
int m=350;
void draw(){
  {
  rect(0,300,355,55);
fill(0);} 
   {
   if(m<0){m=350;}
   m=m-2;
   fill(235-m,73-m,73-m);
} 
 { if(v<157){v=500;}
  v=v-1;
  ellipse(v,175,90,90);
  fill(0+v,187+v,187+v);
  ellipse(v,175,60,60);
  noStroke();}  
  {
    ellipse(500,350,350,350);
  }
}



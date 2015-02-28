
int width = 600;
int height = 600;
float interval = 5;
int count = 0;
int index = 0;
int totalRows = 6;
 
cID col;
Particle[] point;
 
void setup(){
  size(width,height);
  background(0);
   
}
 
void draw(){
 
   
      point = new Particle[int(width*height/interval)];
  for(int x = 1; x< width/interval; x++){
    for(int y = 1; y< height/interval; y++){
      index = x-1+((y-1)*(x-1));
      col = new cID(int((x*interval/width)*1530));
      if (count >= width*2) count = 0;
      if (count<width){
      point[index] = new Particle(x*interval,y*interval,count+1,col);
      }
      else if (count>=width && count< (width*2)){
      point[index] = new Particle(x*interval,y*interval,width+(width-count),col);
      }
      
      
     point[index].display();
     index++;
    }
  }
  index = 0;
 //for(int i = 0; i<index;i++){
//   println(index);
 //point[i].display();}
  count++;
 if (interval< (height/totalRows)){
    interval++;
 }
}
 
 
class Particle{
  float x;
  float y;
  int size;
  int yd = 0;
  int xd = 0;
  cID C;
   
   Particle(float xcoord, float ycoord, int diameter,cID col){
    x = xcoord;
    y = ycoord;
    size = diameter;
    C = col;
  }
 void update(){
   if(abs(mouseY-y)<size && abs(mouseX-x)<size){
   float angle2mouse = atan2(mouseY-y, mouseX-x);
   x += cos(angle2mouse)*size;
   y += sin(angle2mouse)*size;
   }
   
 }
   
 void display(){
   update();
   strokeWeight(abs(size));
   stroke(C.r,C.g,C.b,4);
   fill(1,7);
   x = constrain(x,0,width);
   y = constrain(y,0,height);
   ellipse(x,y,size+xd,size+yd);
    //for(int i = 1; size>=1; i++){
    // size=size-(i*(i/3));
    //  ellipse(x,y,size-(mouseY/3),size-(mouseY/3));
   // }
 }
}

class cID{
  int r;int g;int b;
  color rgb;
   
  cID(int colID){ int cx = colID;
  while (cx>1530)cx-=1530;
         if (cx<=255)           {r=255;    g=0;      b=cx;}
    else if (255<cx && cx<=510) {r=510-cx; g=0;      b=255;}
    else if (510<cx && cx<=765) {r=0;      g=cx-510; b=255;}
    else if (765<cx && cx<=1020){r=0;      g=255;    b=1020-cx;}
    else if(cx>1020 && cx<=1275){r=cx-1020;g=255;    b=0;}
    else if(cx>1275 && cx<=1530){r=255;    g=1530-cx;b=0;}
    rgb = color(r,g,b);
  }
}

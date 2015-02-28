
/*
           |         |
 5(-1,-1)  | 4(0,-1) |3(1,-1)
 ----------------------------
           |         |
 6(-1,0)   |  x      |2(1,0)A
 ----------------------------
 7(-1,1)   | 0(0,1)A |1(1,1)A
           |         |
 */
PVector [] places = new PVector [8];
int w = 255;
int h= 255;
PImage img;
PVector now;
color mark = 0;
void setup(){
  places [0]= new PVector (0,1,0);
  places [1]= new PVector (1,1,0);
  places [2]= new PVector (1,0,0);
  places [3]= new PVector (1,-1,0);
  places [4]= new PVector (0,-1,0);
  places [5]= new PVector (-1,-1,0);
  places [6]= new PVector (-1,0,0);
  places [7]= new PVector (-1,1,0);
  String fn="steve3.png";
  //"http://3.bp.blogspot.com/-a9vd9HEKjPc/To8YHqBb7CI/AAAAAAAAAVo/oWsW8T9vNTc/s400/steve3.png";
  //"steve3.png";
  //"http://3.bp.blogspot.com/-yPKI3PYnpJ4/ToJSOU0FJmI/AAAAAAAAAU4/dn2r-AP8iBs/s1600/shape5.png";

  img= loadImage(fn);
w= 500;
h=500;
  size(500,500,P3D);
  now = new PVector (10,h/2-10,0);
  image(img,0,0);
  for (int x =0;x<img.pixels.length;x++){
   color c = img.pixels[x];
   float rr = c>>16&255;
if (rr>128){
img.pixels[x]=color(255);
}
else
{
 img.pixels[x]=color(1); 
}
    
    
  }
  mark = color(255);
}


PVector check(PVector a){
  int x = int(a.x);
  int y = int(a.y);
  int A=0;
  int B = 0;

  boolean found = false;
  int _x;
  int _y;

  for (int i=0;i<8;i++){
    _x = int(places[i].x);
    _y= int (places[i].y);
    if (img.get(x+_x,y+_y)==mark){
      A=_x;
      found = true;
         img.set(x+_x,y+_y,color(255,0,0));
      B =_y;

      i=8;
    }
  }

  if(!found)A=1;
  PVector retval = new PVector (a.x+A,a.y+B,0);
  return retval; 
}
void draw(){

  now = check(now);
  strokeWeight(3);
  stroke(255,0,0);
  point(now.x,now.y);
  if(now.x>w-5)setup();
}


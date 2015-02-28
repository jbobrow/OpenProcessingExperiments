
PImage a;
PImage b;

int w = 0;
int h  = 0;
PImage c;
color backi=0;
int pass = 0;

String [] fn = new String[100];
void setup(){
  size(660,450,P2D); 
  //loadPixels();
  String fn1 = "ninja.png";
  String fn2 = "ninja2.png";
  String fn3="http://www.cghub.com/files/Image/133001-134000/133794/410_large.jpg";
  String fn4 = "http://rupid79.cghub.com/files/Image/134001-135000/134935/724_stream.jpg"; //38

fn[0]="http://cghub.com/files/Image/174001-175000/174881/345_large.jpg";
fn[1]="http://cghub.com/files/Image/089001-090000/89658/035_large.jpg";
fn[2]="http://cghub.com/files/Profile/011001-012000/11376/profile_image_728_large.jpg";
  String gf = fn4;
  a =loadImage(gf);
  c =loadImage(gf);
 
  w=330;
  h= 600;
 
  

  backi = a.pixels[0];
  A = new PVector (back>>16&255,back>>8&255,back&255);

  image(a,0,0);
  
  b= new PImage (w,h);
 for (int i=0;i<w*h;i++){
 int y = int(i/w);
 int x  = i - (y*w);
 //b.pixels[i]=a.pixels[i];
// b.set(x,y,color(0,0,255));
 }
 b.updatePixels();
 a.updatePixels();
image(b,330,0);
  
}
void mr(){

  B = new PVector(p>>16&255,p>>8&255,p&255);
  dis = dist(A.x,A.y,A.z,B.x,B.y,B.z);
p2= backi;
  PVector C;
  for (int x =0;x<w;x++){
    for (int y =0;y<h;y++){
      color p2 = a.get(x,y);
      color p3 = c.get(x,y);
      C = new PVector(p2>>16&255,p2>>8&255,p2&255);
      float dis2 = dist(A.x,A.y,A.z,C.x,C.y,C.z);
      if(dis2<hit){
       //b.set(x,y,p2); 
        //        b.set(x,y,color(back)); 
      }
      else
      {
        b.set(x,y,p2); 
      }

    }
  }
 
}
void draw(){

pass++;
if(pass==200 &&a !=null){
 for (int i=0;i<w*h;i++){
 int y = int(i/w);
 int x  = i - (y*w);
 //b.pixels[i]=a.pixels[i];
// b.set(x,y,a.get(x,y));
//color f =pixels[i];
b.set(x,y,color(0,0,255));
 }
}


  image(a,0,0);
  image(b,330,0);
  ellipse(mouseX,mouseY,10,10);
}

PVector A;
PVector B;

float dis;
color back;
int hit=38;
void keyPressed(){
  hit = mouseY;
}
void mgg(){
  if (mouseButton == 39){
    back = a.get(mouseX,mouseY);
   A = new PVector (back>>16&255,back>>8&255,back&255); 
  }
  // hit = 10;
  b= createImage(w,h,ARGB);
  color p = a.get(mouseX,mouseY);

  B = new PVector(p>>16&255,p>>8&255,p&255);
  dis = dist(A.x,A.y,A.z,B.x,B.y,B.z);

  PVector C;
  for (int x =0;x<w;x++){
    for (int y =0;y<h;y++){
      color p2 = a.get(x,y);
      color p3 = c.get(x,y);
      C = new PVector(p2>>16&255,p2>>8&255,p2&255);
      float dis2 = dist(A.x,A.y,A.z,C.x,C.y,C.z);
      if(dis2<hit){
        //        b.set(x,y,color(back)); 
      }
      else
      {
        b.set(x,y,p2); 
      }

    }
  }
}


                                

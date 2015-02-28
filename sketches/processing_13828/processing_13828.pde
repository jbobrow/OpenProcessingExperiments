
//New Realist Collage - ZBC

PImage n;
PImage n2;
PImage n3;
PImage y;
PImage y2;
PImage y3;
PImage c;
PImage c2;
PImage c3;
int w=800;
int h=600;

void setup(){
  size(w,h);
  noStroke();
  background(255);
  n = loadImage("nphallemonster.jpg");
  n2= loadImage("nphalle2.jpg");
  n3= loadImage("nphalle3.jpg");
  y = loadImage("ykleinleap.jpg");
  y2= loadImage("klein2.jpg");
  y3= loadImage("klein3.jpg");
  c = loadImage("christowater.jpg");
  c2= loadImage("christo2.jpg");
  c3= loadImage("christo3.jpg");
 
 for(int i = -n.width/8; i < w*1.2;  i+= n.width/8){
    println(i);
    for(int j = -n.height/8; j < h*1.2; j+= n.height/8){
    tint(random(i+1),random(j+1),random((w-i)+(h-j)),random(i+j)*2);
    image(n,i,j,n.width/4,n.height/4);}}
    
  frameRate(1.5);
}
  
  void draw(){
  int fun = int(random(1,7));
  if (fun ==  1){
  tint(random(255),random(255),random(255),random(255));
  image(y,random(w),random(h));
  tint(random(255),random(255),random(255),random(255));
  image(y2,random(w),random(h));
  tint(random(255),random(255),random(255),random(255));
  image(y3,random(w),random(h));
  PFont font;
font = loadFont("BritannicBold-48.vlw"); 
textFont(font); 
String s = "LEAP INTO THE VOID";
text(s, random(w), random(h), 600, 100);
  }
if (fun == 2){
  filter(POSTERIZE, random(2,255));
  filter(BLUR, random(5));
  tint(random(255),random(255),random(255),random(255));
  image(y,random(w),random(h));
  tint(random(255),random(255),random(255),random(255));
  image(y2,random(w),random(h));
  tint(random(255),random(255),random(255),random(255));
  image(y3,random(w),random(h));
  PFont font;
font = loadFont("BritannicBold-48.vlw"); 
textFont(font); 
String s = "LEAP INTO THE VOID";
text(s, random(w), random(h), 120, 600);
}
if (fun == 3){
  tint(random(255),random(255),random(255),random(255));
  image(c,random(w),random(h));
  tint(random(255),random(255),random(255),random(255));
  image(c2,random(w),random(h));
  tint(random(255),random(255),random(255),random(255));
  image(c3,random(w),random(h));
  PFont font;
font = loadFont("BritannicBold-48.vlw"); 
textFont(font); 
String s = "RUN";
text(s, random(w), random(h), 200, 600);
}
if (fun == 4){
  filter(POSTERIZE, random(2,255));
  filter(BLUR, random(5));
  tint(random(255),random(255),random(255),random(255));
  image(c,random(w),random(h));
  tint(random(255),random(255),random(255),random(255));
  image(c2,random(w),random(h));
  tint(random(255),random(255),random(255),random(255));
  image(c3,random(w),random(h));
  PFont font;
font = loadFont("BritannicBold-48.vlw"); 
textFont(font); 
String s = "UNTIL IT HURTS";
text(s, random(w), random(h), 145, 600);
}
if (fun == 5){
  tint(random(255),random(255),random(255),random(255));
  image(n,random(w),random(h));
  tint(random(255),random(255),random(255),random(255));
  image(n2,random(w),random(h));
  tint(random(255),random(255),random(255),random(255));
  image(n3,random(w),random(h));
  PFont font;
font = loadFont("BritannicBold-48.vlw"); 
textFont(font); 
String s = "DON'T SHOOT";
text(s, random(w), random(h), 200, 600);
}
if (fun == 6){
  filter(POSTERIZE, random(2,255));
  filter(BLUR, random(5));
  tint(random(255),random(255),random(255),random(255));
  image(n,random(w),random(h));
  tint(random(255),random(255),random(255),random(255));
  image(n2,random(w),random(h));
  tint(random(255),random(255),random(255),random(255));
  image(n3,random(w),random(h));
  PFont font;
font = loadFont("BritannicBold-48.vlw"); 
textFont(font); 
String s = "THE MONSTER";
text(s, random(w), random(h), 220, 600);
}
  }
 void mousePressed(){
 redraw();
  }


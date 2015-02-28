

int IMGHEIGHT;
int IMGWIDTH;
PFont myFont;
String quote="emptiness form";
String quoteArray[]=quote.split(" ");
String[] fontList;
int q=0;
int x;
int y;
int x1;
int y1;
int x2;
int y2;
int w1;
int w2;
int o;
int r;
int g;
int b;
int inc1;
int dy;
int dx;
boolean bFlip;
boolean bStop;
int loops;
float size1;
float size2;
int start;
int end;
int sub=quoteArray.length;

void setup() 
{
fontList = PFont.list();
  IMGHEIGHT=600;
  IMGWIDTH=900;
bStop=false;
  frameRate(30);

x=mouseX;
y=mouseY;
  reset();
  size(IMGWIDTH,IMGHEIGHT);

  background(255,255,255);
}
void draw()
{
if(bStop){return;}
  color c1;
   color c2;

//start=int(random(2));

//end=int(random(2));
textSize(size1);
;

q++;
if (bFlip){
 r=r+1;
g=g+1;
b=b+1;
}
else{
 r=r-1;
g=g-1;
b=b-1;
}
c1=color(r,g,b,o);

fill(c1);
x=(w2*mouseX+w1*x)/(w1+w2);
y=(w2*mouseY+w1*y)/(w1+w2);
//text(quoteArray[start],x1,y1);
text(quoteArray[start],x,y);

textSize(size2);

//text(quoteArray[end],x1,y2);
//text(quoteArray[end],x2,y1);

c2=color(255-r,255-g,255-b,o);
fill(c2);
text(quoteArray[end],x1,y1);

//text(quoteArray[start],x,y2);
//text(quoteArray[start],x2,y);
textSize(size1);
//text(quoteArray[end],x1,y);
//text(quoteArray[end],x,y1);

if((q>=int(loops))){
 q=0;
  inc1=inc1*-1;
  dx=dx*-1;
  dy=dy*-1;
  bFlip=!bFlip;
 
}
size1=size1+inc1;
size2=size2-inc1;
x=x+dx;
y=y+dy;
x1=x-dx;
y1=y-dy;
x2=x2+0;
y2=y2;

//o=o-1;

if (q>loops){reset();};



 }




  
 
  

 void keyPressed()
{
 //  if ( key == 's' ) save(str(millis())+".jpg");
    if ( key == 'r' ) setup();
}
void mouseClicked(){
  if (bStop){
    bStop=false;
    reset();
  }
  else{
     bStop=true;
  }
}
void reset(){
  w1=int(random(1,100));

  w2=1;
  sub++;
  if (sub>=quoteArray.length){
    sub=0;
  }
  /*x=int(random(200,400));
y=int(random(400,600));
x=mouseX;
y=mouseY;*/
x=(w2*mouseX+w1*x)/(w1+w2);
y=(w2*mouseY+w1*y)/(w1+w2);
x1=x;
y1=y;
x2=x;
y2=y;


size1=1;
o=int(random(60,80));
q=0;
r=int(random(55,75));
g=int(random(55,75));
b=int(random(55,75));

if(random(100)<50){
 start=0;
 end = 1;
 }
 else{
   start=1;
 end = 0; 
 }
 inc1=int(random(3))+1;

 loops=int(random(100,180))+1;
 size2=loops*inc1;
 dx=int(random(-2,2));
  dy=int(random(-2,2));
  bFlip=true;
   myFont = createFont(fontList[int(random(fontList.length))], (IMGHEIGHT+1)/10);
  textFont(myFont);
//filter(BLUR);
}


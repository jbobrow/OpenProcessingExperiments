

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

int o;
int r;
int g;
int b;
int inc1;
int dy;
int dx;

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

  frameRate(30);


  reset();
  size(IMGWIDTH,IMGHEIGHT);

  background(255,255,255);
}
void draw()
{

  color c1;
   color c2;

//start=int(random(2));

//end=int(random(2));
textSize(size1);

q++;
c1=color(r+q,g+q,b+q,o);

fill(c1);



text(quoteArray[start],x1,y1);
text(quoteArray[start],x,y);

textSize(size2);
text(quoteArray[end],x1,y2);
text(quoteArray[end],x2,y1);

c2=color(255-(r+q),255-(g+q),255-(b+q),o);
fill(c2);
text(quoteArray[start],x,y2);
text(quoteArray[start],x2,y);
textSize(size1);
text(quoteArray[end],x1,y);
text(quoteArray[end],x,y1);


size1=size1+inc1;
size2=size2-inc1;
x=x+dx;
y=y+dy;
x1=x1-dx;
y1=y1-dy;
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

void reset(){
  sub++;
  if (sub>=quoteArray.length){
    sub=0;
  }
  x=int(random(200,300));
y=int(random(200,400));

x1=x;
y1=y;
x2=x;
y2=y;


size1=1;
o=int(random(10,20));
q=0;
r=int(random(30,55));
g=int(random(30,55));
b=int(random(30,55));

if(random(100)<50){
 start=0;
 end = 1;
 }
 else{
   start=1;
 end = 0; 
 }
 inc1=int(random(2))+1;

 loops=int(random(120,200))+1;
 size2=loops*inc1;
 dx=int(random(-4,4));
  dy=int(random(-4,4));
   myFont = createFont(fontList[int(random(fontList.length))], (IMGHEIGHT+1)/10);
  textFont(myFont);
filter(BLUR);
}


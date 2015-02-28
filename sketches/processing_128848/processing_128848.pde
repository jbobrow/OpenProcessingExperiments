
int sqareSize=16;
int sqareCount;

void setup() { 
size(512, 512,P2D);
 sqareCount=width/sqareSize*height/sqareSize;
textSize(sqareSize/2);
stroke(255);
}

void draw() { background(0);
 int x=-sqareSize,y=-sqareSize;
 int segment=-1;
 int direction=3;
 int oldSegment=0;
 int first=mouseX;
for (int i = first ; i < first+sqareCount;i++) {
if(i>oldSegment+segment){
oldSegment=i;
direction++;if(direction>3){direction=0;}
switch(direction){
case 1: segment++; break;
case 3: segment++; break;
}}
int oldX=x,oldY=y;
switch(direction){
case 0: x+=sqareSize;; break;
case 1: y+=sqareSize;; break;
case 2: x-=sqareSize;; break;
case 3: y-=sqareSize;; break;}

stroke(255); fill(255);
 line(oldX+width/2,oldY+height/2,x+width/2,y+height/2);
 if(isPrime(i)) 
 {stroke(255,0,0);rect(width/2+x,height/2+y,sqareSize,sqareSize);fill(255,0,0);}
 text(i,width/2+x,height/2+y+sqareSize/2);
 }
}

boolean isPrime (int n){if (n < 2) return false; float q = (int) Math.sqrt (n);for (int i = 2; i <= q; i++){if (n % i == 0){ return false; }} return true;}





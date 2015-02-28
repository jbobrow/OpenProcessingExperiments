
Calder[] calderArray = new Calder[10];

float sleep=8;
float work=13;
float code=1.5;
float web=2;
float computer=4;
float classroom=7;

float go_out=7;
float party=4;
float movie=4;

int p=2;                 //coefficient
int k=6;                 // coef.
float x;                 //to make things easier  curve vertex first
float y;                 //to make things easier
float x2;                //to make things easier  curve vertex last
float y2;                //to make things easier  
float mx;                 //Middle of the branch  X
float my;                 //                      Y

float xx;               // Normal life part variables
float yy;
float xx2;
float yy2;

float homework=work-classroom;
float design=homework-code-web;
float paper=homework-computer;
float awake=24-sleep;
float fun=awake-work;

float aw=random(0,30);
float sl=random(50,150);
float wo=random(0,40);
float fu=random(30,100);

float cl=random(25);
float ho=random(25);
float co=random(15);
float pa=random(10,40);
float cod=random(15,30);
float we=random(10,30);
float des=random(5);

float par=random(60,90);
float go=random(10,30);
float mo=random(20,50);


void setup() {
  size(1400,750);
  background(255);
  smooth();
  noLoop();
}

void draw() {
  
 strokeWeight(3);
 stroke(0);
 line(width/2,30,width/2,60); 

///////////////////...........................................................BOOT and NORMAL

x= width/2-181;
y=100;
mx=width/2;
my=60;
x2=width/2+283;
y2=90;

calderArray[8] = new Calder (x, y,mx,my, x2, y2, 70.5*p, 45*p);
calderArray[8].drawCalder(); 
 
 ///////////////////...........................................................AWAKE and SLEEP
   x=width/2-181+xbig(awake,sleep,400) ;
   y=100+70.5*p+aw ;
   x2=width/2-181-xsmall(awake,sleep,400);
   y2=100+70.5*p+sl ;
   mx= width/2-181;
   my= 100+70.5*p; 
   
calderArray[0] = new Calder (x, y,mx,my, x2, y2, awake*k, sleep*k);
calderArray[0].drawCalder();

   
  ///////////////////............................................................ WORK and FUN 

   x2=x+xsmall(work,fun,300);
   y2=y+awake*k+fu;
   x=x-xbig(work,fun,300);
   y=y+awake*k+wo;
   mx= x+xbig(work,fun,300);
   my= y-wo;
  
calderArray[1] = new Calder (x, y,mx,my, x2, y2, work*k, fun*k);
calderArray[1].drawCalder();
  
  
///////////////////............................................................ CLASSROOM and HOMEWORK 

   x2=x+xsmall(homework,classroom,300);
   y2=y+work*k+ho;
   x=x-xbig(homework,classroom,300);
   y=y+work*k+cl;
   mx= x+xbig(homework,classroom,300);
   my= y-cl;
   
calderArray[2] = new Calder (x, y,mx,my, x2, y2, homework*k, classroom*k);
calderArray[2].drawCalder();

  
  ///////////////////............................................................ COMPUTER and PAPER

   x2=x+xsmall(computer,paper,200);
   y2=y+homework*k+pa;
   x=x-xbig(computer,paper,200);
   y=y+homework*k+co;
   mx= x+xbig(computer,paper,200);
   my= y-co;
   
calderArray[3] = new Calder (x, y,mx,my, x2, y2, computer*k, paper*k);
calderArray[3].drawCalder();  


  ///////////////////............................................................DESIGN and (CODE and WEB)

   x2=x+xsmall((web+code),design,150);
   y2=y+computer*k+(we+cod);
   x=x-xbig((web+code),design,150);
   y=y+computer*k+des;
   mx= x+xbig((web+code),design,150);
   my= y-des;
  
calderArray[4] = new Calder (x, y,mx,my, x2, y2, design*k, 0);
calderArray[4].drawCalder();  
  
  
 ///////////////////............................................................ CODE and WEB
  
  x=x2-xsmall(web,code,150);
   y=y2+we;
   mx=x2;
   my=y2; 
   x2=x2+xbig(web,code,150);
   y2=y2;
    
   
calderArray[5] = new Calder (x, y,mx,my, x2, y2, code*k, web*k);
calderArray[5].drawCalder();    
 
 
  ///////////////////............................................................GO_OUT and (PARTY and MOVIE)
   mx=width/2+283;
   my=90+45*p;
   xx=mx-xsmall(go_out,(party+movie),300);
   yy=my+go;  
   xx2=xx+xbig(go_out,(party+movie),300);
   yy2=yy+par/2+mo; 
  
calderArray[6] = new Calder (xx, yy,mx,my, xx2, yy2, go_out*k, 0*k);
calderArray[6].drawCalder();    

 
  ///////////////////............................................................PARTY and MOVIE


 mx=xx2;
 my=yy2;
 xx2= xx2+xsmall(party,movie,200);
 yy2= yy2+mo;
 xx= 2*mx-xx2;
 yy=yy+par;
 
calderArray[7] = new Calder (xx, yy,mx,my, xx2, yy2, party*k, movie*k);
calderArray[7].drawCalder();    
   
}
 

float randomY (int range1, int range2) {
  float x=random(range1,range2);
  return (x);
  
}

float xbig (float big, float small,float line_length) {
  float xbig=  line_length*small/(small+big);
 // println(xbig);
  return(xbig);
}

float xsmall (float big, float small, float line_length) {
 float xsmall= line_length*big/(small+big);
 return (xsmall);
}


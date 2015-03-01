
void setup(){

size(800,600);
background(0);
}

void draw(){
  
  background(0);
  
//  translate(300,300);
  cline(200,100,400,400);  cline(40,400,800,200);
}


void cline( int x1, int y1 , int x2, int y2)
{int x=0 ,  y =0, g=0,h=0;
color colora=color(150);
ellipse(x1,y1,5,5);

ellipse(x2,y2,5,5);
  int u =millis()/100;
 
for (x=x1-7;x<x2;x++){ 
  y=y1+(y2-y1)*(x-x1)/(x2-x1);


 // y=y1+(t);
  set(int(x+20*cos(radians(x*7))/PI) ,int(y+(20*sin(radians(x*7)-(u))/PI)+80*sin(radians(x-7))),colora);

  if(x==x1+((u*20)%(x2-x1))){
  g=int(x+20*cos(radians(x*7))/PI);
h=int(y+(20*sin(radians(x*7)-(u))/PI)+80*sin(radians(x-7)));
ellipse(g,h,40,40);}
}
}







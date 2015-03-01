

void setup(){

size(800,600);
background(0);
}
  int u =millis()/200;
void draw(){
     u +=1;
  background(0);
  
//  translate(300,300);
//  cline(200,100,400,400); 
  cline(0,200,800,300);
}

color colora=color(200);
void cline( int x1, int y1 , int x2, int y2)
{int x=0 ,  y =0, g=0,h=0;
ellipse(x1,y1,5,5);

ellipse(x2,y2,5,5);

 for (int b=y1/2;b<abs(y2*1.5);b+=1)
for (x=x1-7;x<x2;x+=1){ 

  y=y1+(y2-y1)*(x-x1)/(x2-x1);
//if (b>int(y+(20*sin(radians(x*3)-(u))/PI)+80*sin(radians(x-7))) || int(y+(20*sin(radians(x*8)+(u))/PI)+80*sin(radians(x-3)-x2))>b&&b>10)  set(x ,b,colora);


if (b>int(y+(200*sin(radians(x*sin(radians(x)))-(u))/PI)+80*sin(radians(x-7)))&&b>10 && b<y2+100)  set(x ,b-55,-colora);
//if (int(y+(20*sin(radians(x*8)+(u))/PI)+80*sin(radians(x-3)-x2))>b&&b>10)  set(x ,y2/2+b+100,-colora);

///colora=color(dist(x,int(y+(20*sin(radians(x*7)-(u))/PI)+80*sin(radians(x-7))),x,int(y2+(20*sin(radians(x2*7)-(u))/PI)+80*sin(radians(x2-7)))     ));

colora=color(dist(int(x+20*cos(radians(x/2))/PI),int(y+(200*sin(radians(x*sin(radians(x)))-(u))/PI)+80*sin(radians(x)/4)),x,b*sin(radians(b*4)/25)-55),252,152);
//colora=color((10+100)*cos(x/2)+(10+100)*sin(b/2));
//colora=color(200);

 // y=y1+(t);
// set(int(x+20*cos(radians(x))/PI) ,int(y+(20*sin(radians(x*7)-(u))/PI)+80*sin(radians(x-7))),colora);
 
 
  if(x==x1+((u*20)%(x2-x1))){
  g=int(x+20*cos(radians(x*7))/PI);
h=int(y+(20*sin(radians(x*7)-(u))/PI)+80*sin(radians(x-7)));
ellipse(g,h,20,20);}
}

}



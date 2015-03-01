
void setup(){ size(800,600);
background(0);
}

float  y1,x1,x,y ,theta ,cos ,sin, r,r2,t,xc,m,e,w,gh,gh1,x2,y2,x3,y3,hj;
float a=80 , b=100 ;
//, n ,r,x,y;
 final double scale = 800;
     final double step = 1 / scale;
   int   point ;
void draw()
{
background(0);
gh=0;//hj=0;
for(float u =-250;u<250;u+=1)
for(float o =-250;o<250;o+=1)
{
hj%=(PI);hj+=(0.01);
  ///if ( u==0&&o<20    )  set(300+int(u),300+int(o),color(250,0,0));//}

//   r=350*cos( gh);
 gh%=2*PI;
gh+=radians(0.8909); 
  r=400-30*sin(4*gh)*sin(40*gh);
x1 = (r * cos( gh));
y1 = (r * sin(gh));


x3 = ((r*hj) * cos( gh));
y3 = ((r*hj) * sin(gh));
// if (o>y1 && o<y3 )     { set(300+int(u),300+int(o), color(dist(u, o,0,0),10,10));} else continue;

  if(u>100){
// if (  sqrt((o*o)+(u*u))>sqrt( (x1*x1)+(y1*y1))   ) 
//if(dist(300+int( x1 ),300+int(y1),u+300,o+300)<40 ){set(300+int(u),300+int(o),color(250,0,0));}else { stroke(50,20,100); continue;    }
//if(u<x1&&o<y1)set(300+int(u),300+int(o),color(250,0,0));


 set(300+int( x3 ),300+int(y3),color(250,250,0));//}

 set(300+int( x1 ),300+int(y1),color(dist (0,0, x1 ,y1),250,0));//}
 
 
//if(dist(300+int( x1 ),300+int(y1),x2+300,y2+300)<20 ){stroke(0,0,250);}else { stroke(50,250,100); continue;    }
if(dist(300+int( x1 ),300+int(y1),x2+300,y2+300)<1 ){stroke(0,0,250);}else { continue;    }

noFill();
//ellipse(300,300,r*2,r*2);

}
  /*  

  if ( sqrt(x*x+y*y)>r) {stroke(250,250,0);}else { stroke(50,250,100);     }

  point(x1+150,y1+300);

 if ( u==0 && o==50  )ellipse(o+300,u+300,10,10);
*/
}


gh1+=radians(1); 
r=200-30*sin(4*gh1);

x2 = (r * cos( gh1));
y2 = (r * sin(gh1));  
ellipse(x2+300,y2+300,10,10);

ellipse(300,300,10,10);
  stroke(250,250,0);
//ellipse(0,20,10,10);
 for (float t = 0; t <= 2*PI; t+= step) {
  r=300*cos(t);

   x = (r * cos(t));
     y = (r * sin(t));
 
 //point(x+150,y+300);
//line(x+300,y+300,0,0);
 }
}

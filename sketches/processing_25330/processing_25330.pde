
 int space = 0;
 int count = 0;
 int wow = 0;
 int buzz = 0;
 int zap = 0;
 int fun = 0;
 int dunk = 0;
 int chew = 0;
 int boom = 0;
 
 void setup(){
   size(700,700);
   smooth();
   
 }
 
 
 void draw(){
   
   noStroke();
   fill(0,0,0);
   ellipse(250,250,space,space);
   space= space+6;
   fill(250,0,0,90);
   ellipse(450,150,count,count);
   count = count+2;
   fill(2,163,247,90);
   ellipse(200,440,wow,wow);
   wow = wow+3;
   fill(17,247,2,90);
   ellipse(100,200,buzz,buzz);  
   buzz = buzz+1;
   fill(247,2,207,90);
   ellipse(540,400,dunk,dunk);
   dunk = dunk+1;
   fill(247,142,2,90);
   ellipse(350,350,zap,zap);
   zap = zap+2;
   fill(255,255,255,90);
   ellipse(250,400,boom,boom);
   boom = boom+1;
   fill(18,23,255,90);
   ellipse(300,700,chew,chew);
   chew = chew+3;
   fill(95,2,247,90);
   ellipse(600,600,fun,fun);
   fun = fun+1;
 }


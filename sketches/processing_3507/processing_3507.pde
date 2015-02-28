
void draw(){float a,b,d=99,e,f,x,y,k,t;for(x=0;x<300;x++){a=x*.01-2;for(y=0;y<200;y++){b=y*.01f-1;e=0;f=0;for(k=0;k<d;k++){t=sq(f);f=2*e*f+b;e=sq(e)-t+a;if(sq(e)>9){stroke(k);point(x,y);break;}}}}}



int a,b,c;void setup(){a=255;size(a,a);}void draw(){smooth();b++;c=b%a;if(c==1){background(a);for(int i=0;i<5;i++){line(0,35+i*8,a,35+i*8);
}}if(c%15==0){fill(0);ellipse(c,35+int(random(9))*4,9,9);}}


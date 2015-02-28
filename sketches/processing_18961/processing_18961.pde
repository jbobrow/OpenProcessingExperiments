
int n,i,a=98;float[]p=new float[a];void draw(){background(255);for(i=0;i<a;i++){if(n<2)p[i]=random(a);else{point(p[i],(p[++i]+n)%a);}}n++;}


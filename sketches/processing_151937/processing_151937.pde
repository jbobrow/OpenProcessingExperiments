
float[]x; 
float[]a; 
float[]y; 
float[]b;


void setup(){
  

size(800,600);
x=new float [10];
a=new float [10];
y=new float [10];
b=new float [10];


for(int i=0; i<10; i++){
x[i]=0;
a[i]=5;
y[i]=0;
b[i]=5;

smooth();
noStroke();
}
}

void draw(){
background(240);
for(int i=0; i<10; i++){
ellipse(x[i],y[i],20,20);
//fill(50,50,80);

x[i]=x[i]+a[i]; 
if(x[i] > width-20){ 
a[i]=random(0,2)*-1;
fill(random(0,255),random(0,255),random(0,255),100);
//5*-1; 
}
else if(x[i]<0){ 
a[i]=//5*1;
random(0,2)*1; 
fill(random(0,255),random(0,255),random(0,255),100);
}

y[i]=y[i]+b[i]; 
if(y[i] > height-20){ 
b[i]=
//5*-1;
random(5.10)*-1; 
fill(random(0,255),random(0,255),random(0,255),100);
}
else if(y[i]<0){ 
b[i]=
//5*1;
random(0,2)*1; 
fill(random(0,255),random(0,255),random(0,255),100);
}

}
}


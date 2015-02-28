
int n = 10;
float []x=new float[n];
float []y=new float[n];
float []amp=new float[n];
float []desp=new float[n];
float []freq=new float[n];

//.............
void setup(){
  size(800,600);
  background(50,100,150);
  
  //desp=50;
  
  for(int i=0;i<n;i++){
  y[i]=2;
  x[i]=4;
  amp[i]=random(1,80);
  desp[i]=random(0,600);
  freq[i]=random(10,100);
}
  
  
}

//...............
void draw(){
  
  rotate(random(PI/8,TWO_PI));  
for(int i=0;i<n;i++){  
y[i]=amp[i]*sin(x[i]*freq[i])+desp[i]; 

fill(25,50,75,100);
ellipse(x[i],y[i],10,10);

x[i]=x[i]+0.5;
x[i]%=width;  //x=x%width
}  
  
  
  
}

//................




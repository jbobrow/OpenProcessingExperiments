
int x[] = new int[15];
int y[] = new int[15];

void setup(){
size(400,400);
stroke(255);
for(int f=0;f<15;f++){
  x[f] = int(random(400));
  y[f] = int(random(400));
}

  
}

void draw(){
   background(0);
  for(int f=0; f<15; f+=1){
    point(x[f],y[f]);
   for(int i=0; i<15; i+=1){
     for(int c=0;c<15; c+=1){
    if(sqrt(pow(x[i]-x[c],2)+pow(y[i]-y[c],2))<100){
      line(x[i],y[i],x[c],y[c]);
     }
   }
}
x[f]+=int(random(-3,3));
y[f]+=int(random(-3,3));
if(2>x[f]){
x[f]++;}if(2>y[f]){
y[f]++;}

if(398<x[f]){
x[f]--;}if(398<y[f]){
y[f]--;}
  } 
}

void mousePressed(){
  for(int f=0;f<15;f++){
  x[f] = int(random(400));
  y[f] = int(random(400));
  }}


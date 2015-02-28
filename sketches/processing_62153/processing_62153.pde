
int x[] = new int[10];
int y[] = new int[10];

void setup(){
size(600,600);
stroke(0);
for(int f=0;f<10;f++){
  x[f] = int(random(600));
  y[f] = int(random(600));
}

  
}

void draw(){
   background(255);
  for(int f=0; f<10; f+=1){
    point(x[f],y[f]);
   for(int i=0; i<10; i+=1){
     for(int c=0;c<10; c+=1){
       for(int r=0;r<10; r+=1){
    if(sqrt(pow((x[i]-x[c]),2)+pow(y[i]-y[c],2))<250&&sqrt(pow((x[i]-x[r]),2)+pow(y[i]-y[r],2))<250&&
    sqrt(pow((x[c]-x[r]),2)+pow(y[c]-y[r],2))<250){
      fill(((255-sqrt(pow(width/2-x[i],2)+pow(height/2-y[i],2)))
      +(255-sqrt(pow(width/2-x[c],2)+pow(height/2-y[c],2)))
      +(255-sqrt(pow(width/2-x[r],2)+pow(height/2-y[r],2))))/3,((255-sqrt(pow(width/2-x[i],2)+pow(height/2-y[i],2)))
      +(255-sqrt(pow(width/2-x[c],2)+pow(height/2-y[c],2)))
      +(255-sqrt(pow(width/2-x[r],2)+pow(height/2-y[r],2))))/3,255);
      triangle(x[i],y[i],x[c],y[c],x[r],y[r]);
     }
       }
   }
}
x[f]+=int(random(-3,3));
y[f]+=int(random(-3,3));
if(2>x[f]){
x[f]++;}if(2>y[f]){
y[f]++;}

if(598<x[f]){
x[f]--;}if(598<y[f]){
y[f]--;}
  } 
}

void mousePressed(){
  for(int f=0;f<10;f++){
  x[f] = int(random(600));
  y[f] = int(random(600));
  }}


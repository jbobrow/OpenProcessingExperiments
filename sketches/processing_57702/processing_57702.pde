
int x[] = new int[15];
int y[] = new int[15];

void setup(){
size(600,600);
stroke(255);
background(0);
}

  


void draw(){
  // background(0);

     }


int ssize = 200;

 void keyPressed(){
    if(key==' '){
        for(int f=0;f<15;f++){
  x[f] =-1;
  y[f] =-1;}
      background(0);
    }}
    
    
void mousePressed(){
  for(int f=0;f<15;f++){
  x[f] =mouseX+int(random(-ssize,ssize));
  y[f] =mouseY+int(random(-ssize,ssize));
    for(int d=0; d<10; d+=1){
    point(x[d],y[d]);
   for(int i=0; i<10; i+=1){
     for(int c=0;c<10; c+=1){
       stroke(int(random(255)),int(random(255)),int(random(255)));
    if(sqrt(pow(x[i]-x[c],2)+pow(y[i]-y[c],2))<100){
      line(x[i],y[i],x[c],y[c]);
  }}}}}}
  
 


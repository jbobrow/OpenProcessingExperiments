
void setup(){
size (400,400);
fill(0);}
void draw(){
background(255,0,0);
int d = mouseX/10;
int e = 50; 
for(int i=0;i<=width;i+=e){
for(int j=0;j<=height;j+=e){        
ellipse(i,j,d,d);}}}


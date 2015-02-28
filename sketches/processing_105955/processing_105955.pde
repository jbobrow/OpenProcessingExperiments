
int R;
int r=10;
int j=220/6;
float dist;

void setup(){
  size(400,400);
  background(255);

}
void draw(){
  background(255);
for(int i=0;i<7;i++){
  for(int m=0;m<7;m++){

  int ym=(20+r)+(2*r+j)*m;  
 int xi=(20+r)+(2*r+j)*i;

float dist=dist(mouseX,mouseY,xi,ym);
if(dist<r){
R=2*r;
fill(233,34,54);
}
else{
  R=r;
fill(255);
}


 ellipse(xi,ym,2*R,2*R); 
}
   }
}

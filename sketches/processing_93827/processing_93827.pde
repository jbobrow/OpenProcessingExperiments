
int counter;

void setup() {  //setup function called initially, only once
  size(1000, 1000);
  background(255);  //set background white

}

int level=0;
void draw() {  //draw function loops 

 float rx=random(50,950);
 float ry=random(50,950);
 fill((255/1000)*rx,(255/1000)*ry,156);
if(level=1){

 int ix=int(rx);
 int iy=int(ry)

 }
 ellipse(ix,iy,5,5); 
 if (mousePressed==true){
 level=1;
 }else{
 level=0;
 }
 
}

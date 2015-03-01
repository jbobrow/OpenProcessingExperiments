
float px=1;
float py=300;
void setup(){
  size(600,600);
}
void draw(){
if(px<width/2 ){ 
  px=px+10;
}else{
  py=py-10;
}
ellipse(px,py,10,10);
}

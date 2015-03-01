
int px=0;

void setup(){
size (500,500);
}
void draw(){
ellipse(px,250,50,50);
ellipse(px,150,25,25);
ellipse(250,px,50,50);
ellipse (150,px,25,25);
ellipse (70,px,50,50);
px++;
if (px<width/2){
fill(200,5,100);
ellipse(0,px,100,100)
ellipse(50,px,50,50)
}else{
fill(200,0,0);
ellipse(px,0,200,200);
ellipse(px,50,50,50);
ellipse (150,px,25,25);
}
}



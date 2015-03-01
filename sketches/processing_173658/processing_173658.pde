
void setup(){
size(800,600);

background(255,255,255);

for(int a=0; a<width; a=a+50){
noStroke();
fill(0,255,0,10);
ellipse(0,0,a+80,a+80);
fill(0,255,0,10);
ellipse(800,600,a+80,a+80);
fill(255,0,0,20);
triangle(a,600,0,a,800,0);
fill(0,0,255,10);
triangle(a,0,800,a,0,600);





}

}

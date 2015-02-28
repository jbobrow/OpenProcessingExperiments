
void setup(){
size(800,800);

background(15);

for(int a=0; a<width; a=a+50){
noStroke();
fill(14,250,3,15);
ellipse(0,0,a+100,a+100);

fill(14,250,3,15);
ellipse(800,700,a+80,a+80);

fill(9,3,250,15);
ellipse(100,800,a+50,a+50);

fill(255,3,3,15);
ellipse(400,350,a-40,a-40);

fill(9,3,250,15);
ellipse(800,50,a-10,a-10);
}
}

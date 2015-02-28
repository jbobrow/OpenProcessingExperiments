
void setup(){
  size(200,200);
  background(255);
}

void draw(){
 
int i;
stroke(0);
for (i=-300;i<210;i+=5){
fill(255,0,0);
noStroke();
ellipse(i+100,i*i/120+100,5,5);
ellipse(-i+100,-i*i/120+100,5,5);
ellipse(i*i/120+100,i+100,5,5);
ellipse(-i*i/120+100,-i+100,5,5);

}
}



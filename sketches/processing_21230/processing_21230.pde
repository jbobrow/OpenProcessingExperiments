
int o=10;
void setup(){
  size(480,720);
  background(0);
  smooth();
}

void draw(){
  rectMode(CENTER);

 noStroke();
 for (int w= 135; w<=600; w+=20){
rect(240,w,280,10);
}

fill(155,200,30);
rect(65,360,80,560);//izq
rect(480-65,360,80,560);//der
fill(255);
rect(45,360,20,560);//izq
rect(480-45,360,20,560);//der
rect(85,360,20,560);//izq
rect(480-85,360,20,560);//der
fill(155,200,30);

fill(60,30,50);
rect(width/2,height/2-320,width,80);
rect(width/2,height/2+320,width,80);

fill(255,100,50);
for (int c = 0; c <=540; c +=80) {
 
 triangle(0,c+95,0+25,c+120,0,c+145);

}
for (int c = 240; c <=730; c +=80) {
  triangle(480,c-95,480-25,c-120,480,c-145); 
}
fill(255);
triangle(width/2-100,height/2,width/2,height/2+100,width/2+100,height/2);
triangle(width/2-100,height/2,width/2,height/2-100,width/2+100,height/2);
fill(255,100,50);
triangle(width/2-50,height/2,width/2,height/2+50,width/2+50,height/2);
triangle(width/2-50,height/2,width/2,height/2-50,width/2+50,height/2);


}

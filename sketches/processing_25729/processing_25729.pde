
float r;
float g;
float b;
float a;
float angle = 0.0;



void setup(){
  size(screen.width,screen.height);
  background (0);
  smooth();
  r= 168;
  g= 60;
  b= 237;
  a= random (100,200);
}

void draw(){
   
  for (int i=0; i< 200; i++){
    fill(r,g,b,a);
    ellipse(i*30,i*10,35,70);
}
for (int j=0; j< 200; j++){
  fill(255,55,15,a);
  ellipse(j*10,j*50,200,40);
}

for (int m=0; m<200; m=m+3){
  fill(89,247,55,a);
  rect(m*20,m*2,15,10);
}
for (int k=800; k>0; k=k-10){
  fill(252,198,0,a);
  ellipse(k,k,200,50);
}
for (int h=0; h<200; h= h+10){
  fill(12,184,229,255);
  rect(h*15,h*10,60,255);
}
  if (mousePressed == true) {
  translate(mouseX, mouseY);
  rotate(angle);
  fill(random(240,255),random(15,40),random(170,210),random(255));
  rect(0,0,0,-30,-60,-60,-30,0);
  angle += 0.4;
  }

}





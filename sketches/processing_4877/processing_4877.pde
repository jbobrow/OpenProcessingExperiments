
float i = 250;
float j = 250;
float theta = 0.0;
PFont fontA;

void setup(){
  size(500,500,P3D);
  fontA = loadFont("CourierNewPS-BoldMT-48.vlw");
  textFont(fontA,16);
}
void draw(){
  background(255);
  lights();
   theta = theta+0.0001;
  for(i=0; i<330;i+=1)
   {
    translate(i/2,i/2,-10);
    float n = random(1,200);
    float m = random(1,200);
    float b = random(0,1);
   
    rotate(theta*10);
    fill(i,n,m);
    rect(n,m,i,i);
    text("alkopop",280,250);
    rotate(theta/10);
    rect(n,i,i,i);
    translate(i,10,-20);//last valuse, -200 affects depth
    rotate(theta/2);
    box(10);
    translate(i,i/2,i/10);
    box(20);
    translate(i,b,-10);
    rotateZ(theta/3);
   box(20);
    

  }
}







float x=1;
void setup(){
  size(600,600);
  colorMode(HSB);
  
}
void draw(){
  bckGrnd();
  Sun(450,100,200);
  for(int i=0; i<600; i+=70){
    for(int j=300; j<600; j+=70){
      sunflower(i,j,.5,50);
    }
  }
  for(int i=35; i<600; i+=70){
    for(int j=335; j<600; j+=70){
      sunflower(i,j,.5,50);
    }
  }
  sunflower(400,400,2,x);
  x+=2;
  if(x>250){
    x-=5;
  }
  if(mousePressed){
    x=mouseX;
  }
}

void Sun(int X, int Y, float Size){
  float num=0;
  fill(25, 250, 250, 20);
  noStroke();
  
  
  for (int i = -180; i < 180; i+=12) {
    float x = sin(radians(i)) * 15;
    float y = cos(radians(i)) * 15;
       
    //float x = i;
    //float y = 0;
    pushMatrix();
    scale(Size/400);
    translate(X,Y);
    translate(x, y);
    rotate(radians(-i));
    for(int q = 0; q < 200; q+=5){
      float d = map(q, 0, 200, 40, 0);
      float a = sin(-i+q+num) * 2;
      ellipse(a, q, d, d);
    }
    popMatrix();
  }
   
  num += 0.2;
}

void bckGrnd(){
  background(75,230,250);
  noStroke();
  for(int i = 0, c = 180; i < 250; i+=5, c--){
    fill(c,200,250);
    rect(0,i,600,5);
  }
}

void sunflower(int X, int Y, float Scale,float x){
  pushMatrix();
  translate(X,Y);
  scale(Scale/4);
  stroke(0);
  strokeWeight(10);
  fill(80,200,100);
  rect(-x/2,0,x,600);
  fill(32,250,150);
  ellipse(0,0,2*x+30,2*x+30);
  rotate(PI);
  strokeWeight(1);
  noStroke();
  if(Scale>1){
    for (float t=1; t<250; t++){
      fill(t,240,240);
    rotate(137.5*PI/180);
    //ellipse(t,0,2*sqrt(t),2*sqrt(t));
    //triangle(t,t/20+5,t,-t/20-5,t/1.2,0);
    if(t-250+x > 0){
      ellipse(abs(t-250+x),0,2*sqrt((t-250+x)),2*sqrt((t-250+x)));
      triangle((t+x-250),(t+x-250)/20+5,(t+x-250),-(t+x-250)/20-5,(t+x-250)/1.2,0);
      }
    }
  }
  stroke(0);
  for(int i = 0; i < 34; i++){
    rotate(21*TWO_PI/34);
    fill(32,250,250);
    ellipse(2*x+10,0,2*x,2*x/3);
  }
  popMatrix();
}

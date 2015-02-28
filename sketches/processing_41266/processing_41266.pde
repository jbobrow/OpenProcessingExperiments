
int ballCount = 500;
int ballSize = 20;
int ballSpeed = 3;

float[]speedx = new float [ballCount];

float[]speedy = new float [ballCount];

float[]x = new float [ballCount];

float[]y = new float [ballCount];

float[]diam = new float [ballCount];
boolean a=false;
int c=0;
void setup(){
 
 size(800,450);
 background(0);
 smooth();
  for (int i=0; i<ballCount; i++){
 speedx[i] = random (1,ballSpeed);
 speedy[i] = random (-ballSpeed,ballSpeed);
 diam[i] = random(1,ballSize);
  } 
 noStroke();
frameRate(60); 
}


void draw(){
 c=c+50;
 if (c>255){
  c=0;
}
  if (a=true){
    
  background(c,map(mouseX,0,width,0,255),c);
  println('*');

} else {
  println('$');
}
  
 for (int i=0; i<ballCount; i++){

 
 x[i] = width/2+random(-width/3,width/3);
 y[i] = height/2+random(-height/3,height/3);
 }
 
//background(0);
for(int i=0; i<ballCount;i++){
fill( i/2, mouseX/2, 0); 
ellipse(x[i],y[i],diam[i],diam[i]);
x[i]+=speedx[i];
y[i]+=speedy[i];



if (x[i]+ diam[i]/2>=width || x[i]<=diam[i]/2){
 speedx[i]*=-1;
}

if (y[i]+ diam[i]/2>=height || y[i]<=diam[i]/2){
 speedy[i]*=-1;
}



}

}

void mousePressed(){
a=!a;

}




float[] x = new float[5];
float[] y = new float[10];

float xspeed = random(3,5);
int xdirection = 1;
float yspeed = random(3,5);
int ydirection = 1;

void setup(){
size(800,800);
frameRate(10);
smooth();


}

void draw(){

background(0);

for(int i = 0;i < x.length; i++){
for(int j = 0; j < y.length;j++){
  fill(random(255),random(255),random(255),100);
  ellipse(x[i]+i*width/20,y[j]+j*height/20,width/20,height/20);
 
 x[i]=x[i] + xspeed*xdirection;
 y[j]=y[j] + yspeed*ydirection;
 
 if(x[i] >= width-5*width/40 || x[i] < 0){

xdirection= -xdirection;


}

if(y[j]>= height-10*height/40 || y[j] < 0){

ydirection= -ydirection;
x[i]= random(20,780);
y[i]= random(20,780);

}


}

}

}



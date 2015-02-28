
//mesura pilotes de tennis
int size =30 ;
//num. pilotes
int Npilotes=20 ;

//MATRIU
float[] x = new float[Npilotes];
float[] y = new float[Npilotes];
float[] vx = new float[Npilotes];
float[] vy = new float[Npilotes];

//set up
void setup(){
size(500,500);

//POSICIONS I VELOCITATS DE LES PILOTES
for(int i = 0; i<Npilotes; i++){
x[i]= random (width/2, width/2);
y[i]= random (height/2, height/2);

vx[i]= random(3,7);
vy[i]= random(3,7);
}
}

//DRAW
void draw(){
background(242,114,34);
for(int i=0; i<Npilotes; i++){  
x[i] +=random(-8,8);
y[i] +=random (-8,8);

//LÍMITS
if((x[i]<width/10)||(x[i]>width-width/10)){
    x[i] = -x[i];
  }
  if ((y[i]<height/11)||(y[i]>height-height/26)){
   y[i] = -y[i];
  }
}

//DIBUIX PILOTES TENNIS
for(int i=0;i<Npilotes; i++){

fill(153,222,7);
ellipse(x[i],y[i],20,20);

stroke(250);
fill(27,45,45);
line(x[i],y[i]-9,x[i],y[i]+9);
line(x[i]-5,y[i]-7,x[i]-5,y[i]+7);
line(x[i]+5,y[i]-8,x[i]+5,y[i]+7);
fill(0);
textSize(10);
text("W",x[i]-3,y[i]+5);
fill(255,255,255);
rect(20,20,22,460);
rect(455,20,22,460);

line(20,255,460,255);
}
}

void mousePressed(){
 for(int i = 0; i<Npilotes; i++){
  x[i]=mouseX;
  y[i]=mouseY;
 }
}


 



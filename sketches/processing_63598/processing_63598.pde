
float [] rot=new float[100];
float d=dist(mouseX, mouseY, pmouseX, pmouseY);
float[] grow=new float[100];
float[] boom=new float[100];
float[] wobble=new float[100];
float [] speed=new float[100];
float rad;
float[] counter=new float[100];
float[] counterI=new float[100];
float[] stick=new float[100];
int b=0;
float a=0;
float cir=100;
float cirsml=50;

void setup() {
  size(500, 500);
  smooth();
}


void snowflake(float x, float y, float s, float d) {

  rad=dist(mouseX, mouseY, x, y);


  //Ben's Random Stuff
  int nx = (int)x-25;
  int ny = (int)y-25;
  int i= 10*floor(ny/(height/10))+floor(nx/(width/10));
  i = constrain(i, 0, 99);
  println("x: "+x +" y: "+y+" i:" + i);
  //Ben's Random Stuff Ends

  if (rad<cir&&boom[b]<20) {
    speed[i] = speed[i]+d/580;
    counter[b]=0;
    wobble[b]=0;
    grow[b]=grow[b]+speed[i];
  }
  if(grow[b]>10){
    grow[b]=10.1;
  }
  if (rad>cir) {
    counter[b]=counter[b]+1;
    grow[b]=grow[b]-0.2;
  }
  if(grow[b]<0){
    grow[b]=0;
  }
  if(rad<cirsml&&speed[i]>0.3){
    counterI[b]=counterI[b]+1;
  }
  if (rad<cirsml&&counterI[b]>100||stick[b]==1){
    stick[b]=1;
    x=mouseX;
    y=mouseY;
    grow[b]=random(0,3);
  }


  translate(x+wobble[b], y+wobble[b]);  
  rotate(rot[i]);
  translate(-x+wobble[b], -y+wobble[b]);
  println("rad: "+rad);  

  if (counter[b]>100) {
    wobble[b]=random(-a, a);
    a=a+0.0001;
  }
  if (counter[b]>250) {
    boom[b]=boom[b]+20;
  }


  println("speed[i]: "+speed[b] +"counterI[b]: "+counterI[b]);
  layer(x, y, s+grow[b], 10+boom[b]);
  if (b<99) {
    b++;
  }
  else {
    b=0;
  }
}

void layer (float x, float y, float s, float gap) {
  rect(x+gap, y, s, s);
  rect(x-gap, y, s, s);
  rect(x, y+gap, s, s);
  rect(x, y-gap, s, s);
  ellipse(x-gap+(s/2), y-gap+(s/2), s, s);
  ellipse(x+gap+(s/2), y-gap+(s/2), s, s);
  ellipse(x-gap+(s/2), y+gap+(s/2), s, s);
  ellipse(x+gap+(s/2), y+gap+(s/2), s, s);
}

void draw() {
  background(255);

  float d=dist(mouseX, mouseY, pmouseX, pmouseY);
  
  float x=25;
  for (int across=0; across< 10; across=across+1) {
    float y=25;
    for (int downwards=0; downwards<10; downwards++) {
      pushMatrix();
      snowflake(x, y, 2, d);
      popMatrix();
      y=y+50;
    }
    x=x+50;
  }
  for (int i=0; i<100; i++) {
    speed[i] = speed[i]*0.97;
    rot[i]=rot[i]+speed[i];
  }
}



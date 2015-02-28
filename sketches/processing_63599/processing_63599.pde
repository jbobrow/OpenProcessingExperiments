
float [] rot=new float[100];
float d=dist(mouseX, mouseY, pmouseX, pmouseY);
float[] grow=new float[100];
float[] grow2=new float[100];
float[] boom=new float[100];
float[] wobble=new float[100];
float [] speed=new float[100];
float rad;
float fadespeedbg=0;
float[] fadespeed=new float[100];
float[] number=new float[100];
float[] counter=new float[100];
float[] start=new float[100];
int b=0;
float[] pulsey=new float[100];
float[] pulse=new float[100];
float a=0;
float cir=65;
float[] tran=new float[100];
float[] tran2=new float[100];
float[] indcol=new float[100];
float[] colsel=new float[100];

void setup() {
  size(500, 500);
  smooth();
  while (b<99) {
    indcol[b]=random(20, 200);
    b=b+1;
  }
  b=0;
}

void snowflake(float x, float y, float s, float d) {
  rad=dist(mouseX, mouseY, x, y);
  color col1= color(255, tran[b]);
  color col2= color(255, 38, 0, tran[b]);
  color col5= color(255, tran2[b]);
  color col6= color(random(100, 255), random(240, 255), 255, tran2[b]);
  color col7= color(143, 55, indcol[b], tran[b]);

  if (cir>rad) {
    colsel[b]=1;
  }
  else {
    colsel[b]=2;
  }

  //Ben's Random Stuff
  int nx = (int)x-25;
  int ny = (int)y-25;
  int i= 10*floor(ny/(height/10))+floor(nx/(width/10));
  i = constrain(i, 0, 99);
  println("speed[99]: "+speed[99] + "tran2[b]: "+tran2[b]);
  //Ben's Random Stuff Ends
  if (start[b]!=1) {
    counter[b]=counter[b]+1;
    col5= color(255, tran[b]);
    col6= color(random(100, 255), random(240, 255), 255, tran[b]);
  }

  number[b]=random(0, 100);

  if (number[b]>99&&counter[b]>500) {
    start[b]=1;
    counter[b]=0;
    tran[b]=150;
  }


  if (start[b]==1) {
    if (rad>cir) {
      speed[i] = speed[i]+0.0005;
        if (speed[i]>0.65) {
    grow[b]=grow[b]+0.05;
  }
  else {
    grow[b]=grow[b]-0.5;
  }
  if (grow[b]<0.00001) {
    grow[b]=0;
  }
    }
    if (rad<cir&&boom[b]<10&&speed[i]<0.8) {
      speed[i] = speed[i]*0.9;
    }
    else {
      speed[i]=speed[i]+0.001;
    }
  }
  if (speed[i]>0.8) {
    boom[b]=boom[b]+20;
  }
  if (boom[b]>2000) {
    boom[b]=0;
    start[b]=2;
    speed[i]=0;
    wobble[b]=0;
    grow[b]=0;
    rot[i]=0;
    tran[b]=0;
  }
  translate(x+wobble[b], y+wobble[b]); 
  rotate(rot[i]);
  translate(-x+wobble[b], -y+wobble[b]);
  if (start[b]!=1) {
    tran[b]=tran[b]+counter[b]/900;
    if(tran[b]>150){
     tran[b]=150; 
    }
  }
  pulsey[b]=((cos(pulse[b])+1)*5)/10;
  color col3=lerpColor(col1, col2, speed[i]);
  color col4=lerpColor(col5, col6, pulsey[b]);
  stroke(col3);
  fill(col3);
  layer(x, y, s+grow[b]+grow2[b], 10+boom[b]);
    stroke(col4);
    fill(col4);
  if (rad<cir) {
    grow2[b]=grow2[b]+0.1;
    pulse[b]=pulse[b]+0.2;
    if (grow2[b]>20) {
      grow2[b]=20;
      pulse[b]=-1;
    }else{
     grow2[b]=grow2[b]-0.01;
    pulse[b]=pulse[b]+0.05;
  }
  if (speed[i]<0.001) {
    tran2[b]=tran2[b]+5;
  }
  if (speed[i]>0.001) {
    tran2[b]=tran2[b]-5;
  }
  if (tran2[b]<0) {
    tran2[b]=0;
  }
  if (tran2[b]>200) {
    tran2[b]=200;
  }

  layer(x, y, s+grow[b]+grow2[b], 10+boom[b]-(cos(pulse[b])+1)*5);
  stroke(col3);
  fill(col3);
  if (b<99) {
    b++;
  }
  else {
    b=0;
  }
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
  background(6, 48, 152,50);
  println("d: "+d);

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
    rot[i]=rot[i]+speed[i];
  }
}



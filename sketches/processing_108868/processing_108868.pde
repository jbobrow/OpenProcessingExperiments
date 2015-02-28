
int[] x,y,r;
int num = 150;
int mode;
float vx,vy;

void setup()
{
  int i;
  float v;
  size(500,500);
  background(255);
//  smooth();
  
  x = new int[num];
  y = new int[num];
  r = new int[num];

  vx = (mouseX+0.01-width/2)/200;
  vy = (mouseY+0.01-height/2)/200;
  
  mode = 0;

  for(i=0;i<num;i++){
    v = 100*cos(2*TWO_PI*((i+0.1)/num))+i+width/3;
    x[i] = int(v);

    v = 100*sin(2*TWO_PI*((i+0.1)/num))+i+height/3;
    y[i] = int(v);
    v = 20 * pow(1.005,i);
    r[i] = int(v);
  }
}

void draw()
{
  int i;
  float v;
  color c;
  background(255);
  
  if(mode==0){
    vx = (mouseX+0.01-width/2)/200;
    vy = (mouseY+0.01-height/2)/200;
  }
  c = color(255,255-128*(mouseY+0.01)/height,127*(mouseX+0.01)/width);
  
  fill(0);
  stroke(0);
  strokeWeight(6);
  for(i=0;i<38;i++){
    ellipse(x[i],y[i],r[i],r[i]);
  }
  
  fill(c);
  noStroke();
  for(i=0;i<38;i++){
    ellipse(x[i],y[i],r[i],r[i]);
  }
  
  fill(0);
  stroke(0);
  strokeWeight(6);
  for(i=38;i<76;i++){
    ellipse(x[i],y[i],r[i],r[i]);
  }
  
  fill(c);
  noStroke();
  for(i=38-3;i<76+3;i++){
    ellipse(x[i],y[i],r[i],r[i]);
  }
  
  fill(0);
  stroke(0);
  strokeWeight(6);
  for(i=76;i<105;i++){
    ellipse(x[i],y[i],r[i],r[i]);
  }
  
  fill(c);
  noStroke();
  for(i=76-3;i<105+3;i++){
    ellipse(x[i],y[i],r[i],r[i]);
  }
  
  fill(0);
  stroke(0);
  strokeWeight(6);
  for(i=105;i<149;i++){
    ellipse(x[i],y[i],r[i],r[i]);
  }
  
  fill(c);
  noStroke();
  for(i=105-3;i<149;i++){
    ellipse(x[i],y[i],r[i],r[i]);
  }
  
  fill(0);
  stroke(0);
  strokeWeight(6);
  for(i=149;i<num;i++){
    ellipse(x[i],y[i],r[i],r[i]);
  }
  
  fill(c);
  noStroke();
  for(i=149;i<num;i++){
    ellipse(x[i],y[i],r[i],r[i]);
  }
  
  for(i=0;i<num;i++){
    v = 100*cos(2*TWO_PI*((i+0.1)/num)-((frameCount+0.1)/10))+(i+0.001)*vx+width/2;
    x[i] = int(v);

    v = 100*sin(2*TWO_PI*((i+0.1)/num)-((frameCount+0.1)/10))+(i+0.001)*vy+height/2;
    y[i] = int(v);

  }
}

void mouseClicked()
{
  if(mode == 0){
    mode = 1;
  }else{
    mode = 0;
  }
}


float[] r = new float[256];
float[] x = new float[256];
float[] y = new float[256];
int[] c = new int[256];
int i, j, R = 3, C = 1;

void setup(){
  size(800,600);
  smooth();
}

void draw(){
  background(255);
  rippleDraw();
}

void mousePressed(){
  i++;
  if(i>255){
    i = 0;
  }
  x[i]=mouseX;
  y[i]=mouseY;
  c[i] = (int)random(150);
  r[i] = 0;
}

void rippleDraw(){
  for(j=1;j<=i;j++){
    if(c[j]<230){
      stroke(c[j],c[j],255);
      strokeWeight(2);
      noFill();
      ellipse(x[j],y[j],r[j],r[j]);
      c[j] += C;
      r[j] += R;
    }
    
    if(c[j]<230-C*20){
      if(x[j]-0 < r[j]){
        stroke(c[j]+C*20,c[j]+C*20,255);
        strokeWeight(2);
        noFill();
        ellipse(-x[j],y[j],r[j]-R*4,r[j]-R*4);
      }
    
      if(width-x[j] < r[j]){
        stroke(c[j]+C*20,c[j]+C*20,255);
        strokeWeight(2);
        noFill();
        ellipse(width*2-x[j],y[j],r[j]-R*4,r[j]-R*4);
      }

      if(y[j]-0 < r[j]){
        stroke(c[j]+C*20,c[j]+C*20,255);
        strokeWeight(2);
        noFill();
        ellipse(x[j],-y[j],r[j]-R*4,r[j]-R*4);
      }
    
      if(height-y[j] < r[j]){
        stroke(c[j]+C*20,c[j]+C*20,255);
        strokeWeight(2);
        noFill();
        ellipse(x[j],height*2-y[j],r[j]-R*4,r[j]-R*4);
      }
    }
  }
}

void keyPressed(){
  switch(key){
    case 'q':exit();
    break;
  }
}


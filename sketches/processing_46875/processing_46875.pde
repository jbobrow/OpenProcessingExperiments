
//some pseudo waveform stuff
//eisl.manuel-111124




int dim=30;
float[] x = new float[dim];
float[] y = new float[dim];
float r, g, b;

void setup(){
  background(0,0,0);
  r=random(255);
  g=random(255);
  b=random(255);
  x[0]=(0);
  y[0]=(height/2);
  size(900,400);
  for(int i=1;i<dim;i++){
    x[i]=x[i-1]+(width/dim);
  //  y[i]=random(height/4,height*3/4);
    y[i]=height/2;
  }
}

void draw(){
  newCol();
  stroke(r,g,b,5);
  for(int i=1;i<dim;i++){
    line(x[i-1],y[i-1], x[i],y[i]);
  }
 newcord();
 border();

}

void newcord(){
  for(int i=0;i<dim;i++){
    x[i] += random(-5,5);
    if(i > 0){if(x[i] < x[i-1]){x[i]=x[i-1];}} //überschneidungen verhindern
    y[i] += random(-4,4);
  }
  x[dim-1]=width;
  y[dim-1]=height/2;
  x[0]=0;
  y[0]=height/2;
}

void newCol(){
  r+=random(-10,10);
  g+=random(-10,10);
  b+=random(-10,10);
}

void border(){
  for(int i=0;i<dim;i++){
    if(x[i]<0){x[i]=0;}
    if(y[i]<0){y[i]=0;}
    
    if(x[i]>width){x[i]=width;}
    if(y[i]>height){y[i]=height;}
  }
}

void mousePressed(){
  r=random(255);
  g=random(255);
  b=random(255);
}               


int frame;
int drawpoints;
int elements=1000;
float x[] = new float[elements];
float y[] = new float[elements];


//size
void setup() {
  size(500,500);
}



//return
void mousePressed() {
  drawpoints =0;
}

//array
void mouseDragged() {
  x[drawpoints]=mouseX;
  y[drawpoints]=mouseY;
  drawpoints += 1;
}



//draw
void draw() {
  frame++;
  
  background(200);
  for(int i=1; i<drawpoints; i++){
    
    if(! mousePressed) {  
    float phase = frame / i;
   
    x[i]=x[i]+sin(phase)+random(-10,10);
    y[i]=y[i]+tan(phase)/10;
    }
    
    //FLY
    fill(0,0,0);
    ellipse(x[i],y[i]+6,25,20);
    fill(255,255,255);
   ellipse(x[i]-10,y[i]+6,16,6);
   ellipse(x[i]+10,y[i]+6,16,6);
   fill(255,255,255);
  ellipse(x[i]-5,y[i],10,10);
  ellipse(x[i]+5,y[i],10,10);
  fill(0,0,0);
  ellipse(x[i]-5,y[i],4,4);
  ellipse(x[i]+5,y[i],4,4);
    
    
  }
}

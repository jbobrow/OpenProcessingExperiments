
int w;
int frame;
int drawpoints;
int elements=1000;
float x[] = new float[elements];
float y[] = new float[elements];
float v[] = new float[elements];


void setup() {
    size(800, 800); 
    strokeWeight(1);
    background(255,2);
  
    w=0;

}


void mousePressed() {
  drawpoints =0;
}

void mouseDragged() {
  x[drawpoints]=mouseX;
  y[drawpoints]=mouseY;
  v[drawpoints]=w;
  drawpoints += 1;
}



void draw() {
    // draw brush from perspective of mouse:
     frame++;
     w += 20;
    
     background(200);
    for(int i=1; i<drawpoints; i++){
    
    if(! mousePressed) {  
    float phase = frame / i;
    //int size = (frame+i) ;
    x[i]=x[i]-cos(phase);
    y[i]=y[i]+cos(phase);
    v[i]=v[i]+w;
    }
    
    
    line(v[i], 0, x[i], y[i]);
    line(0,  800-v[i], x[i], y[i]);
    line(800-v[i], 800, x[i],y[i]);
    line(800, v[i], x[i], y[i]);
   
  }

 if(w<100){
   w=0;}
 
   
 }

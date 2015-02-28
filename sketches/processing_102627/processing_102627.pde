
Maxim maxim;
AudioPlayer p1,p2,p3;

int x,y, radio;
float a,f;
float velx,vely,vmax;
int ANCHO,ALTO;
int score, borde;
float ACC;

void setup() {
  ANCHO=300;
  ALTO=600;
  size(300,600);
  x=ANCHO/2;
  y=ALTO/2;
  velx=0;
  vely=0;
  ACC=1.0;
  mouseX=ANCHO/2;
  mouseY=ALTO/2;
  radio=10;
  score=0; 
  vmax=2.0; 
  
  maxim = new Maxim(this);

  // Soundtrack
  p1 = maxim.loadFile("bass_snare.wav");
  p1.setLooping(true);
  p1.play();
  // Boing
  p2 = maxim.loadFile("Boing.wav");
  p2.setLooping(false);
  // Glup
  p3 = maxim.loadFile("Bubble.wav");
  p3.setLooping(false);

}


void draw() {
  frameRate(60);
  p1.play();
  p2.cue(0);  
  background(16,128,48);
  stroke(0);

  // Holes
  noFill();
  ellipse(ANCHO/2,ALTO/4,30,30);
  ellipse(ANCHO/2,3*ALTO/4,30,30);

  fill(0);
  text("Score: "+str(score),ANCHO-textWidth("Score: "+str(score))-15,15);
  // Central cross for reference
  line(ANCHO/2-2*radio,ALTO/2,ANCHO/2+2*radio,ALTO/2);
  line(ANCHO/2,ALTO/2-2*radio,ANCHO/2,ALTO/2+2*radio);

  float ax=map(mouseX,0,ANCHO,-ACC,ACC);
  float ay=map(mouseY,0,ALTO,-ACC,ACC);
  velx+=ax; x+=velx;
  vely+=ay; y+=vely;

  boolean enBorde=false;  
  if (x<radio) {
    if (borde!=1) {
      p2.stop();
      p2.play();
    }
    x=radio;
    velx=0;
    borde=1;
    enBorde=true;
  }
  if (x>ANCHO-radio) {
   if (borde!=3) {
      p2.stop();
      p2.play();
    }
    x=ANCHO-radio;
    velx=0;
    borde=3;
    enBorde=true;
  }
  
  if (y<radio) {
    if (borde!=2) {
      p2.stop();
      p2.play();
    }    
    y=radio;
    vely=0;
    borde=2;    
    enBorde=true;
  }
  if (y>ALTO-radio) {
    if (borde!=4) {
      p2.stop();
      p2.play();
    }
    y=ALTO-radio;
    vely=0;
    borde=4;
    enBorde=true;
  }
  
  if (!enBorde) {
    borde=0;
  }
  
  fill(0,0,255);
  float d1=dist(x,y,ANCHO/2,ALTO/4);
  if (d1<10 && abs(velx)<vmax && abs(vely)<vmax) {
    p3.stop();
    p3.play();
    score+=1;
    x=ANCHO/2;
    y=ALTO/2;
  }
  float d2=dist(x,y,ANCHO/2,3*ALTO/4);
  if (d2<10 && abs(velx)<vmax && abs(vely)<vmax) {
    p3.stop();
    p3.play();
    score+=1;
    x=ANCHO/2;
    y=ALTO/2;    
  }  

  if (d1<d2) {
    p1.speed(map(d1,0,ALTO/2,1.5,1));
  }
  else {  
    p1.speed(map(d2,0,ALTO/2,1.5,1));
  }
  noStroke();
  ellipse(x,y,2*radio,2*radio);
  
}

void mousePressed() {

  x=ANCHO/2;
  y=ALTO/2;
  score=0;  
  
}


  
    
  



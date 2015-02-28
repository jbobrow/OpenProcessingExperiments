
int numCir = 50;
int maxTamano = 90;
int minTamano = 10;


float[][] e = new float[numCir][5];
float ds=15;
int sel = 4;

boolean arrastre=false;


void mouseDragged(){
  arrastre=true;
}
  
void mouseReleased(){
  arrastre=false;
}

void setup(){
  
  frameRate(500);
  size(300,700);
  strokeWeight(1);
  smooth();
  for(int j=0;j< numCir;j++){
    e[j][0]=random(width);  
    e[j][1]=random(height); 
    e[j][2]=random(minTamano,maxTamano);
    e[j][3]=random(-.15,.15); 
    e[j][4]=random(-.5,.5); 
  }
}

void draw(){
   
   background(#090129,10);
   for (int j=0;j< numCir;j++){
   noStroke();
   float radi=e[j][2];
   float diam=radi/5;
    
     if( dist(e[j][0],e[j][1],mouseX,mouseY) < radi ){
      fill(#4412FF,100);
      sel=1;
      
      if(arrastre){
        e[j][0]=mouseX;
        e[j][1]=mouseY;
      }
    } else {
      fill(#00CAFF,100);
      sel=10;
    }
    
    ellipse(e[j][0],e[j][1],radi,radi);
    e[j][0]+=e[j][3];
    e[j][1]+=e[j][4];
    if( e[j][0] < -diam      ){ e[j][0] = width+diam;  } 
    if( e[j][0] > width+diam ){ e[j][0] = -diam;       }
    if( e[j][1] < 0-diam     ){ e[j][1] = height+diam; }
    if( e[j][1] > height+diam){ e[j][1] = -diam;       }
    if(sel==1){
     fill(random(100,150),random(0,10),random(150,256),255);
      stroke(128,255,0,100);
    } else {            
      fill(0,0,0,255);
      stroke(64,128,128,255);
    }
    for(int k=0;k< numCir;k++){
      if( dist(e[j][0],e[j][1],e[k][0],e[k][1]) < radi){
        line(e[j][0],random(mouseY,0),e[k][0],e[k][1]);
      }
    }
    
    noStroke(); 
    fill(random(100,200),90);    
    rect(e[j][0]-ds,e[j][1]-ds,ds*2,ds*2);
  }
}               

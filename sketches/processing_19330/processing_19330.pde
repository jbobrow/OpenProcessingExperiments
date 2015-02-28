
// kof strikes your brain 2011 by golden ratios

ArrayList pos = new ArrayList(0);

float G = (sqrt(5) + 1) / 2.0;
float g = (sqrt(5) - 1) / 2.0;

float A;
float X,Y;

float L = 1;



float H = 300;
float W = H*G;

boolean neg = false;

void setup() {
  size((int)W,(int)H,P2D);
  A = H;
  X = Y = 0;

  noFill();
  stroke(255,35);
  
  smooth();
  
  
}


void draw() {

  
  if(frameCount%4==0){
    neg = !neg;
  }
  
  if(neg){
  background(0);
  
    stroke(255,35); 
  }else{
background(255);
  
    stroke(0,35); 
    
  }
  //for(int i = 0 ;i< 10;i++){
  spiral( W*g, H*g, 0, 1000);
  spiral( width-W*g, H*g, 0, 1000);
  
  spiral( width-W*g, height-H*g, 0, 1000);
  spiral( W*g, height-H*g, 0, 1000);
  
  //}
  
  frame();
  
}

void frame(){
 pushStyle();
 strokeWeight(6);
 noFill();
 stroke(0);
 rect(0,0,width,height);
popStyle(); 
  
}

void spiral(float x,float y,float start,int many){
 X = x;
  Y = y;
  L = start;

  pushMatrix();
  for(int i = 1;i<many;i++) {

    translate(X,Y);
    rotate(radians(noise((frameCount-i)*0.001*g)*60.0+459));


    line(L,0,0,0);
    translate(-X,-Y);
    L+=g;
    X+=L;
  }
  popMatrix(); 
  
}

void keyPressed(){
 println(mouseX); 
}



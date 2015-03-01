
float ep;
float step;
int flag;
float root2 = pow(2,0.5);
boolean go;
float vitess = 0.3;
float buffer=0;
float buffersize=200;

void setup(){
  size(420,410,P2D);
  frameRate(30);
  ep = 10;
  step = 0; flag=1; go=true;
}

void draw(){
  background(255);
  
  stripe(0,0,19,12,PI/2,1);
  stripe(12,0,7,12,0,-1);
  stripe(26,0,22,15,PI/2,-1);
  
  stripe(20,22,25,25,PI/2,-1);
  stripe(18,29,10,10,0,1);
  stripe2(19,5,7*root2,7*root2,-PI/4,1);
  stripe(12,12,15,15,0,1);
  stripe2(12,12,15*root2,15*root2,-PI/4,-1);
  
  stripe(19,0,7,12,0,1);
   
  stripe2(12,26,7*root2,7*root2,PI/4,-1);

  stripe(8,27,10,10,0,1);
  stripe2(5,33,7*root2,7*root2,PI/4*3,1);
  stripe(5,6,7,6,0,1);
  stripe3(5,54,15*root2,15*root2,-PI/4,-1);

  stripe(0,19,5,7,0,1);  
  stripe(0,26,15,7,PI/2,1);
  stripe(5,19,8,7,PI/2,-1);
  stripe2(5,19,7*root2,7*root2,PI/4,1);
  
  stripe(10,39,16,3,0,-1);  
  stripe(27,5,11,7,0,1);
  stripe(28,12,10,4,0,-1);
   
  stripe2(43,23,5*root2,5*root2,-PI/4*3,-1);
  stripe(37,18,1,10,PI,-1);
  
  stripeRect(19,19,9,1,true);
  stripeRect(16,25,3,-1,false);
  
  stripepix(19,28,root2,root2,PI/4,-1);
  stripepix(28,28.05,root2,root2,PI/4,1);

  if (go) {step=step+vitess;}
  if (step>ep) {go=false;step=0;flag*=-1;}
  buffer++;
  if (buffer>buffersize) {buffer=0;go=true;}  
}

void stripeRect(float yn, float xn, float en, int start, boolean large){
  pushMatrix();
  translate(xn*ep,yn*ep);
 
  color c;
  start=start*flag;
  if (start==1) c=0; else c=255;
  for(float i=en;i>=0;i--){
     strokeWeight(0);
     stroke(c);
     fill(c); 
     float rh=i*ep*2+ep+step*2;
     float rectStart=en*ep-ep*i-step;
     if (rectStart<0) {rectStart=0;}
     if (rh>en*ep*2+ep) rh=en*ep*2+ep;
     float rw=rh;
     if (large) rw = rh*1.052;
     rect(rectStart,rectStart,rw,rh);   
     if (c==0) c=255; else c=0;
  }
  popMatrix();
} 

void stripepix(float yn, float xn, float hn, float wn, float an, int start){
  
  pushMatrix();
  translate((xn+hn/2)*ep-ep*root2/2+ep/2,(yn+wn/2)*ep-ep*root2/2+ep/2);
  rotate(an);  
  translate(-wn/2*ep,-hn/2*ep);
    
  float c;
  start=start*flag;
  if (start==1) c=0; else c=255;
  strokeWeight(0);
  stroke(c);
  fill(c); 
  rect(0,0,wn*ep,step);
  if (c==0) c=255; else c=0;
  
  strokeWeight(0);
  stroke(c);
  fill(c); 
  rect(0,0,hn*ep,wn*ep);
  
  popMatrix();
}

void stripe(float yn, float xn, float hn, float wn, float an, int start){
  
  pushMatrix();
  if (an==0 || an==PI) translate((xn+wn/2)*ep,(yn+hn/2)*ep); else translate((xn+hn/2)*ep,(yn+wn/2)*ep);
  rotate(an);  
  translate(-wn/2*ep,-hn/2*ep);
    
  float c;
  start=start*flag;
  if (start==1) c=0; else c=255;
  strokeWeight(0);
  stroke(c);
  fill(c); 
  rect(0,0,wn*ep,step);
  if (c==0) c=255; else c=0;
  
  for (int i=0;i<hn-1;i++){
    strokeWeight(0);
    stroke(c);
    fill(c); 
    rect(0,i*ep+step,wn*ep,ep);
    if (c==0) c=255; else c=0;
  }
  strokeWeight(0);
  stroke(c);
  fill(c); 
  rect(0,(hn-1)*ep+step,wn*ep,ep-step);
  if (c==0) c=255; else c=0;
  popMatrix();

}


void stripe2(float yn, float xn, float hn, float wn, float an, int start){
  float c;
  start=start*flag;
  if (start==-1) c=0; else c=255; 
  
  pushMatrix(); 
  translate(xn*ep,yn*ep); 
  rotate(an);    
  
  float w = wn*ep, h = hn*ep;
  stroke(c);
  fill(c); 
  beginShape();
    vertex(0,0);
    vertex(0,step*root2);
    vertex(step*root2,0);
  endShape();
  
  float dep = ep*root2;
  strokeWeight(0);
  stroke(255-c);
  fill(255-c); 
  beginShape();
    vertex(0,(w+h)/2);
    vertex(0,(w+h)/2-dep);
    vertex((w+h)/2-dep,0);
    vertex((w+h)/2,0);
  endShape();
  if (c==0) c=255; else c=0;

  for ( float ss = step*root2; ss < (w+h)/2-dep; ss += dep ) 
  {
    strokeWeight(0);
    stroke(c);
    fill(c); 
    beginShape();
    // left
    vertex(ss <= h  ? 0   : 0-h+ss,  ss <= h ? ss  : h);
    // top
    vertex(ss <= w  ? ss  : w,   ss <= w ? 0   : 0-w+ss);
    // corner top right
    if ( ss <= w && ss + dep > w )
    vertex( w, 0 );
    // top
    vertex(ss + dep <= w ? ss+dep : w,   ss + dep <= w ? 0   : 0-w+ss+dep);
    // left
    vertex(ss + dep <= h ? 0   : 0-h+ss + dep, ss + dep <= h ? ss+dep : h);
    // corner lower left
    if ( ss <= h && ss + dep >= h )
    vertex( 0, h );
    endShape();
    if (c==0) c=255; else c=0;
  }
  
  
  popMatrix();
}

void stripe3(float yn, float xn, float hn, float wn, float an, int start){
    
  pushMatrix(); 
  translate(xn*ep,yn*ep); 
  rotate(an-PI);    

  float c;
  start=start*flag;
  if (start==1) c=0; else c=255; 
  float x=0,y=0;
  float w = wn*ep, h = hn*ep;
  beginShape();
    vertex(0,0);
    vertex(0,step*root2);
    vertex(step*root2,0);
  endShape(CLOSE);
  
  float dep = ep*root2;
  for ( float ss = step*root2; ss < (w+h); ss += dep ) 
  {
    strokeWeight(0);
    stroke(c);
    fill(c); 
    beginShape();
    // left
    vertex(ss <= h  ? x   : x-h+ss,  ss <= h ? y+ss  : y+h);
    // top
    vertex(ss <= w  ? x+ss  : x+w,   ss <= w ? y   : y-w+ss);
    // corner top right
    if ( ss <= w && ss + dep > w )
    vertex( x+w, y );
    // top
    vertex(ss + dep <= w ? x+ss+dep : x+w,   ss + dep <= w ? y   : y-w+ss+dep);
    // left
    vertex(ss + dep <= h ? x   : x-h+ss + dep, ss + dep <= h ? y+ss+dep : y+h);
    // corner lower left
    if ( ss <= h && ss + dep >= h )
    vertex( x, y+h );
    endShape(CLOSE);
    if (c==0) c=255; else c=0;
  }
  popMatrix();
}



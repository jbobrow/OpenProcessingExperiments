
int xspacing = 8;  
int w;              
float theta = 0.0;
float theta2 = 0.0;
boolean test = false;

float huub, huun, huum;

boolean redtelpress = false;

boolean raiseup, raisedown, thetafast, thetaslow;
float period;
float dx, timer;
int dnasize;
int ending;
float huui;
float[] yvalues;  
float[] tvalues;
float[] linex1;  
float[] linex2;
float[] liney1;  
float[] liney2;
float[] bluedist;
float[] reddist;
float[] bluedisttelo;
float[] reddisttelo;
class dnaswirl {

  float height1;
  float height2;
  float angle1;
int dnastart;
int dnastart2;
int dnaend;
int dnaend2;
 float damp;
 float dtransy, dtransx;
 

  dnaswirl(float dh,float dy,float dz, float da, float ds, float ds2, float de, float de2, int dw){
    period = height/1.5;
 dnasize = height/40;
 xspacing = dnasize/2;
  height1 = dh;
  height2 = dy;
  angle1 = da;
  dnastart = int(ds);
  dnastart2= int(ds2);
  dnaend2 = int(de2);
  dnaend = int(de);
  damp = dz;
  w = dw;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing-dnaend];
  tvalues = new float[w/xspacing-dnaend2];
  linex1 = new float[w/xspacing-dnaend];
  linex2 = new float[w/xspacing-dnaend];
  liney1 = new float[w/xspacing-dnaend];
  liney2 = new float[w/xspacing-dnaend];
bluedist = new float[w/xspacing-dnaend];
  reddist = new float[w/xspacing-dnaend];
  bluedisttelo = new float[w/xspacing-dnaend];
  reddisttelo = new float[w/xspacing];

  }
void update() {

  
  calcWave();
  renderWave();
  
  
 if(dnaend>=dnaend2){
    
    ending = dnaend - dnaend2;
  }
    if(dnaend2<=dnaend2){
    
    ending = dnaend2 - dnaend;
  }


  
}

void sleep() {
  
  sleepcalcWave();
  sleeprenderWave();
//  println(yvalues.length);
}

void telredpressed(){
 
 huun = (width/2 - height1+yvalues[yvalues.length-1]);
   
   dtransx = huun;

     huui = (height/2 - (yvalues.length-1)*xspacing);

   dtransy = huui;
 
translate(-dtransx, dtransy);
scale(huum);

  sleepcalcWave();
  sleeprenderWave();
}
  



void sleepcalcWave() {
  // Increment theta (try different values for 'angular velocity' here
////theta timer////////////
timer += 1;

if (timer >= 0){

thetaslow = false;
thetafast = true;
}

if (timer <= 0){

thetaslow = true;
thetafast = false;
}

if( timer >= 100 ){
  timer = -100;
}

if( thetaslow == true){
  theta += 0.001;
  theta2 += 0.002;

}
if( thetafast == true){
  theta += 0.002;
  theta2 += 0.001;
}

////red strand//////////////////
  // For every x value, calculate a y value with sine function
  float x = theta;

  for (int i = dnastart+1; i < yvalues.length; i++) {

    yvalues[i] = (sin(x+radians(angle1))*damp);
    x+=dx;
  

  }

//blue strand///////////////////////////////////
  float x3 = theta2;

  for (int i = dnastart2+1; i < tvalues.length; i++) {

    tvalues[i] = (sin(-x3+radians(-angle1+40))*damp);
    x3+=dx;
  }
}

void sleeprenderWave() {

  //red ellipse render//
  
  
  for (int x = dnastart+1; x < yvalues.length; x++) {
fill(255,0,0,50);
    ellipseMode(CENTER);
     noStroke();
    ellipse(height1+yvalues[x],x*xspacing,dnasize,dnasize);
    
    linex2[x] = height1+yvalues[x];
    liney2[x] = +x*xspacing;
  }
  

//blue ellipse render

   for (int x = dnastart2+1; x < tvalues.length; x++) { 
      noStroke();
             fill(0,0,255,50);
    ellipseMode(CENTER);
    ellipse(height2+tvalues[x],x*xspacing,dnasize,dnasize);
    
    int xtest = x-1;
 
    if (xtest >= 0){
 
    linex1[x] = height2+tvalues[xtest];
    liney1[x] = xtest*xspacing;
    }
     
  
   }
   
   //render dna lines
for (int x = dnastart+2; x <linex1.length-ending; x++) {
    stroke(100);
    
 
  strokeWeight(0.5);
    
    line(linex1[x], liney1[x], linex2[x], liney2[x]);
  }

}






void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
////theta timer////////////
timer += 1;

if (timer >= 0){

thetaslow = false;
thetafast = true;
}

if (timer <= 0){

thetaslow = true;
thetafast = false;
}

if( timer >= 100 ){
  timer = -100;
}

if( thetaslow == true){
  theta += 0.001;
  theta2 += 0.002;

}
if( thetafast == true){
  theta += 0.002;
  theta2 += 0.001;
}

////red strand//////////////////
  // For every x value, calculate a y value with sine function
  float x = theta;

  for (int i = dnastart+1; i < yvalues.length; i++) {

    yvalues[i] = (sin(x+radians(angle1))*damp);
    x+=dx;
  

  }

//blue strand///////////////////////////////////
  float x3 = theta2;

  for (int i = dnastart2+1; i < tvalues.length; i++) {

    tvalues[i] = (sin(-x3+radians(-angle1+40))*damp);
    x3+=dx;
  }
}

void renderWave() {
//red strand render/////////// linex1.length-dnastart+dnaend; x < linex1.length;
  for (int x = dnastart+1; x < yvalues.length-dnastart+dnaend; x++) {
    noStroke();
    reddist[x] = dist(mouseX, mouseY, height1+yvalues[x], x*xspacing);
    if (reddist[x] <= dnasize){
        stroke(100);
        line(mouseX-dnasize/2, mouseY, mouseX-50, mouseY);
        textSize(height/50);
        fill(0, 100);
        textAlign(RIGHT);
        text("Leading Strand", mouseX-50, mouseY);
        textSize(height/25);
        textAlign(CENTER);
        text("DNA",height1 + damp+ dnasize*4, height/2 );
                line( height1 + damp+ dnasize*4, height/2 - height/25,height1 + damp+ dnasize*4, xspacing*dnastart);
        line( height1 + damp+ dnasize*4, xspacing*dnastart, height1 + damp, xspacing*dnastart);
        line( height1 + damp+ dnasize*4, height/2 + height/25-dnasize,height1 + damp+ dnasize*4, height -  xspacing*dnaend2);
        line( height1 + damp+ dnasize*4, height - xspacing*dnaend2,height1 + damp, height - xspacing*dnaend2 );
      }
    
  }
  
  //red ellipse render//
  
  
  for (int x = dnastart+1; x < yvalues.length; x++) {
fill(255,0,0,50);
    ellipseMode(CENTER);
     noStroke();
    ellipse(height1+yvalues[x],x*xspacing,dnasize,dnasize);
    
    linex2[x] = height1+yvalues[x];
    liney2[x] = +x*xspacing;
  }
  
  //blue strand render///////////////////
for (int x = dnastart; x < tvalues.length; x++) {

    
    bluedist[x] = dist(mouseX, mouseY, height2+tvalues[x], x*xspacing);

      if (bluedist[x] <= dnasize){
        stroke(100);
        line(mouseX+dnasize/2, mouseY, mouseX+50, mouseY);
        textSize(height/50);
        fill(0, 100);
        textAlign(LEFT);
        text("Lagging Strand", mouseX+50, mouseY);
        textSize(height/25);
        textAlign(CENTER);
        text("DNA",height1 + damp+ dnasize*4, height/2 );
                line( height1 + damp+ dnasize*4, height/2 - height/25,height1 + damp+ dnasize*4, xspacing*dnastart);
        line( height1 + damp+ dnasize*4, xspacing*dnastart, height1 + damp, xspacing*dnastart);
        line( height1 + damp+ dnasize*4, height/2 + height/25-dnasize,height1 + damp+ dnasize*4, height -  xspacing*dnaend2);
        line( height1 + damp+ dnasize*4, height - xspacing*dnaend2,height1 + damp, height - xspacing*dnaend2 );
      }

    
  //chemical bonds label render  
    if (height2+tvalues[x] > height1+yvalues[x]){
      
      if ((mouseX > height1+yvalues[x]+dnasize) && (mouseX < height2+tvalues[x]-dnasize)&&(mouseY>x*xspacing-dnasize/2)&&mouseY<x*xspacing+dnasize/2){
        textAlign(CENTER);
        fill(0, 100);
        textSize(height/50);
        text("Chemical Bonds", mouseX, mouseY);
        textSize(height/25);
        
        text("DNA",height1 + damp+ dnasize*4, height/2 );
        stroke(0,100);
        line( height1 + damp+ dnasize*4, height/2 - height/25,height1 + damp+ dnasize*4, xspacing*dnastart);
        line( height1 + damp+ dnasize*4, xspacing*dnastart, height1 + damp, xspacing*dnastart);
        line( height1 + damp+ dnasize*4, height/2 + height/25-dnasize,height1 + damp+ dnasize*4, height -  xspacing*dnaend2);
        line( height1 + damp+ dnasize*4, height - xspacing*dnaend2,height1 + damp, height - xspacing*dnaend2 );
      }}
    
    if (height2+tvalues[x] < height1+yvalues[x]){
      
      if ((mouseX < height1+yvalues[x]-dnasize) && (mouseX > height2+tvalues[x]+dnasize)&&(mouseY>x*xspacing-dnasize/2)&&mouseY<x*xspacing+dnasize/2){
         textAlign(CENTER);
         textSize(height/50);
        fill(0, 100);       
        text("Chemical Bonds", mouseX, mouseY);
        textSize(height/25);
        text("DNA",height1 + damp+ dnasize*4, height/2 );
        stroke(0,100);
        line( height1 + damp+ dnasize*4, height/2 - height/25,height1 + damp+ dnasize*4, xspacing*dnastart);
        line( height1 + damp+ dnasize*4, xspacing*dnastart, height1 + damp, xspacing*dnastart);
        line( height1 + damp+ dnasize*4, height/2 + height/25-dnasize,height1 + damp+ dnasize*4, height -  xspacing*dnaend2);
        line( height1 + damp+ dnasize*4, height - xspacing*dnaend2,height1 + damp, height - xspacing*dnaend2 );
      }}
  
      
} 

//blue ellipse render

   for (int x = dnastart2+1; x < tvalues.length; x++) { 
      noStroke();
             fill(0,0,255,50);
    ellipseMode(CENTER);
    ellipse(height2+tvalues[x],x*xspacing,dnasize,dnasize);
    
    int xtest = x-1;
 
    if (xtest >= 0){
 
    linex1[x] = height2+tvalues[xtest];
    liney1[x] = xtest*xspacing;
    }
     
  
   }
   
   //render dna lines
for (int x = dnastart+2; x <linex1.length-ending; x++) {
    stroke(100);
    
 
  strokeWeight(0.5);
    
    line(linex1[x], liney1[x], linex2[x], liney2[x]);
  }
  
  //blue telomere label//
for (int x = 0+dnastart2; x < dnastart; x++) {
 bluedisttelo[x] = dist(mouseX, mouseY, height2+tvalues[x], x*xspacing);
 
 if (bluedisttelo[x]<=dnasize){
   fill(0,100);
   textSize(height/50);
   line(mouseX-dnasize/2, mouseY, mouseX-50, mouseY);
   textAlign(RIGHT);
    text("Telomere", mouseX-50, mouseY);
 }
}

//red telomere label//
 for (int x = linex1.length-dnastart+dnaend; x < linex1.length; x++) {
 reddisttelo[x] = dist(mouseX, mouseY, height1+yvalues[x], x*xspacing);

 if (reddisttelo[x]<=dnasize/2){
   fill(0,100);
   stroke(0,100);
   textSize(height/50);
   line(mouseX+dnasize/2, mouseY, mouseX+50, mouseY);
   textAlign(LEFT);
    text("Telomere", mouseX+50, mouseY);
    
 }
 
  if ((reddisttelo[x]<=dnasize)&&(mousePressed)){
    redtelpress = true;
    
 }
 

 }

}
//interactive options//////////
void redtelpress(){
  
  
}
  


//final class end
}



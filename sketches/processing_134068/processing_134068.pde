

Straw[ ] myStraws;

//wind
int xspacing = 5;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 60.0;  // Height of wave
float period = 1500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
float waveHeight =70;


void setup(){
  size(750,400);
  myStraws = new Straw[80];
  for( int i=0; i < myStraws.length; i=i+1){
    
   float rootX =map( i, 1, myStraws.length-1, 0, width ) ;
   myStraws[i] = new Straw(rootX);
    
   
      w = width+100;
      
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];

  }
}

void draw(){
  background(255);
  
  // background
  if (key =='b') {
    background(0,20); 
  }
  
  if (key =='w') {
    background(255,20); 
  }
  
    if (key =='g') {
    background(110,20); 
  }
  
   if (keyPressed ==true) {
   boolean a = true;
   if (a == true)
   { background(255);
   a=false;}
   else{
     background(0);
     a=true;}
   
    
  }

  for( int i=0 ; i <myStraws.length ; i=i+1){    
     myStraws[i].display();
  }
 
 
 //Wind
  calcWave();
  renderWave();
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.03;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}



void renderWave() {
  noStroke();
  fill(#36A3FF);
  // A simple way to draw the wave with an ellipse at each location
 

 if (pmouseX-mouseX<1) {
    for (int x = 0; x < yvalues.length; x ++) {
    ellipse(x*xspacing*1.1, waveHeight+yvalues[x]*0.9+mouseX*0.20, 1.5, 1.5);
    ellipse(x*xspacing*1.1, waveHeight+yvalues[x]*1.2+mouseX*0.14, 1.5, 1.5);
    ellipse(x*xspacing*1.1, waveHeight+yvalues[x]*1+mouseX*0.16, 1.5, 1.5);  
    ellipse(x*xspacing*1.1, waveHeight+yvalues[x]*1+mouseX*0.17, 1.5, 1.5);
    ellipse(x*xspacing*1.1, waveHeight+yvalues[x]*1.8+mouseX*0.23, 1.5, 1.5);
   }
 }
else if(mouseX-pmouseX<1){
for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing*1.1, waveHeight+yvalues[x]*0.9+mouseX*0.14, 1.5, 1.5);
    ellipse(x*xspacing*1.1, waveHeight+yvalues[x]*1.2+mouseX*0.1, 1.5, 1.5);
    ellipse(x*xspacing*1.1, waveHeight+yvalues[x]*1+mouseX*0.1, 1.5, 1.5);  
      ellipse(x*xspacing*1.1, waveHeight+yvalues[x]*1+mouseX*0.11, 1.5, 1.5);
    ellipse(x*xspacing*1.1, waveHeight+yvalues[x]*1.8+mouseX*0.13, 1.5, 1.5);
} 
 }
}

class Straw {
 
  float rootX = 0;
  float rootY =0;
  float strawLength = 230;
  float fattness = 0.02;
  // constr5uctor
  Straw( float theX ){
    rootX = theX;
    rootY = height;
  }
  
  void display () {
   
    float endpointX = rootX;
    float endpointY = rootY-strawLength;
   
    float mousediffX = mouseX-rootX;
    float mousedistX = abs( mousediffX);
     
     if(mousedistX < 250) {
        float offsetX = map(mousedistX, 0, 250, 80, 0);
       if (mousediffX < 0) {
         endpointX = endpointX +offsetX;
       }else{        
          endpointX = endpointX - offsetX;
        } 
     } 
    
     fill(#3CF052);
     noStroke();
    
    beginShape();
    vertex(rootX, rootY); 
    bezierVertex( rootX-strawLength*fattness, rootY-strawLength*0.5, endpointX, endpointY, endpointX, endpointY);
    bezierVertex( endpointX, endpointY,  rootX+strawLength*fattness, rootY-strawLength*0.5, rootX, rootY);      
    endShape();
     
  }
}

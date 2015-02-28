
int valorrandom;
 
 
int n=5;
float x[ ] = new float [n];
float y[ ] = new float [n];
 
PFont [] tiposlocos = new PFont [5]; 
float v=0.05; 
 
void setup(){
 
size(800,800);
 
valorrandom =int(random(0,4));
 
tiposlocos[0]=createFont("Cambria-Bold",1);
 

tiposlocos[2]=createFont("Garamond",1);

tiposlocos[4]=createFont("Cochin",1);
 
tiposlocos[3]=createFont("Chalkboard",1);

tiposlocos[1]=createFont("CenturyGothic",1);
 

 
 
 
}
 
void draw() {
   
  background(50);

 
x[0] +=v* (mouseX-x[0]); 
y[0] +=v* (mouseY-y[0]);
 
 

 
for(int i=1; i<n; i++) { 
x[i] +=v*(x[i-1]-x[i]); 
y[i] +=v*(y[i-1]-y[i]);
}
 
for(int i=0; i<n; i++) {
  textFont(tiposlocos[i],48);
text("Emilio", x[i],y[i]);
}
 
}

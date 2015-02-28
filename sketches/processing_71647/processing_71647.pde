
int valor;
 
 
int n=5;
float x[ ] = new float [n];
float y[ ] = new float [n];
 
PFont [] tipos = new PFont [10]; 
float v=0.05; 
 
void setup(){
 
size(700,700);
 
valor =int(random(0,10));

 
tipos[0]=createFont("AmericanTypewriter-CondensedLight-48",1);
 
tipos[1]=createFont("BlairITC-Medium-48.vlw",1);
 
tipos[2]=createFont("BookmanOldStyle-Italic-48.vlw",1);
 
tipos[3]=createFont("Consolas-BoldItalic-48.vlw",1);
 
tipos[4]=createFont("Copperplate-Light-48.vlw",1);
 
 
 //declaras tipo prenombrada y tamaño
}
 
void draw() {
   
  background(0);
 
x[0] +=v* (mouseX-x[0]); 
y[0] +=v* (mouseY-y[0]);
 

 
for(int i=1; i<n; i++) { 
x[i] +=v*(x[i-1]-x[i]); 
y[i] +=v*(y[i-1]-y[i]);
}
 

 
for(int i=0; i<n; i++) {
  textFont(tipos[i],70);
  fill(random(255),random(255),random(255));
text("Fernanda", x[i],y[i]);
}
 
}

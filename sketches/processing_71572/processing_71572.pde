
int valueran;
int n=5;
float x[ ] = new float [n];
float y[ ] = new float [n];

PFont [] tiposlocos = new PFont [5];
float v=0.05; 

void setup(){

size(800,600);

valueran =int(random(0,4));


tiposlocos[0]=createFont("Impact",1);

tiposlocos[1]=createFont("ArialMT",1);

tiposlocos[2]=createFont("Cambria-Bold",1);

tiposlocos[3]=createFont("Calibri-Italic-48",1);

tiposlocos[4]=createFont("Gabriola",1);


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
fill (random(255),random(3),random(11));
textFont(tiposlocos[i],100);
text("Mireya", x[i],y[i]);
}

}

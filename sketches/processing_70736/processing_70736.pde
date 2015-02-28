
int n=200;
float x[] = new float[n];
float y[] = new float[n];

PFont letra;
float v=0.8;

void setup() {
  size(800,600);
  letra=createFont("Mistral",1);
  textFont(letra,48);
}


void draw () {
  background(102);
  
  x[0] += v * (mouseX - x[0]);
    y[0] += v * (mouseY - y[0]);
    
    for (int i=1; i<n; i++){
      
        x[i]+= v * (x[i-1] - x[i]);
        y[i]+= v * (y[i-1] - y[i]);
    }
    
    for(int i=0; i<n; i++){
      text("JAYPJAYPJAYPJAYPJAYPJAYPJAYPJAYPJAYPJAYPJAYPJAYPJAYP", x[i], y[i]);
    }
    
}


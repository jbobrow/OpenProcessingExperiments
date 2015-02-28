
int n=5;
float x [] =new float [n];
float y [] =new float [n];

PFont letra; 
float v=0.06;

PFont[] tipos=new PFont [5];



void setup(){
  size (800,600);
  
tipos[0]= createFont("Cambria-Bold",1);
tipos[1]= createFont("CenturyGothic",1);
tipos[2]= createFont("Garamond",1);
tipos[3]= createFont("Constantia-Bold",1);
tipos[4]= createFont("CooperBlackMS",1);
  

  
}

void draw () {
  
  background(102);
  
  x[0] += v * (mouseX - x [0]);
  y[0] += v * (mouseY - y [0]);
  
  for(int i=1; i<n; i++) {
    x[i] += v * (x[i-1] - x [i]);
    y[i] += v * (y[i-1] - y [i]);
  }
  for(int i=0; i<n; i++) {
    
    textFont (tipos[i],48);
    
    text("Hola", x[i],y[i]) ;
  }
  
}


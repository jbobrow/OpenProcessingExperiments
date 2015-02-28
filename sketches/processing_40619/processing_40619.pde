

int totalpoints = 20;
int [] x= new int [totalpoints];
int [] y = new int [totalpoints];


void setup () {
  size (500,500);
  smooth();
  frameRate(10);

  
  
  
}

void draw () {
  background (#C0EDBF); 
  
 
//shift everything down by one 
  for (int i = x.length-1; i >0; i--) {
   x[i] = x [i-1];
  y [i] = y [i-1];
   
  }
  
  x[0]= mouseX; 
  y[0]= mouseY; 
  
  for (int i=x.length-1; i > 0; i --) {
    fill(#A8DAF5-i, #C2ECED);
  
  for (int j=0; j < i; j +=5) {
  ellipse (x[i], y [i], 5*j, 5*j);
  ellipse (x[i], y [i], 10*j, 10*j);
  }
  }  


}


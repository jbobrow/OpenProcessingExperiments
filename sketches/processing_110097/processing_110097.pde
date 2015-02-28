
size(1000, 1000);
background(255);

int n=0;
int m=50;
float x=1;
float y=1;

for (int i=0; i<35; i++) {

  strokeWeight(1);
  if (i%2==0) {
    strokeWeight(3);
  }


  bezier(n, 0, m, 0, x*(n-50), 1000, y*(m-50), 1000);
  


  for (int j=0; j<10; j++) {
    float a=n+30;
    float b=m+20;
    bezier(n*a, 0, m*b, 0, x*(n*a-50), 1000, y*(m*b-50), 1000);
    
      
    // if the increment is < 1 reset making a pattern
    
    //if (increment<1) {
     // increment = 10;}
    }
    n+=30;
  m+=20;
  x*=1.2;
  y*=1.2;
}




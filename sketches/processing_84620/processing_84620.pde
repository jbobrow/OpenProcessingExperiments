
void setup()
{
  size(500,500);
  background(250);  
}


void draw ()
{
  
  int H;
  H = 50;
  
  int A;
  A = 120;

  
  noStroke();
 
 translate (250, 250);
 
// Création des rectangles, disposition en spirale grâce à ROTATE

fill(10, 100);

rotate(PI/1);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/2);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/3);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/4);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/5);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/6);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/7);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/8);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/9);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/10);
rect(0, 0, H, A);
rect(H, H, A, A);
 
   
 noLoop(); 
}



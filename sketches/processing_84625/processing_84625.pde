
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
 
 translate (200, 200);
 
 
// Création des rectangles, disposition en spirale grâce à ROTATE

fill(150, 2);

scale(0.5);
rotate(PI/100);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/200);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/300);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/400);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/500);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/600);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/700);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/800);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/900);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/1000);
rect(0, 0, H, A);
rect(H, H, A, A);


// ROTATE valeurs négatives

rotate(PI/-100);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/-200);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/-300);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/-400);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/-500);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/-600);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/-700);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/-800);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/-900);
rect(0, 0, H, A);
rect(H, H, A, A);

rotate(PI/-1000);
rect(0, 0, H, A);
rect(H, H, A, A);
 
   
 noLoop(); 
}



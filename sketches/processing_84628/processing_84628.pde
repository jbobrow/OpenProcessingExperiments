
void setup()
{
  size(500,500);
  background(250);  
}


void draw ()
{
  
   int H;
  H = 138;
  
  int A;
  A = 270;

  
  noStroke();
 
 translate (100, 150);
 
 
// Création des rectangles, disposition en spirale grâce à ROTATE

fill(150, 5);

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


// ellipse, fonction ROTATE et nouvelle tonalité

fill(10, 1);

rotate(PI/100);
ellipse(0, 0, H, A);
ellipse(H, H, A, A);

rotate(PI/200);
ellipse(0, 0, H, A);
ellipse(H, H, A, A);

rotate(PI/300);
ellipse(0, 0, H, A);
ellipse(H, H, A, A);

rotate(PI/400);
ellipse(0, 0, H, A);
ellipse(H, H, A, A);

rotate(PI/500);
ellipse(0, 0, H, A);
ellipse(H, H, A, A);

rotate(PI/600);
ellipse(0, 0, H, A);
ellipse(H, H, A, A);

rotate(PI/700);
ellipse(0, 0, H, A);
ellipse(H, H, A, A);

rotate(PI/800);
ellipse(0, 0, H, A);
ellipse(H, H, A, A);

rotate(PI/900);
ellipse(0, 0, H, A);
ellipse(H, H, A, A);

rotate(PI/1000);
ellipse(0, 0, H, A);
ellipse(H, H, A, A);
 
   
 noLoop(); 
}



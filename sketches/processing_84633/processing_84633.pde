
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
 
 translate (250, 350);
 
 for (int i=0 ; i<360 ; i+=30)
 {
 
 
// Création des rectangles, disposition en spirale grâce à ROTATE
// multiplication des formes grâce à Boucle FOR 

fill(3, 2);
scale(2.2, 1.3);

rotate(PI/100);
rect(i, 0, H, A);
rect(H, H, A, A);

rotate(PI/200);
rect(i, 0, H, A);
rect(H, H, A, A);
 
rotate(PI/300);
rect(i, 0, H, A);
rect(H, H, A, A);

rotate(PI/400);
rect(i, 0, H, A);
rect(H, H, A, A);

rotate(PI/500);
rect(i, 0, H, A);
rect(H, H, A, A);

rotate(PI/600);
rect(i, 0, H, A);
rect(H, H, A, A);

rotate(PI/700);
rect(i, 0, H, A);
rect(H, H, A, A);

rotate(PI/800);
rect(i, 0, H, A);
rect(H, H, A, A);

rotate(PI/900);
rect(i, 0, H, A);
rect(H, H, A, A);

rotate(PI/1000);
rect(i, 0, H, A);
rect(H, H, A, A);
 
 
// ellipse, fonction ROTATE et nouvelle tonalité


rotate(PI/100);
ellipse(0, i, H, A);
ellipse(H, H, A, A);

rotate(PI/200);
ellipse(0, i, H, A);
ellipse(H, H, A, A);

rotate(PI/300);
ellipse(0, i, H, A);
ellipse(H, H, A, A);

rotate(PI/400);
ellipse(0, i, H, A);
ellipse(H, H, A, A);

rotate(PI/500);
ellipse(0, i, H, A);
ellipse(H, H, A, A);

rotate(PI/600);
ellipse(0, i, H, A);
ellipse(H, H, A, A);

rotate(PI/700);
ellipse(0, i, H, A);
ellipse(H, H, A, A);

rotate(PI/800);
ellipse(0, i, H, A);
ellipse(H, H, A, A);

rotate(PI/900);
ellipse(0, i, H, A);
ellipse(H, H, A, A);

rotate(PI/1000);
ellipse(0, i, H, A);
ellipse(H, H, A, A);
}
   
 noLoop(); 
}




void setup()
{
  size(500,500);
  background(200);  
}


void draw ()
{
  
  //Création d'une trame d'une seule ligne faite de rectangles
  for(int i = 25; i < 500; i = i+50)
  
  //Créations d'une succession de rotation de rectangles en dégradé de gris
  {
    fill(0);
    rotate(PI/10);
    rect(0, 0, 100, 100);
    fill(50);
    rect(10, 10, 200, 200);
    fill(100);
    rect(20, 20, 300, 300);
    fill(150);
    rect(30, 30, 400, 400);
    fill(200);
    rect(40, 40, 500, 500);
    fill(220);
    rect(50, 50, 600, 600);
    fill(250);
    rect(60, 60, 700, 700);
  }
  
 noLoop(); 
}




void setup()
{
  size(500, 500);
  background(255);
  
}
 
void draw()
{

  background(240);       
  noStroke();
  fill(0);
  pushMatrix();
  
  //Bewegung
  translate(200, 250); 
  fill(#2CE0E8);  
  float winkel= map(mouseY,0,3000,0,1.5*PI);     
  rotate(winkel);
               
  rect (0, 0, 100, 20);   
  fill(17, 100, 16);
  
  popMatrix();
  resetMatrix();
  
  //Nicht Bewegt

  noStroke();
  fill(0);

  //Reihe Waagerecht  
  rect(200, 10, 100, 20);
  rect(200, 40, 100, 20);
  rect(200, 70, 100, 20);
  rect(200, 100, 100, 20);
  rect(200, 130, 100, 20);
  rect(200, 160, 100, 20);
  rect(200, 190, 100, 20);
  rect(200, 220, 100, 20);
  rect(200, 340, 100, 20);
  rect(200, 370, 100, 20);
  rect(200, 400, 100, 20);
  rect(200, 430, 100, 20);
  rect(200, 460, 100, 20);
  
  //Reihe Senkrecht
  rect(10, 10, 2, 480);
  rect(20, 10, 2, 480);
  rect(30, 10, 2, 480);
  rect(40, 10, 2, 480);
  rect(50, 10, 2, 480);
  rect(60, 10, 2, 480);
  rect(70, 10, 2, 480);
  rect(80, 10, 2, 480);
  rect(90, 10, 2, 480);
  rect(100, 10, 2, 480);
  rect(110, 10, 2, 480);
  rect(120, 10, 2, 480);
  rect(130, 10, 2, 480);
  rect(140, 10, 2, 480);
  rect(150, 10, 2, 480);
  rect(160, 10, 2, 480);
  rect(170, 10, 2, 480);
  rect(180, 10, 2, 480);
  
  rect(320, 10, 2, 480);
  rect(330, 10, 2, 480);
  rect(340, 10, 2, 480);
  rect(350, 10, 2, 480);
  rect(360, 10, 2, 480);
  rect(370, 10, 2, 480);
  rect(380, 10, 2, 480);
  rect(390, 10, 2, 480);
  rect(400, 10, 2, 480);
  rect(410, 10, 2, 480);
  rect(420, 10, 2, 480);
  rect(430, 10, 2, 480);
  rect(440, 10, 2, 480);
  rect(450, 10, 2, 480);
  rect(460, 10, 2, 480);
  rect(470, 10, 2, 480);
  rect(480, 10, 2, 480);
  rect(490, 10, 2, 480);
  
}

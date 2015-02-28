
void setup()
{
  size(500, 500);
  background(#000000);
  
}
 
void draw()
{

  //Bewegung  
  translate(0, 200);
  background(#000000);
       
  noStroke();
  fill(#2CE0E8);
  ellipse(mouseX, 0, 50, 50);
  ellipse(mouseX, 100, 50, 50);
  
  //Erste Reihe
  translate(-0, -200);
  fill(255);
  ellipse(50, 50, 50, 50);
  ellipse(150, 50, 50, 50);
  ellipse(250, 50, 50, 50);
  ellipse(350, 50, 50, 50);
  ellipse(450, 50, 50, 50);
  
  //Zweite Reihe
  ellipse(50, 150, 50, 50);
  ellipse(150, 150, 50, 50);
  ellipse(250, 150, 50, 50);
  ellipse(350, 150, 50, 50);
  ellipse(450, 150, 50, 50);
 
  //Dritte Reihe
  ellipse(50, 250, 50, 50);
  ellipse(150, 250, 50, 50);
  ellipse(250, 250, 50, 50);
  ellipse(350, 250, 50, 50);
  ellipse(450, 250, 50, 50);
  
  //Vierte Reihe
  ellipse(50, 350, 50, 50);
  ellipse(150, 350, 50, 50);
  ellipse(250, 350, 50, 50);
  ellipse(350, 350, 50, 50);
  ellipse(450, 350, 50, 50);
  
  //F¸nfte Reihe
  ellipse(50, 450, 50, 50);
  ellipse(150, 450, 50, 50);
  ellipse(250, 450, 50, 50);
  ellipse(350, 450, 50, 50);
  ellipse(450, 450, 50, 50);
   
    
}


//Project1 copyright Harris Mazur
//data sourced from milik on manyeyes.com

//Mouse click on any circle to see which meat is being illustrated by each fat to protein ratio.
//This visualization illustrates the ratio of fat to protein in various meats through color and size.

//Data
String [ ] food= {"Bacon", "Beef", "Chicken", "Cod", "Crab", "Duck", "Eel", "Goose", "Halibut", "Ham", "Hamburger", "Heart", "Herring", "Lamb", 
"Lobster", "Marrow", "Mussels", "Pork Chops", "Rabbit", "Salami", "Salmon", "Sausage", "Tongue", "Turkey"};
float [ ] energy= { 500, 280, 220, 100, 130, 190, 200, 320, 130, 120, 260, 240, 200,
200, 350, 120, 7, 90, 330, 90, 330, 90, 500, 200, 320, 290, 170};
float [ ] protein= {23, 24, 23, 21, 20, 25, 21, 29, 24, 18, 20, 26, 20, 
24, 22, 0, 17, 29, 14, 19, 20, 13, 20, 28};
float [ ] fat= {45, 21, 14, 1.2, 5, 10, 13, 22, 4, 5, 17, 15, 13, 29, 3.5, 98, 0, 24,
4, 45, 13, 25, 24, 6.5};
float [ ] xCoords= { 30, 130, 230, 330, 430, 530, 30, 130, 230, 330, 430, 530, 30, 130, 230, 330, 430, 530, 30, 130, 230, 330, 430, 530}; 
float [ ] yCoords= { 100, 100, 100, 100, 100, 100, 200, 200, 200, 200, 200, 200, 300, 300, 300, 300, 300, 300, 400, 400, 400, 400, 400, 400};
float [ ] diam;
PFont font;
//color [ ] c= {color(100,  
float a= 255;
void  setup ( )
{
  size(650, 500);
  font= loadFont ("Helvetica-11.vlw");
  textFont (font);
  textSize (18);
  imageMode(CENTER);
  smooth();
  fill (255);
  noStroke ( );
  background (255);
  
  //Title of Visualization
  fill (200, 50, 50);
  text ("MEAT", 15,30);
  textSize(12);
  text ("RED", 140, 30);
  fill (150);
  text ("        TO                  = LOW TO HIGH FAT", 100, 30);
  text ("       TO                  = LOW TO HIGH PROTEIN", 350, 30);
  textSize (10);
  fill (50);
  text ("SMALL", 330, 30);
  textSize (16);
  text ("BIG", 385, 30);
  textSize (12);
  fill (50, 50, 100);
  text ("BLUE", 80, 30);
  
}

void draw ( )
{
  drawCircles ( );
}

 void drawCircles ( )   
//Circles to represent each fat to protein ratio.
{  
  for (int j=0; j<fat.length; j++) {
    float b=50;
    color c= color((fat[j] *3), 0, b, 50);
    fill (c);
    ellipseMode (CENTER);
    ellipse (xCoords [j]+(width/20), yCoords [j]+(height/30), protein [j] *2+80,protein [j] *2+80);
    }
    
}


void mousePressed ( )
{
  //if ratio circle is clicked on, information about type of meat and nutritional facts appear
  for (int i=0; i<fat.length; i++) {
  //  if (color c= color (
   if (dist (mouseX, mouseY, xCoords [i]+(width/20), yCoords [i]+ (height/30)) < protein [i]+40){     
    fill (255);
    textAlign(CORNER,CENTER);
    textSize (11);
    text ( food [i], xCoords [i]+width/45, yCoords [i]- height/30 );
    textAlign(CORNER, CENTER);
    text ( "kCals =" + energy [i], xCoords [i], yCoords [i] );
    text ( "Protein(g) =" + protein [i], xCoords [i], yCoords [i] + height/30);
    text ( "Fat(g) =" + fat [i], xCoords [i], yCoords [i] + 2*(height/30));
    noLoop ( );
     }
   }
}
void mouseReleased ( )
{
  loop ( );
}



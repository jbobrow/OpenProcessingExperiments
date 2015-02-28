
           
             void setup()
{
  size(640,360);
}

void draw()
{
 
  background(236,218,190);//definition couleur fond
  noStroke();
  fill(random(191),random(132),random(120));
  triangle(0,0,191,0,0,63);//premier triangle couleur marron sans contour
  noStroke();
  fill(random(232),random(214),random(167));
  quad(0,63,191,0,306,0,0,108); //quadrilatère de couleur jaune sans contour
  noStroke();
  fill(random(83),random(59),random(49));
  triangle(25,100,188,40,227,251); //2ème triangle de couleur noir sans contour
  stroke(79,65,57);
  noFill();
  quad(188,40,212,32,253,239,227,251); //2ème quadrilatère vide sans couleur
  noStroke();
  fill(random(255),random(46),random(41));
  quad(372,146,640,106,640,360,490,360);
 
  
}


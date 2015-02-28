
/** Dessine un text sur un arc de cercle 
 * entrées : 
 * txt : text à afficher
 * x,y : coordonnées du centre du cercle
 * startAngle : angle de départ
 * endAngle : angle de fin
 */
void arcText(String txt, float x, float y, float rayon, float startAngle, float endAngle)
{
  int l=txt.length(); //the length of the string
  float angleStep = (endAngle - startAngle)/l;
   
  if (txt==null)
    return;
  if (l<=0)
    return;

  // now for every char of the string calculate the position on the arc
  for (int i=0;i<l;i++) {
    float angle = startAngle + angleStep*i;
    float xC=cos(angle)*rayon;
    float yC=sin(angle)*rayon;   
    pushMatrix();
    translate(x+xC, y+yC);
    rotate(angle+PI/2);
    char c=txt.charAt(i);
    text(c, 0, 0);
    popMatrix();
  }
}




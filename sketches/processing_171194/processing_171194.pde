
void setup()
{
  size(500, 500);
  background (0, 60, 130);
  translate(width/2, height/2);
}
  
  
void draw()
{
  background (0, 60, 130); //frisches Wasser
  
  
 pushMatrix(); //_______________________________________________STUNDEN BLASE____________________________
  translate(width/2, height/2);
  
  float bigbubble = map(hour(), 0, 24, 0, 4*PI);
 rotate(bigbubble);
 
 stroke(#C1DCFF);
 fill(#C1DCFF);
 ellipse(0,-220, 40, 40);
 fill(255);
 ellipse(0,-220, 30, 30);
 fill(#C1DCFF);
 ellipse(-5,-220,25,30);
 popMatrix(); //_________________________________________________________________________________________
 
 pushMatrix(); //_______________________________________________MINUTEN BLASE____________________________
  translate(width/2, height/2);
  
  float smallbubble = map(minute(), 0, 59, 0, 2*PI);
 rotate(smallbubble);
 
 stroke(#C1DCFF);
 fill(#C1DCFF);
 ellipse(0,-140, 20, 20);
 fill(255);
 ellipse(0,-140, 15, 15);
 fill(#C1DCFF);
 ellipse(-5,-140,12,15);
 popMatrix(); //_________________________________________________________________________________________
 
 
  
  
 pushMatrix(); // ______________________________________________BLUBBI____________________________________
  translate(width/2, height/2);
 float schwimm = map(second(), 0, 59, 0, 2*PI);
 rotate(schwimm);
 
 stroke(#FF8827);
 fill(#FF8827);
 ellipse(0, -100, 50, 50);             //Körper
 ellipse(27, -105, 10, 10);        //Oberlippe
 ellipse(27, -95, 10, 10);        //Unterlippe
 triangle(-25, -100, -50, -75, -50, -125); //Schwanzflosse
 triangle(-5, -125, -5, -135, 5, -125); //Rückenflosse
 
 fill(0);
 ellipse(10, -110, 7, 7);        //Auge
 fill(255);
 stroke(255);
 ellipse(10, -112, 2, 2);        //Augenrefexion
 
 popMatrix(); //____________________________________________________________________________________________


}
  

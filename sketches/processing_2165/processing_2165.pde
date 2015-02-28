
void setup() 
{
  size(600, 600);  
  background(255);  
  strokeWeight(1);
  smooth();
  loop();
}
  int farbe = 150;  //Farbbereich waehlen
  float treffpunkt = 3.6;    //treffpunkte waehlen
  
  int x = 0;    //Mitteltreffpunkt                                
  int y = 0;  
  int a = farbe, b = 0, c = 0;    //Anfangsfarben
  int blackwhite;    //Hintergrundfarbe
  
void draw() {
   
    x = (int)random(width/treffpunkt, width-width/treffpunkt);    //Treffpunkte
    y = (int)random(height/treffpunkt, height-height/treffpunkt);

    stroke(random(a),random(b),random(c));    //Farbe waehlen

    line(x, y, width/45, height/2);    //Eckpunkte  
    line(x, y, width-width/45, height/2);    
    line(x, y, width/2, width/45);
    line(x, y, width/2, height-width/45);
    
    line(x, y, width/8, height-width/8);  //Seiten -und Oberpunkte
    line(x, y, width-width/8, width/8);
    line(x, y, width-width/8, height-width/8);  
    line(x, y, width/8, width/8);
      if (x < width/treffpunkt+30){
      
      blackwhite = (int)random(5);    //Hintergrund durch Zufall bestimmen        
      if (blackwhite == 0){
        background(255);
          

      }
      else {
        background(0);
      }
    }
  
   
}

void mousePressed() {

    a = (int)random(farbe);    //neue Farbkombination waehlen
    b = (int)random(farbe);
    c = (int)random(farbe);

  
      

}



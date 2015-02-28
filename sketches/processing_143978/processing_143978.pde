
float pili = TWO_PI;//Kreis
color[] farben = {#00CD00, #FFFFFF, #3A5FCD, #BABABA, #8B4513, #DAA520, #FFD700}; //meine Farbauswahl fÃ¼r DIE SICHERHEIT 
 
void setup() {
  size(500, 500);
  noStroke();
  colorMode(HSB, 500, 500, 250);
}
 
void draw() {
  background(#D3D3D3);
  int s = second();
  
if (mousePressed == true)
    {
      background (0);
 for (int i=0; i<360; i+=s/2)
       {
   float x1 = mouseX/4+sin( 10* (i+1)); //verstreuungen
   float y1 = mouseY/2+cos(10 * (i));
    
    fill(farben[i%3]);//3Farben fÃ¼llen
    pushMatrix();
    translate(width/2,height/2);  
    rotate(radians(i));
    rect(x1, y1, 100, 100);
    popMatrix();
  }  
    }
    
    else if (mousePressed == false)
    {
 for (int i=0; i<360; i+=s/2)
  {
   float x1 = mouseX/4+cos( 10* (i+1)); //verstreuungen
   float y1 = mouseY/2+sin(10 * (i));
    
    fill(farben[i%7]);//7Farben fÃ¼llen
    pushMatrix();
    translate(width/2,height/2);  
    rotate(radians(i));
    arc(x1, y1, 200, 200, (PI*1.5), (PI*1.5)+(pili/8));
    popMatrix();
  }  
    }
}


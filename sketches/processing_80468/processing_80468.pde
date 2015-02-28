
PFont tipo_letra;
  int tam = 1;
  int posx = 0;
  void setup()
      {
        size(800,400);
      }
  void draw()
      {
        background(0);
        tipo_letra=loadFont("Arial-BoldItalicMT-48.vlw");
        textFont(tipo_letra, tam);
        text("Gerardo",0,250);
        tam ++;
        posx = posx + 4;
        if(posx == 800) 
           noLoop();
      
      }



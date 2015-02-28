
PImage menu;
color c;

void setup()
  {
    size(500, 550);
    menu=loadImage("menu.png");
    background(255);
  }
  
void draw()
  {
    image(menu, 0, 0);
    noStroke();
    rect(301, 0, 49, 49);
    stroke(c);
    fill(c);
    text("Premi il tasto c per cancellare tutto.", 300, 540);
    
    //LINEA SOTTILE
    if (mousePressed && mouseY<50 && mouseX>350 && mouseX<393)
      {
        strokeWeight(5);
      }
     //LINEA SPESSA 
     else if (mousePressed && mouseY<50 && mouseX>393 && mouseX<457)
       {
         strokeWeight(10);
       }
       
    //GOMMA   
    if (mousePressed && mouseY<50 && mouseX>457)
      {
        c=255;
      }    
    
    //PRENDE IL COLORE DAL COLORPICKER
    if (mousePressed && mouseY<50 && mouseX<300)
      {
        c=menu.get(mouseX, mouseY);
        fill(c); //RIEMPIE IL RETTANGOLINO CHE INDICA IL COLORE SELEZIONATO
        stroke(c); //ASSEGNA ALLA LINEA IL COLORE PRESO COL METODO get()
      }
      
    //TRACCIA LA LINEA   
    if (mousePressed && mouseY>50)
      {
        line(mouseX, mouseY, pmouseX, pmouseY);
      }
  }
  
void keyPressed()
  {
    //IL TASTO C CANCELLA TUTTO
    if (keyCode==67)
    background(255);
  }



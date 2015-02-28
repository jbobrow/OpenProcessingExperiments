
color rektangelFarg;
int rektangelStorlek;
boolean visaOlikBakgrund;
int bild;
 
void setup()
{
  size (400,400); // Storlek på fönster
  rektangelFarg = color(random(300), random (300), random(300));
  rektangelStorlek = (int) random(20, 250);
  if ((int) random (2) == 1) {
    visaOlikBakgrund = true;
  }
  else {
    visaOlikBakgrund = false;
  }
  rectMode (CENTER);
  bild = 1;
}
 
void draw ()
{
  
  background (200); // Bakgrund
  if (bild==1) {
    if (visaOlikBakgrund) {
      fill (300, 100, 175); //Färg
rect (0, 0, width*2, height);
fill (50, 125, 200);
rect (200, 300, width, height/2);
    }
    fill (rektangelFarg); rect (width/2, height/2, rektangelStorlek, rektangelStorlek);
    
// Ändraknapp
fill(255);
rect(200, 350, 100, 35);
fill(0);
text("Ändra", 185, 355);
  }
  else if (bild == 2) {
    fill (255); // Vit färg
    rect (35, 40, 20, 20); // Knapp för mindre rektangel
    rect (90, 40, 20, 20); // Knapp för större rektangel
    
    // Nedanstående fill ändrar knappen till nuvarande färg
    
    fill (red(rektangelFarg), green(rektangelFarg), blue(rektangelFarg));
    
   rect (145, 95, 80, 30); // Knapp för annan färg på rektangeln
   fill (0); // Svart text
   text ("-", 35, 45); // Minustecken
   text (rektangelStorlek, 55, 45); // Visar storleken
   text ("+", 88, 45); // Plustecken
   
   // Nedanstående visar färgerna i RGB färger
   
   text ("r: " + red(rektangelFarg),25, 80);
   text ("g: " + green(rektangelFarg),25, 100); 
   text ("b: " + blue(rektangelFarg),25, 120);
   
   fill (255); // Vit färg
   rect (100, 350, 100, 30); // Tillbakaknapp 
   fill (0); // Svart färg
   text ("Tillbaka", 80, 355); // Text
   text ("Ändra Färg", 115, 99); // Text
  }
}
void mousePressed(){
  if(bild == 1){
    
if(mouseIsInside(150, 334, 250, 368)){
      bild = 2;
    }
  }else if(bild == 2){
           if(mouseIsInside(25, 31, 45, 51)){ // Minus
      rektangelStorlek = rektangelStorlek - 4; // Minska rektangeln
    }else if(mouseIsInside(80, 30, 100, 51)){ // Plus
      rektangelStorlek = rektangelStorlek + 4; // Öka rektangeln
      }else if(mouseIsInside(105, 82, 185, 112)){ // Färgändring
      rektangelFarg = color(random(300), random (300), random(300)); // Byter färg
    }else if(mouseIsInside(52, 336, 152, 366)){ // Tillbaka
      bild = 1; // Byter till första skärmen
    }
  }
}boolean mouseIsInside(int x1, int y1, int x2, int y2) {
  if (mouseX>x1 && mouseY>y1 && mouseX < x2 && mouseY < y2) {
    return true;
  }
else { 
    return false;
  }
}


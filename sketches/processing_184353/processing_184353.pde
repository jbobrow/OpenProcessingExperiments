

void setup () {
  size(500, 500);
  // noStroke(); se non voglio il contorno delle forme geometriche
  // noLoop(); se non vuoi il loop devi mettere il comando noLoop nella sezione setup
  //noStroke();

  /* un altro modo per cambiare forma a seconda della posizione del mouse ( a parte questo 
   if(mouseX < 250){
   ellipse(mouseX, mouseY, 100, 100);
   }
   else {
   rect(mouseX -50, mouseY -50, 100, 100);
   //rect(mouseX, mouseY, 100, 100); 
   è questo:
   */

  //CENTER
  //CORNER
  rectMode(CENTER);
}

// loop with a frame-rate of 60
void draw () {

  /*     il comando BACKGROUND serve a impostare lo sfondo = ogni volta che il loop inizia si pulisce lo sfondo 
   (quindi impostarlo se non si vuole la ripetizione dell'oggetto
   TIPOLOGIE DI COLORAZIONE DELLO SFONDO: 
   1 background(color)
   2 background(greyscale)
   3 background(r,g,b)
   */

  // background(200); IMPOSTARE COLORE BACKGROUNG

  //richieste al programma: if the mouse is pressed then the ellipse change color (example)

  if (mousePressed) {
    // fill (red, green, blue, alpha);
    //fill(0, 90, 200);
    fill(mouseY, mouseX, 500-mouseX);
  } else {
    fill(255, 255, 2);
  }

  //println(framecount);

  // if (frameCount%10==0) {}
  /* rect oppure ellipse(x, y, width, height)
   //mouseX = fa muovere le coordinate dell'oggetto in base al movimento del mouse
   mouseY = fa muovere le coordinate dell'oggetto in base al movimento del mouse
   ellipse(mouseX, mouseY, 100, 100);
   */

  //CAMBIARE LA FORMA DELL'OGGETTO A SECONDA DELLA POSIZIONE DEL PUNTATORE: sempre la condizione dell' if, else. 
  //Si indica nella parentesi dell'if se il mouse si trova a meno o a più dalle coordinate in pixel della posizione del mouse


  if (mouseX < 250) {
    ellipse(mouseX, mouseY, 100, 100);
    //per farlo scomparire quando si muove il mouse a sinistra il comando è qui:
    //noCursor();
  } else {
    //rect(mouseX -50, mouseY -50, 100, 100); per cambiare l'origine del rettangolo che mi appare a sinistra rispetto al mouse.
    rect(mouseX, mouseY, 100, 100); //se voglio che il cerchio si trasformi in rettangolo quando vado a sinistra
    //cursor();
  }
}


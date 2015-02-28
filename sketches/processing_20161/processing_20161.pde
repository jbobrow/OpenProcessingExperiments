
public class Gradient {

  int x;
  int y;

  int originalX = 128;
  int originalY = 80;
  boolean subir = true;
  int paso = 1;
  int sX = 128;
  int sY = 80;

  boolean on = true;

  public void enter() {
    first = true;
  }

  public Gradient() { // inicializaci�n
    x = DIMX / 2;
    y = DIMY / 2;
    background(255);
    frameRate(25);
  }

  public boolean first = true;

  private void tunnel() {
    if (paso >= DIMY / 2) {
      subir = false;
    } 
    else if (paso <= 0) {
      subir = true;
    }

    if (subir)// sube
    {
      fill((int) (paso * 255 / DIMY * 2), 0, 0);
      stroke((int) (paso * 255 / DIMY * 2), 0, 0);
      rect(x - paso, y - paso, sX, sY);
      sX = sX + 5;
      sY = sY + 5;
      paso = paso + 5 / 2;
    } 
    else {// baja
      fill((int) (paso * 255 / DIMY * 2), 0, 0);
      stroke((int) (paso * 255 / DIMY * 2), 0, 0);
      rect(x - paso, y - paso, sX, sY);
      sX = sX - 5;
      sY = sY - 5;
      paso = paso - 5 / 2;
    }
  }

  public void draw() {

    if (first) {
      background(255);
      first = false;
    }
    if (on) {
      tunnel();
    } 
    else {
      paso = 1;
      sX = originalX;
      sY = originalY;
      // background(255);
      fill(255, 255, 255);
      rect(x, y, originalX, originalY);
    }
    returnToMenu(4);
  }

  public void mouseClicked() {
    on = !on;
  }

  /**
   	 * int original=1;
   boolean subir=true;
   int paso=1;
   int s=100;
   
   boolean on=false;
   
   
   void setup() {  // inicializaci�n
   background(255);
   size(300, 300); 
   frameRate(25);
   } 
   
   void draw() 
   {
   //println(key);
   //if((mouseX>=100) && (mouseX<=200) && (mouseY>=100) && mouseY<=200)
   if(on)
   {
   //background(255); 
   
   if(paso>=100)
   {
   println("sube pasa a false");
   subir=false;
   }
   else if(paso<=0)
   {
   println("sube pasa a true");
   subir=true;
   }
   
   if(subir)//sube
   {
   println("subo");
   fill((int)(paso*2.55),0,0);
   stroke((int)(paso*2.55),0,0);
   rect(100-paso, 100-paso, s, s);
   s=s+2;
   paso=paso+1;
   }
   else
   {//baja
   println("bajo");
   fill((int)(paso*2.55),0,0);
   stroke((int)(paso*2.55),0,0);
   rect(100-paso, 100-paso, s, s);
   s=s-2;
   paso=paso-1;
   }
   }
   else
   {
   paso=1;
   s=original;
   background(255); 
   fill(255,255,255);
   rect(100, 100, original, original);
   }
   }
   
   void mouseClicked()
   {
   on=!on;
   }
   	 */
}


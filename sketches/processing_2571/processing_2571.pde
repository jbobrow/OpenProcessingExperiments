


class Bola {
  
   // Atributs
   public float radi;
   public float x;
   public float y;
   private color col;
   
   public float velx;        // velocitat en x
   public float vely;        // velocitat en y
   
   
   /** Mètodes */
   
   /**
    * Constructor
    */
   public Bola(float x, float y, float radi) {
     this.radi = radi;
     this.x = x;
     this.y = y;
     this.velx = floor(constrain(random(5), 2, 5));
     this.vely = floor(constrain(random(5), 2, 5));
     
     // Comprovacions de seguretat
     if (x+radi >= width) {
       this.x = width-radi;
     } else if (x-radi <= 0) {
       this.x = radi;
     }

     if (y+radi >= height) {
       this.y = height-radi;
     } else if (y-radi <= 0) {
       this.y = radi;
     }
     
     this.changeColor();
   }
   
   
   /**
    * Metode de dibuixar la bola per pantalla
    */
   public void dibuixaBola() {
      noStroke();
      fill(col);
      
      ellipse(this.x, this.y, this.radi*2, this.radi*2);
   }
   
   /**
    * Actualitza la posicio i velocitats de la vola
    */
   public void actualitzaPosicio() {
     
     // Movem la bola
     this.x += velx;
     this.y += vely;
     
     // Comprovacio de les posicions
     if (x+radi >= width) {
       this.x = width-radi;
       this.velx *= -1;
       
       this.changeRadi(-1);
       
     } else if (x-radi <= 0) {
       this.x = radi;
       this.velx *= -1;
       
       this.changeRadi(-1);
     }

     if (y+radi >= height) {
       this.y = height-radi;
       this.vely *= -1;
       
       this.changeRadi(-1);
       
     } else if (y-radi <= 0) {
       this.y = radi;
       this.vely *= -1;
       
       this.changeRadi(-1);
     }
   }
   
   public void changeColor() {
     this.col = color(floor(random(255)), floor(random(255)), floor(random(255)));
   }
   
   
   public void setVelocitat(float vx, float vy) {
     this.velx = vx;
     this.vely = vy;
   }
   
   
   public void changeRadi(float val) {
     
     if ((val > 0 && this.radi < 12) || (val < 0 && this.radi > 6)) {
       this.radi += val;
     } 
   }
   
  
}


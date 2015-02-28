
import ddf.minim.AudioPlayer;
import ddf.minim.Minim;
import processing.core.*;


  String path = "";
  
  float rSfondo =   0;
  float gSfondo = 200;
  float bSfondo = 255;
  float alphaSfondo;
  Nuvola[] nuvole;
  float hTrampolino;
  float lTrampolino;

  Spinta spinta;
  
  boolean caduto = false;
  
  Mongolfiera[] mongol;
  
  NaveVolante ship;
  BaroneRosso barone;


  Minim minim;
  AudioPlayer[] songBR;   
  final static String MOSQUITO = "Mosquito.mp3";
  final static String ELICOTTERO = "elicottero.mp3";

  AudioPlayer songOmino;   
  final static String YELLYEEHA = "yell4yeeha.mp3";
  
  Postino posta;
  
  Onde onde;
  
  void setup() {
    size(800,400, P3D);
    noStroke();
    alphaSfondo=256;
    hTrampolino = 100;
    lTrampolino = 100;
    nuvole = new Nuvola[20];
    for (int i = 0; i<nuvole.length; i++) {
      nuvole[i] = new Nuvola();
      nuvole[i].load();
    }
    mongol = new Mongolfiera[8];
    for (int i = 0; i<mongol.length; i++) {
      mongol[i] = new Mongolfiera();
      mongol[i].load();
    }

    barone = new BaroneRosso();
    barone.load();

    //omo = new Omino();
    spinta = new Spinta();
    spinta.load();
    
    ship = new NaveVolante();
    ship.load();
    
    posta = new Postino();
    posta.load();
    
    minim = new Minim(this);
    songBR = new AudioPlayer[2];
    songBR[0] = minim.loadFile(path + MOSQUITO);
    songBR[1] = minim.loadFile(path + ELICOTTERO);
    
    songOmino = minim.loadFile(path + YELLYEEHA);
    
    onde = new Onde();
  }
  void draw() {
    background(255, 255);
    muoviNave();
    if (caduto) avanzaNave();
    
    omino();
    mongolfiere();
    postino();
    redBaron();
    nubi();
    trampolino();
    nave();
    onde();
    sfondo();
  }
  public void onde() {
    onde.display();
  }
  
  public void sfondo() {
    for (int i = 0; i<height-1; i++) {
      fill(rSfondo, gSfondo, bSfondo, i/alphaSfondo);
      rect(0, i, width, i+1);
    }
  }
  public void nubi() {
    for (int i = 0; i<nuvole.length; i++) {
      nuvole[i].display();
    }
  }
  public void mongolfiere() {
    for (int i = 0; i<mongol.length; i++) {
      mongol[i].display();
    }
  }
  public void postino() {
    posta.display();
}
  public void nave() {
      ship.display();
  }
  public void redBaron() {
    barone.display();
    barone.play();
  }
  
  public void trampolino() {
      fill(175, 110, 70);
      rect(0, hTrampolino, lTrampolino, 5);
  }
  public void omino() {
//    omo.display();
    spinta.display();
  }
  public void muoviNave() {
//    omo.move();
	if (mousePressed) {
	    if (caduto) return;
	    spinta.move();
	    if (spinta.x_omino<lTrampolino-spinta.dim) {
	      ship.x_nave = spinta.x_omino + 10;
	      ship.display();
	    } else  {
	      caduto = true;
	    }   	
	}
    if (mousePressed) { 
	  spinta.play();
    } else {
	  spinta.stop();
    }
    return;

  }
  private void avanzaNave() {
    spinta.ritorna();
    if (ship.dim>10) {
      ship.x_nave +=2.5;
      ship.y_nave +=random(1 , 5);//1;
      ship.dim -= 0.25F;
      ship.display();
      if (songOmino.isPlaying())
        spinta.stop();
    } else {
      caduto = false;
      ship.load();
    }
  }
  class Nuvola  {
    final static String NUBE = "nuvola.jpg";
    float x_nube, y_nube;
    PImage img;
    Pioggia[] rain;
    float dim_w, dim_h;
    public Nuvola() {
      x_nube = random(0, width);
      y_nube = random(0, height);
      rain = new Pioggia[50];
      for (int i = 0; i<rain.length; i++) {
        rain[i] = new Pioggia();
      }
      
    }
    public void load() {
      PImage old_img = loadImage(path + NUBE);
      old_img.loadPixels();
      img = createImage(old_img.width, old_img.height, ARGB);
      img.loadPixels();
      for (int y = 0; y < old_img.height; y++) {
        for (int x = 0; x < old_img.width; x++) {
          int loc = x + y * old_img.width;
          float r = red(old_img.pixels[loc]);
          float g = green(old_img.pixels[loc]);
          float b = blue(old_img.pixels[loc]);
          img.pixels[loc] = color(r, g, b, 75);
        }
      }
      img.updatePixels();
      dim_w = random(img.width/4, img.width);
      dim_h = random(img.height/4, img.height);
    }
    public void display() {
      x_nube+=random(1, 5);
      float x = x_nube%width;
      image(img, x, y_nube);
    }
    public void creaPioggia() {
      for (int i = 0; i<rain.length; i++) {
        rain[i].goccia();
        rain[i].scende();
      }
    }
    class Pioggia {
      float x_pioggia, y_pioggia;
      public Pioggia() {
        x_pioggia = x_nube+5;
        y_pioggia = y_nube+5;
      }
      public void scende() {
        y_pioggia+=5;
      }
      public void goccia() {
        for (int i = 0; i<3;i++) {
          fill(0);
          ellipse(x_pioggia, y_pioggia-i, 5-i, 5-i);
        }
      }
      // end pioggia
    }
    // end nuvole
  }

  class Spinta {
    final static String OMINO = "spinta.jpg";

    float x_omino, y_omino;
    float x_max, x_min;
    PImage img;
    float dim;

    public Spinta() {
      x_min = 0;
      x_omino = x_min;
      x_max = lTrampolino-10;
    }
    public void load() {
      PImage old_img = loadImage(path + OMINO);
      old_img.loadPixels();
      img = createImage(old_img.width, old_img.height, ARGB);
      img.loadPixels();
      for (int y = 0; y < old_img.height; y++) {
        for (int x = 0; x < old_img.width; x++) {
          int loc = x + y * old_img.width;
          float r = red(old_img.pixels[loc]);
          float g = green(old_img.pixels[loc]);
          float b = blue(old_img.pixels[loc]);
          if (r > 230 && g > 230 && b > 230) {
            r = 255;
            g = 255;
            b = 255;
            img.pixels[loc] = color(r, g, b, 50);
          } else {
            img.pixels[loc] = color(r, g, b);
          }
        }
      }
      img.updatePixels();
      dim = img.height/2;
      y_omino = hTrampolino-25;
    }
    public void display() {
      image(img, x_omino, y_omino, dim, dim);
    }
    
    public void move() {
      if (x_omino<lTrampolino-dim)
        x_omino +=2;
    }
    public void ritorna() {
      if (x_omino>x_min)
        x_omino -=2;
    }
    public void play() {
      if (!songOmino.isPlaying())
    	  songOmino.loop();
    }
    public void stop() {
      songOmino.pause();
    }
    
  }
  
  
  class Mongolfiera  {
    final static String MONGOLFIERA = "mongolfiera.jpg";
    float x_mong, y_mong;
    PImage img;
    float dim;
    
    public Mongolfiera() {
      x_mong = random(0, width);
      y_mong = random(0, height);
    }
    public void load() {
      PImage old_img = loadImage(path + MONGOLFIERA);
      old_img.loadPixels();
      img = createImage(old_img.width, old_img.height, ARGB);
      img.loadPixels();
      for (int y = 0; y < old_img.height; y++) {
        for (int x = 0; x < old_img.width; x++) {
          int loc = x + y * old_img.width;
          float r = red(old_img.pixels[loc]);
          float g = green(old_img.pixels[loc]);
          float b = blue(old_img.pixels[loc]);
          if (r > 230 && g > 230 && b > 230) {
            r = 255;
            g = 255;
            b = 255;
            img.pixels[loc] = color(r, g, b, 400);
          } else {
            img.pixels[loc] = color(r, g, b);
          }
        }
      }
      img.updatePixels();
      dim = random(img.height/2, img.height);
    }
    public void display() {
      y_mong+=random(1, 5);
      float y = y_mong%height;
      image(img, x_mong, y, dim, dim);
      if (dim<0) {
        dim = random(img.height/2, img.height);
      } else {
        dim -=0.5F;
      }
    }
  }
  
// class naveVolante
  class NaveVolante  {
    final String[] DASPINGERE = {"500.jpg", "balena.jpg", "hamburgher.jpg"};
    float START_DIM;
    float  START_X_POS;
    float  START_Y_POS;
    float x_nave, y_nave;
    PImage[] img;
    float dim;
    int idx;
    
    public NaveVolante() {
      img = new PImage[DASPINGERE.length];
      PImage[] old_img = new PImage[DASPINGERE.length];
      
      for (int i = 0; i<DASPINGERE.length; i++) {
        old_img[i] = loadImage(path + DASPINGERE[i]);
        old_img[i].loadPixels();
        img[i] = createImage(old_img[i].width, old_img[i].height, ARGB);
        img[i].loadPixels();
        for (int y = 0; y < old_img[i].height; y++) {
          for (int x = 0; x < old_img[i].width; x++) {
            int loc = x + y * old_img[i].width;
            float r = red(old_img[i].pixels[loc]);
            float g = green(old_img[i].pixels[loc]);
            float b = blue(old_img[i].pixels[loc]);
            if (r > 230 && g > 230 && b > 230) {
              r=255;
              b=255;
              g=255;
              img[i].pixels[loc] = color(r, g, b, 120);
            } else {
              img[i].pixels[loc] = color(r, g, b);
            }
          }
        }
        img[i].updatePixels();
      }
    }
    public void load() {
      idx = (++idx)%DASPINGERE.length;
      START_DIM = img[idx].height;
      START_X_POS = spinta.x_min + spinta.dim;
      START_Y_POS = hTrampolino-START_DIM;
      
      dim = START_DIM;
      x_nave = START_X_POS;
      y_nave = START_Y_POS;
      
    }
    public void display() {
      pushMatrix();
      translate(x_nave, y_nave);
      image(img[idx], 0, 0, dim, dim);
      popMatrix();
    }
  }  
  
//class naveVolante
 class BaroneRosso  {
   final static String BARONE = "baroneRosso.jpg";
   final static String ALIANTE = "aereo.jpg";//HAMBURGHER = "hamburgher.jpg";
   
   float x_bar, y_bar;
   PImage[] img;
   float dim;
   int idx;
   public void load() {
     img = new PImage[2];
     idx = 0;
     // barone
     PImage old_img = loadImage(path + BARONE);
     old_img.loadPixels();
     img[0] = createImage(old_img.width, old_img.height, ARGB);
     img[0].loadPixels();
     for (int y = 0; y < old_img.height; y++) {
       for (int x = 0; x < old_img.width; x++) {
         int loc = x + y * old_img.width;
         float r = red(old_img.pixels[loc]);
         float g = green(old_img.pixels[loc]);
         float b = blue(old_img.pixels[loc]);
         if (r > 230 && g > 230 && b > 230) {
           r=255;
           b=255;
           g=255;
           img[0].pixels[loc] = color(r, g, b, 120);
         } else {
           img[0].pixels[loc] = color(r, g, b);
         }
       }
     }
     img[0].updatePixels();
     
//     dim = img[0].height/2;
     x_bar = 5.0F;
     y_bar = 30;

     
     // panino
     old_img = loadImage(path + ALIANTE);
     old_img.loadPixels();
     img[1] = createImage(old_img.width, old_img.height, ARGB);
     img[1].loadPixels();
     for (int y = 0; y < old_img.height; y++) {
       for (int x = 0; x < old_img.width; x++) {
         int loc = x + y * old_img.width;
         float r = red(old_img.pixels[loc]);
         float g = green(old_img.pixels[loc]);
         float b = blue(old_img.pixels[loc]);
         if (r > 230 && g > 230 && b > 230) {
           r=255;
           b=255;
           g=255;
           img[1].pixels[loc] = color(r, g, b, 120);
         } else {
           img[1].pixels[loc] = color(r, g, b);
         }
       }
     }
     img[1].updatePixels();
     
//     dim = img[1].height;
     x_bar = 5.0F;
     y_bar = 30;
     
     
     
   }
   public void display() {
     if (x_bar>width) {
       x_bar=5.0F;
       idx = ++idx%2;
     }
     x_bar += 5;
     pushMatrix();
     translate(x_bar, y_bar);
     if (idx == 0) {
       dim = img[idx].height/2;
       rotate(radians(random(0, 90)));
     } else {
       rotate(radians(random(0, 20)));    	 
       dim = img[idx].height/4;
     }
     image(img[idx], 0, 0, dim, dim);
     popMatrix();
   }
   public void play() {
     if (songBR[(idx+1)%2].isPlaying())
    	 songBR[(idx+1)%2].pause();
     
     if (!songBR[(idx)].isPlaying())
    	 songBR[idx].loop();
   }
 }  
// end class  
//class naveVolante
class Postino  {
  final static String POSTINO = "gabbianoPostino.jpg";
  float x_post, y_post;
  PImage img;
  float dim;

  public void load() {
    PImage old_img = loadImage(path + POSTINO);
    old_img.loadPixels();
    img = createImage(old_img.width, old_img.height, ARGB);
    img.loadPixels();
    for (int y = 0; y < old_img.height; y++) {
      for (int x = 0; x < old_img.width; x++) {
        int loc = x + y * old_img.width;
        float r = red(old_img.pixels[loc]);
        float g = green(old_img.pixels[loc]);
        float b = blue(old_img.pixels[loc]);
        if (b > 200) {
//        if (b>200) {
          r=255;
          b=255;
          g=255;
          img.pixels[loc] = color(r, g, b, 400);
        } else {
          img.pixels[loc] = color(r, g, b);
        }
      }
    }
    img.updatePixels();
    
    dim = img.height/2;
    x_post = width;
    y_post = 200;
    
  }
  public void display() {
    if (x_post<0)
      x_post = width;
    x_post -= 5;
    pushMatrix();
    translate(x_post, y_post);
    rotate(radians(random(0, 30)));
//    image(img, x_bar, y_bar, dim, dim);
    image(img, 0, 0, dim, dim);
    popMatrix();
  }
}  
//end class  
class Onde  {
  final static String ONDE = "onde.jpg";
  float x_onde, y_onde;
  PImage img;
  float dim;
  public Onde() {
    img = load();
    x_onde = 0;
    y_onde = height - img.height;
  }
  private PImage load() {
    PImage old_img = loadImage(path + ONDE);
    old_img.loadPixels();
    img = createImage(old_img.width, old_img.height, ARGB);
    img.loadPixels();
    for (int y = 0; y < old_img.height; y++) {
      for (int x = 0; x < old_img.width; x++) {
        int loc = x + y * old_img.width;
        float r = red(old_img.pixels[loc]);
        float g = green(old_img.pixels[loc]);
        float b = blue(old_img.pixels[loc]);
        img.pixels[loc] = color(r, g, b, 400);
      }
    }
    img.updatePixels();
    return img;
  }
  public void display() {
    image(img, x_onde, y_onde);
  }
}  
//end class  





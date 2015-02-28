

/*******************************************************
 * l'idea è quella di creare un mosaico di pixel in    * 
 * cui scomporre l'immagine. I tasselli vengono quindi *
 * disposti in modo casuale sulla tavolozza (canvas)   * 
 * e ricomposti a ritmo di musica.
 * 
 * Galatea delle sfere è un dipinto di Salvador Dalí realizzato nel 1952. 
 * Raffigura Gala Dalí, moglie e musa di Salvador Dalí, ricostruita attraverso una matrice di sfere. 
 * Galatea, il nome,  si riferisce ad una ninfa del mare della mitologia classica famosa per la sua virtù, 
 * e può anche fare riferimento alla statua amata dal suo creatore, Pigmalione re di Cipro.
 * La tela misura 65,0 x 54,0 cm, e raffigura la testa e le spalle di Gala composto 
 * da una matrice di sfere apparentemente sospese nello spazio. 
 * la musica è tratta da un progetto curato da Stewart Copeland e presente all'indirizzo:http://www.elbtonalpercussion.de/164-0-plays-stewart-copeland.html
 *******************************************************/

import ddf.minim.analysis.*;
import ddf.minim.*;

  private String path = "";
  private PImage img;
  private Tessera[] mosaico;
  private int division;
  private Music music;
  private PFont f;
  void setup() {
    size(640, 640);
    f = loadFont("BickhamScriptPro-Semibold-48.vlw");
    
    division = 64;
    img = loadImage(path + "Dali_Galatea_640x640.jpg");
    img.loadPixels();
    int larghColonna = img.width / division;
    int altColonna = img.height / division;
    // istanzio l'array di tessere
    mosaico = new Tessera[division * division];
    for (int i = 0; i < mosaico.length; i++) {
      mosaico[i] = new Tessera(createImage(img.width / division, img.height / division, RGB));

      float X = random(0, img.width - larghColonna);
      float Y = random(0, img.width - altColonna);
      // setto le posizioni casuali
      mosaico[i].setPosX(X);
      mosaico[i].setPosY(Y);
      mosaico[i].x = X;
      mosaico[i].y = Y;
      mosaico[i].getImg().loadPixels();
    }
    // disegno le tessere
    _disegna();
    
    // avvio la musica
    music = new Music(this);
    music.suona();
  }

  void draw() {
    background(255);
    int idx = 0;
    for (int l = 0; l < mosaico.length; l++) {
      pushMatrix();
      translate(mosaico[idx].getPosX(), mosaico[idx].getPosY());
      image(mosaico[idx++].getImg(), 0, 0);
      popMatrix();
    }


    if (music.getSong().isPlaying()) {
      riOrdina();
    } 
    /*
    else  {
      music.stop();
    } */ 
    /*
      // evento esterno che mi permette di interrompere e far ripartire l'animazione
      // si tratta di un qualsiasi rumore 
      if (music.getLevel() > 200) { // batto le mani
      println(music.getLevel());
      music.pause = !music.pause;
      music.pausePlay();
      }*/
      textFont(f, 36);
      fill(0);
      text("Dalì", random(0, width), random(0, height));
  }

  void riOrdina() {
    for (int l = 0; l < mosaico.length; l++) {
      mosaico[l].ritrovaPosizione();
    }
  }
  
  void mouseClicked()  {
      music.pause = !music.pause;
      music.pausePlay();
  }
  
  void _disegna() {
    // sconpongo l'immagine originale e mi salvo le posizioni corrette dei tasselli
    int larghColonna = img.width / division;
    int altColonna = img.height / division;
    int idx = 0;

    for (int l = 0; l < img.width; l += larghColonna) {
      for (int a = 0; a < img.height; a += altColonna) {
        mosaico[idx].setImgX(a);
        for (int y = l; y < l + larghColonna; y++) {
          for (int x = a; x < a + altColonna; x++) {
            int loc = (x) + (y) * img.width;
            int loc0 = (x - a) + (y - l) * mosaico[idx].getImg().width;
            // println(loc + " - " + loc0);
            float r = red(img.pixels[loc]);
            float g = green(img.pixels[loc]);
            float b = blue(img.pixels[loc]);
            mosaico[idx].getImg().pixels[loc0] = color(r, g, b);
          }
        }
        mosaico[idx].setImgY(l);
        idx++;
      }
    }
    for (int i = 0; i < mosaico.length; i++) {
      // creo le singole immagini
      mosaico[i].getImg().updatePixels();
    }
  }

  class Tessera {
    private float posX;

    private float posY;

    private float imgX;

    private float imgY;

    private PImage img;

    float x;// = getPosX();

    float y;// = getPosY();

    public Tessera(PImage img) {
      this.img = img;
    }

    public float getPosX() {
      return posX;
    }

    public void setPosX(float posX) {
      this.posX = posX;
    }

    public float getPosY() {
      return posY;
    }

    public void setPosY(float posY) {
      this.posY = posY;
    }

    public float getImgX() {
      return imgX;
    }

    public void setImgX(float imgX) {
      this.imgX = imgX;
    }

    public float getImgY() {
      return imgY;
    }

    public void setImgY(float imgY) {
      this.imgY = imgY;
    }

    public PImage getImg() {
      return img;
    }

    public void setImg(PImage img) {
      this.img = img;
    }

    public void ritrovaPosizione() {
      int segnoX = (x > getImgX() ? -1 : 1);
      int segnoY = (y > getImgY() ? -1 : 1);
      // if (music.beat.isKick()) {
      if (music.beat.isHat()) {
        float dx = x + 40.0F;
        float dy = y + 40.0F;
        pushMatrix();
        translate(dx, dy);
        image(getImg(), 0, 0);
        popMatrix();
        println("isHat");
        return;
      }
      if ((int) x != (int) getImgX()) {
        pushMatrix();
        translate(x, y);
        image(getImg(), 0, 0);
        popMatrix();
        x += music.velocity() * segnoX;
      } else {
        x = getImgX();
      }
      if ((int) y != (int) getImgY()) {
        pushMatrix();
        translate(x, y);
        image(getImg(), 0, 0);
        popMatrix();
        y += music.velocity() * segnoY;// 0.5*segnoY;
      } else {
        y = getImgY();
      }
      setPosX(x);
      setPosY(y);
    }
  }

  class Music extends Minim {
    AudioPlayer song;

    BeatDetect beat;

    BeatListener bl;

    AudioInput input;

    PApplet pa;

    boolean pause = false;

    public Music(PApplet pa) {
      super(pa);
      this.pa = pa;
      song = this.loadFile(path + "12GongRock_B.mp3", 1024);
      beat = new BeatDetect(song.bufferSize(), song.sampleRate());
      // After a beat has been detected, the algorithm will wait for 300
      // milliseconds
      // before allowing another beat to be reported. You can use this to dampen
      // the
      // algorithm if it is giving too many false-positives. The default value
      // is 10,
      // which is essentially no damping. If you try to set the sensitivity to a
      // negative value,
      // an error will be reported and it will be set to 10 instead.
      beat.setSensitivity(10);
      bl = new BeatListener(beat, song);

      //input = this.getLineIn(Minim.STEREO, 512);
    }

    public void pausePlay() {
      song.pause();
      if (!pause)
        suona();
    }

    public void stop() {
      if (pause) return;
      song.close();
      super.stop();
      //pa.stop();
      println("stop");
    }

    public void suona() {
      if (pause)
        return;
      song.play();
    }

    public float velocity() {
      float incr = 0.20F;
      return incr;
    }

    public AudioPlayer getSong() {
      return song;
    }

    public void setSong(AudioPlayer song) {
      this.song = song;
    }
    /*
    public float getLevel() {
      return input.mix.level() * width;
    }*/

  }

  class BeatListener implements AudioListener {
    private BeatDetect beat;

    private AudioPlayer source;

    public BeatListener(BeatDetect beat, AudioPlayer source) {
      this.source = source;
      this.source.addListener(this);
      this.beat = beat;
    }

    public void samples(float[] samps) {
      beat.detect(source.mix);
    }

    public void samples(float[] sampsL, float[] sampsR) {
      beat.detect(source.mix);
    }
  }




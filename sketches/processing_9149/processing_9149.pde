
/**
 * Busa
 */
class Busa {
  int x;
  int y;
  int size;
  
  float phase;
  float freq;
  float rad;
  float v;
  
  float t, dt;
  
  color fcolor;
  color scolor;

  /**
   * Konstruktor
   */  
  public Busa() {
    // semua parameter diacak
    x = (int) random(width);
    y = (int) - random(height);
    size = (int) random(3, 15);
    
    phase = random(0, PI);
    freq = random(0, 10);
    rad = random(5, 10);
    v = random(50, 250);
    
    fcolor = color(
      240 + random(0, 10),
      170 + random(0, 65),
      200 + random(0, 25),
      (int) random(3, 180)
    );
    
    scolor = color(
      240 + random(0, 10),
      140 + random(0, 55),
      200 + random(0, 50),
      25
    );
    
    t = 0;
    dt = 0.01;
  }
  
  /**
   * draw untuk menggambar lingkarannya
   *
   * @param t - waktunya
   * @param inverted - apakah dalam mode inverted
   */
  public void draw(float T, boolean inverted) {
    // Tentukan koordinatnya
    // dihitung berdasarkan persamaan parameter lingkaran
    int cx = (int) (x + rad * cos(freq * (t - phase)));
    int cy = (int) (y + v * t);
      
    // Gambar lingkarannya, setelah dihitung warnanya
    calcColor(T, inverted);
    ellipse(cx, cy, size, size);
    fill(0, 0, 0, 180);
    ellipse(cx, cy, size-6, size-6);
    
    calcColor(T, inverted);
    
    t += dt;
    
    if (cy > height + size) t = 0;
  }
  
  /**
   * calcColor untuk menghitung warnanya
   *
   * @param t - waktunya
   * @param inverted - apakah dalam mode inverted
   */
  public void calcColor(float T, boolean inverted) {
    fill(
      (hue(fcolor) + 127 * cos(0.08 * T)) % 256,
      saturation(fcolor),
      brightness(fcolor),
      alpha(fcolor)
    );
    
    if (inverted)
      stroke(0, 0, 0, 10 + alpha(fcolor));
    else
      noStroke();
      /*stroke(
        (hue(scolor) + 127 * cos(0.08 * T)) % 256,
        saturation(scolor),
        brightness(scolor),
        alpha(scolor)
      );*/
  }  
}

/**
 * Busas
 */
class Busas {
  Busa[] Busas;
  float t;
  float dt;
  boolean inverted;

  /**
   * Konstruktor
   *
   * @param count - jumlah Busa yang akan dibuat
   */
  public Busas(int count) {
    Busas = new Busa[count];
    
    for (int i = 0; i < Busas.length; i++) {
      Busas[i] = new Busa();
    }
    
    // Set waktu = 0
    t = 0;
    dt = 0.01;
    
    clearInv();
  }
  
  /**
   * draw untuk menggambar semua Busa
   */
  public void draw() {
    for (int i = 0; i < Busas.length; i++) {
      Busas[i].draw(t, inverted);
    }
    
    next();
  }
  
  /**
   * next untuk memajukan waktu
   */
  public void next() {
    t += dt;
  }
  
  /**
   * setInv untuk menset mode menjadi inverted
   */
  public void setInv() {
    inverted = true;
  }
  
  /**
   * clearInv untuk menset mode menjadi biasa
   */
  public void clearInv() {
    inverted = false;
  }
}

/**
 * Variabel
 */

Busas busas;
int fade;

/**
 * setup
 */
void setup() {  
  size(500, 400);
  background(0);
  smooth();
  colorMode(HSB);
  strokeWeight(1);
  
  busas = new Busas(500);
  
  fade = 5;
}

/**
 * draw
 */
void draw() {
  fadeOut(fade);  
  busas.draw();
  busas.clearInv();
}

/**
 * fadeOut adalah untuk membuat gambar secara
 * perlahan-lahan memudar
 *
 * @param fade faktor memudarnya
 */
void fadeOut(int fade) {
  fill(0, 0, 0, fade);
  noStroke();
  
  rect(0, 0, width, height);
}

/**
 * mouseMoved menangani kejadian mouse digerakkan.
 * Setiap kali mouse digerakkan, yang terjadi ialah
 * tampilan menjadi terang, kemudian lingkaran-lingkaran
 * tersebut menjadi hanya tinggal tepinya saja dan berwarna
 * hitam.
 *
 * Fade juga berubah bergantung dari jarak
 * kursor mouse dari kiri atas. Selain itu, tebal garis
 * berubah sesuai dengan posisi x
 */
void mouseMoved() {
  // Hitung kuadrat jarak dari kiri atas
  float r2 = mouseX*mouseX + mouseY*mouseY;
  
  // Konversi kuadrat jarak tersebut menjadi fade
  fade = (int) map(r2, 0, height*height, 3, 50);
  
  // Konversi jarak-Y menjadi tebal garis
  //strokeWeight(map(mouseY, 0, width, 3, 1));
  
  // Buat tampilan menjadi terang
  // warna adalah sesuai dengan Busa terakhir yang
  // diproses
  rect(0,0,width,height);
 
  // Set Busa menjadi inverted
  busas.setInv();
}


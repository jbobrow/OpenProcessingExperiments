
/* 
*---------------------------------------
  RAW    : 2012 by Baran Güleşen
  Source : http://barangulesen.com
  Electronic Art & Visual Design Studio 
*--------------------------------------- 

--İçerik -----------------------------------------------------------------------
* Trigonomik fonksiyonlarla görsel programlama (cos, sin),
* ControlP5 Arayüz Kütüphanesi, yüklenmesi, 
kurulumu, ana ekrandan ayrılması, kullanılması 
* Kuyruk (tail) oluşturma, 
* Zamana bağlı durum fonksiyonu, (if) 
* Görüntüyü ekrana ortalama fonksiyonu (translate), renk fonksiyonları(stroke),
* Faz, döngü(for) ve döndürme(rotate) 
--Fonksiyonlarından---Oluşmaktadır----------------------------------------------

Processing 1.5.1 ile test edilmiştir.

*/

import controlP5.*; // Kontrol arabirim kütüphanesini yükle
ControlP5 controlP5; // ControlP5 kütüphanesi değişkeni

// Değişkenleri tanımlama, çizim için sabit değerlerle bir başlangıç oluşturma
//--------------------------------
float amp2 = 100;
float amp = 100;
float phase = 0;
int elements = 5;
float turn = 1.0;
float FILLON, TUS2, SAVE, _SIZE;
float alfa = 20 ;
float LINES = 0.13;
float COLORLINE = 150 ;
float COLORMASS ;
float h   = 144;
float s   =130;
float b   =137;
float alf =100;
float fillh  = 244;
float fills  = 212;
float fillb  = 220 ;
float fillalf = 200;
//-----------------------------------

void setup() { // İlk kurulum 
  size(1000, 500); // ekran boyutu genişlik, yükseklik
  frameRate(25); // saniye kare hesabı
  background(0); // arka plan rengi r,g,b
  colorMode(HSB); // renk, sertlik ve parlaklık moduna geçiş
  smooth(); // görüntü yumuşatma fonksiyonu açma
 
  //ilk kurulum için kontrol arabirinini başlatma
  controlP5 = new ControlP5(this);
  // Yeni bir kontrol ekranı ekleme
  ControlWindow cw = controlP5.addControlWindow("win", 250, 400);
  // Ekranın koordinatlarını belirleme
  cw.setLocation(0, 0);  // SET LOCATION CONTROL WINDOW
  // Kontrol elemanlarını tanımlama ve ayarlama
  ControlGroup cg = controlP5.addGroup("TUVAL", 10, 20);
  cg.moveTo(cw); // Kontrol penceresini ikinci ekrana taşı 
  controlP5.begin(cg, 0, 10); // Pozisyonunu ayarla
  controlP5.addSlider("elements", 0, 30).linebreak();   // Arayüze bir slider ekle 
  controlP5.addSlider("alfa", 0, 200).linebreak();  // linebreak(); satır atlama fonksyionudur
  controlP5.addSlider("phase", 0, 255).linebreak(); 
  controlP5.addSlider("LINES", 0, 10).linebreak(); 
  controlP5.addSlider("COLORMASS", 0, 255).linebreak();
  controlP5.addSlider("COLORLINE", 0, 255).linebreak(); 
  controlP5.addSlider("fillh", 0, 255).linebreak(); 
  controlP5.addSlider("fills", 0, 255).linebreak(); 
  controlP5.addSlider("fillb", 0, 255).linebreak(); 
  controlP5.addSlider("fillalf", 0, 255).linebreak(); 
  controlP5.addSlider("h", 0, 255).linebreak();
  controlP5.addSlider("s", 0, 255).linebreak();
  controlP5.addSlider("b", 0, 255).linebreak(); 
  controlP5.addSlider("alf", 0, 255).linebreak(); 
  controlP5.addSlider("amp", 0, 255).linebreak();  
  controlP5.addToggle("turn"); // Düğme ekle 
  controlP5.addToggle("FILLON"); 
  controlP5.end();
}
 

void draw() { // yinelenen çizim alanı
 
  // Kuyruk(tail) oluşturmak için güzel bir numara!  
  fill(0, alfa);  // ekrana siyah görünürlüğü ayarlanabilen bir arka plan oluşturma
  rect (0, 0, width, height);
  
  // zamana dayalı eğer fonksiyonu yaratma
  turn = turn + 1  ;
  if (turn > 650) {
    turn=0;
  }
   
  // faz ile görüntü kaydırma
  phase = phase + .01;
  amp2 = amp2 + 0.1;
  float spacing = TWO_PI/elements;
  // görseli ekrana ortalama
  translate(width*0.5, height*0.5);
  // ilk element sayısının değişkenine göre değişen bir döngü oluşturma
  for (int i = 0; i < elements;i++) {
    stroke(h,s,b,alf); // renk fonksiyonu ve ayarları
    strokeWeight(LINES); // çizgilerin kalınlığı
    fill(fillh, fills, fillb, fillalf); // Form renk ayarları 
    // Tanımlı formu başlatma ve bitiş (on/off)
    if (FILLON != 1) {
      noFill();
      ;
    }
    // Döngğü 
    for (int j = 0; j < amp ;j++) { //Büyüklük        
      rotate(-HALF_PI/turn);// Döndürme foksiyonu   
      // Basit bir diktörtgen formu üzerine trigonometrik bir fonksiyon
      rect(sin(spacing*i+sin(360))*(sin(360)),
      sin(spacing*i)*(cos(spacing*i)*(amp*j)),
      (sin(spacing*i)*(amp*1.5)),
      cos(spacing*(i))*(sin(spacing*(i)*phase)*(amp*1)));
      // Çizgiler üzerine spin fonksiyon
      line(sin(spacing*i+sin(360))*(sin(360)),
      sin(spacing*i)*(cos(spacing*i)*(amp*j)),
      (sin(spacing*i)*(amp*1.5)),
      cos(spacing*(i))*(sin(spacing*(i)*phase)*(amp*1))
      );
    }
  }
 
   
}

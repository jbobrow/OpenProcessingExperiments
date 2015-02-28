
//Joan Miro'dan Esintiler
//Ezgi Fulya Akgül 050411012
//Grafik Tasarım 3
//Adv. Computer Graphics 1
//Bager Akbağ

size (296, 350); // Çerçevenin boyutu belirlenir.
background (255); // Arkaplan boyutu belirlenir.
noStroke(); 
//Arka Plan renklendirmesi yapılıyor.
//Bunu sitedeki örneklerden buldum... :)
colorMode(RGB, 350);
for (int i = 0; i < 296; i++) {
  for (int j = 0; j < 350; j++) {
    stroke(i, j, 0);
    point(i, j);
  }
}
smooth(); //Çizgiler yumuşak görünümlü olması için

//Kafa Çiziliyor
noStroke();
fill(#2c1c1c);
ellipse (150, 90, 190, 140);
fill(#ffffff);
ellipse (150, 90, 175, 125);

//Sol Göz
fill(#2c1c1c);
ellipse (100, 60, 70, 70);
fill(#ffffff);
ellipse (100, 60, 50, 50);
fill(#2c1c1c); 
ellipse (100, 60, 25, 25);
//Sağ Göz
fill(#2c1c1c);
ellipse (200, 60, 70, 70);
fill(#ffffff);
ellipse (200, 60, 50, 50);
fill(#2c1c1c);
ellipse (200, 60, 25, 25);
//Burun
fill(#2c1c1c); /// Burnun içi doldurulur
triangle (153, 20, 140, 100, 166, 100);
//Ağız
fill(#2c1c1c);/// Ağızın içi doldurulur
triangle (130, 120, 180, 130, 130, 140);

//Boyun
rect(150, 150, 10, 60);
//Gövde
fill(#323bbc); //Gövde mavi ile doldurulur
rect(75, 210, 150, 80); // Gözve çizilir
fill(#de1237); // Gövde içindeki elipse doldurulur
noStroke(); // Gövde içindeki elipsin dış çizgisi kaldırılır.
ellipse (170, 245, 75, 55); /// Gövde içindeki elips çizilir.

//Gövde Yatay Çizlileri
fill(#2c1c1c);
rect(77, 205, 5, 90);
rect(120, 205, 5, 90);
rect(170, 205, 5, 90);
rect(219, 205, 5, 90);
/// Gövde Dikey Çizgileri
fill(#2c1c1c);
rect(72, 213, 160, 5);
rect(72, 233, 160, 5);
rect(72, 255, 160, 5);
rect(72, 280, 160, 5);


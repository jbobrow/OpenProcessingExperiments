
//Aydan Duman 0343015 Grafik tasarım 4+1
//Adv. Computer Graphics 1  
//Bager Akbağ  
// projemin ismi çiçek bahçesi
//Mouse u tıkladığınızda çiçek oluşturan,mouse a basarak haraket ettirdiğinizde
//mouseun istikameti boyunca çiçekler oluşturan programmımız..


 
void setup() 
{ 
size(800,600 ); //Proje Boyutu belirledim.
background(41, 113, 10); //Arka plan rengini belirledim. 



} 
 
void draw() 
{ 

flowers(mouseX, mouseY, pmouseX, pmouseY); // çiçeklerimin koordinat ve boyutlarını belirleyecek fonksiyonu yaptım.
} 
void flowers(int x, int y, int px, int py) 
{ 
  if (mousePressed == true)// Mouse a basıldığında...
  {
 
fill(242,24,126); // Çiçeğimin taç yapraklarının  renk kodunu tools menüsündeki color selector dan seçip belirledim.
ellipse(x-8,y-8,15,15); //Taç yapraklarımın koordinat ve boyutları.
ellipse(x+8,y-8,15,15); // Koordinatları farklı olduğu için x ve y ye göre farklı koordinatları + ve - olarak belirledim. 
ellipse(x-8,y+8,15,15);
ellipse(x+8,y+8,15,15);
fill(250,238,3); // Çiçeğimin ortasını color selector den seçerek belirledim.
noStroke(); // Çiçeklerimin daha gerçekçi ve daha şık gözükmesi için kenar çizgilerini kaldırdım.
ellipse(x,y,15,15); // Çiçeğimin koordinat ve boyutları.
  }
} 




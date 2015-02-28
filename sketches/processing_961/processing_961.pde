
 //Aydan Duman 0343015 Grafik tasarım 4 +1   Beykent Üniversitesi  tuana@hotmail.com
 //Bager Akbay
 //proje adı Palestine  is crying.(filistin ağlıyor)

 
 
 
 
 void setup(){ 
   
  smooth(); 
   
size(800,600); //Projenin boyutunu verdim.
 
   frameRate(3); 
   fill(3);// Bayrağın rengini verdim.
   rect(0,0,800,200); //Bayrağın koordinatlarını ve boyutunu verdim.
   fill(255);
   rect(0,200,800,200);
   fill(16,121,24);
   rect(0,400,800,200);
   fill(211,13,16);
   triangle(0,0,200,300,0,600); // bayrağın üzerindeki üçgenin koordinatlarını ve boyutunu verdim.
   
   fill(255);
 ellipse(300,400,150,80); //gözlerin dış ovali.
ellipse(500,400,150,80);

fill(0,0,200);// göz rengi.
ellipse(300,400,50,50);// iris tabakası yuvarlağı.
ellipse(500,400,50,50);
fill(3);
ellipse(300,400,20,20); //Gözlerin merceği.
ellipse(500,400,20,20);
} 

void draw(){ 
  


fill(random(189),random(187));// Göz yaşlarının renk değiştirmesini sağladım.
noStroke();// damlaların çerçevelerini kaldırdım.
ellipse (375,410,10,15);
fill(random(189),random(185));// Göz yaşları.
noStroke();
ellipse (370,470,10,15);
fill(random(189),random(186));
noStroke();
ellipse(340,500,10,15);


fill(random(189),random(185));
noStroke();
ellipse(430,420,10,15);
fill(random(191),random(183));
noStroke();
ellipse(450,450,10,15);
}
  
 

 
  
  
  
  



  
 





 




 




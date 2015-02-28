
//Ilkin Umit 0443010
//Grafik Tasarım 4
//Advanced Computer Graphics 1
//Bager Akbay

//http://www.processing.org/reference
//http://www.learningprocessing.com sitelerinden faydalandım.


background(255, 204, 0); //Kandinsky nin eserlerine genel olarak baktığımda sarı rengin hakim olduğunu gördüm
//ve bu rengin tonlarının. bend de projemin arka plan rengini bundan dolayı seçtim
size (340, 450);
strokeWeight(10);
rect(80, 120, 170, 200);

stroke(204, 102, 0);
rect(100, 150, 20, 55);
rect(100, 150, 55, 20);

// karenin içinde sağ tarafta bulunan soyut bir göz çalışması
rect(130, 95, 80, 10);
strokeWeight(5);
ellipse(200, 200, 55, 55);
ellipse(200, 200, 20, 55);
ellipse(200, 200, 20, 20);

// Kandinsky nin eserlerinden esinlenerek bu şekli okydum. çünkü sanatçı
//eserlerinde bu tarzda soyut şekil çalışmış
fill(153); 
arc(140, 250, 80, 100, 5, 2); 

stroke(100, 10, 0);

point(200, 200);
strokeWeight(20);
point(120, 300);

smooth();
strokeWeight(1);
line(200, 200, 300, 200);

// sağ taraftaki göz
smooth();
scale(2.8, 1.8);
ellipse(110, 110, 10, 50);
fill(100);
ellipse(110, 110, 10, 10);
fill(153);
ellipse(110, 110, 6, 6);
fill(578);
ellipse(110, 110, 2, 2);
fill(256);
ellipse(110, 110, 1, 1);
ellipse(111, 111, 9, 49);

// üst taraftaki kare ile kesişen üçgen
strokeWeight(2); 
triangle(30, 75, 58, 40, 86, 75);
noStroke();
//gri dar uzun üçgen
stroke(98);
triangle(30, 220, 58, 80, 86, 220);

// yuvarlagın üst kısmındaki çubuklar
strokeWeight(10); 
fill(153);
stroke(153);
line(20, 200, 100, 200);
strokeWeight(5);
stroke(50);
line(20, 210, 98, 210);

// alttaki yuvarlaklar
strokeWeight(2); 
ellipse (30, 230, 10, 10); 
ellipse (50, 230, 10, 10); 
ellipse (70, 230, 10, 10); 
ellipse (90, 230, 10, 10); 





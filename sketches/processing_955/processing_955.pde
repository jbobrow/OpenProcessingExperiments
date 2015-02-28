
//A.Haktan Çakmakoğlu 0443028 Grafik&Tasarım haktancakmakoglu@hotmail.com


size(200, 200);  
stroke(200);
background(150, 60, 0);
line(0, 0, 200, 200);
for(int i=0; i<height; i+=20) {
fill(0);
rect(10, i, width, 10);
rect(i, 10, 10, height);
}



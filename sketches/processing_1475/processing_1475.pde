
void setup(){
  

size(400,600);// ebatları 400,400  bir ekran aç



rectMode(CORNER);//diktörgen çizerken sol üst noktanın baz al.
noStroke();//şekil çizerken çizgisini çizme
}
void draw(){
fill(255);//siyah boyayı al
rect(200, 0, 200, 200);//sağ üste kare çiz
fill(255);//beyaz boyayı al
fill(240,206,82, mouseX);
rect(0, 500, 200, 500);//sol alta kare çiz


stroke(0);//siyah kalemi al

line(200, 600, 200, 0);// yukarıdan aşağıya çizgi çi
line(600, 200, 0, 200);
line(600, 500, 0, 500);
line(50, 500, 50, 600);
fill(255);
rect(0, 500, 50, 600);

fill(255);
rect(0,200, 200, 300); 
fill(26,16,90,mouseX);
rect(200,200, 400, 300);
fill(255);

rect(200,500, 200, 100);
fill(160,15,36,mouseX);
rect(0, 0, 200, 200);
fill(0);
rect(0, 200, 400, 10);
rect(0, 500, 400, 10);
rect(50, 500, 10, 600);
rect(200, 500, 10, 600);
rect(200, 0, 10, 600);
}
void mousePressed(){

background(0);
}
void keyPressed(){
  background(255);
}













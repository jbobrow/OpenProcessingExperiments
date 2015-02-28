
//Yusuf Burak Güneş 060411032
//Murat Ataseven 050411014
//Wili Baumeister bir resminden yola cıkarak yaptık.
void setup(){
  
  smooth();
  
size(800,600);

   frameRate(5);
}


void draw(){
  background(5);


noStroke();

fill(random(1),random(102),random(62));
rect(250,150,100,100);

fill(random(203),random(0),random(0));
rect(350,150,100,100);

fill(random(239),random(124),random(0));
rect(450,150,100,100);

fill(random(38),random(39),random(104));
rect(250,250,100,100);

fill(random(8),random(6),random(11));
//rect(350,250,100,100);

fill(random(162),random(63),random(177));
rect(450,250,100,100);

fill(random(111),random(24),random(103));
rect(250,350,100,100);

fill(random(242),random(238),random(239));
rect(350,350,100,100);

fill(random(0),random(123),random(190));
rect(450,350,100,100);


strokeWeight(8); 
stroke(254,255,13);
line(250,150,400,150);
line(250,150,250,300);
line(250,250,400,250);
line(350,150,350,300);

stroke(38,39,104);
line(550,150,400,150);
line(550,150,550,300);
line(550,250,400,250);
line(450,150,450,300);


stroke(203,0,0);
line(550,450,400,450);
line(550,450,550,300);
line(550,350,400,350);
line(450,450,450,300);


stroke(1,102,62);
line(250,450,250,300);
line(250,450,400,450);
line(250,350,400,350);
line(350,450,350,300);

}



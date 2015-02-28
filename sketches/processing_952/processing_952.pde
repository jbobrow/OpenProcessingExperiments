
// Sinan Tok 050411037 grafik tasarım stgalatasaray1905@gmail.com
// Kürşat Sandıkçı 050411031 grafik tasarım qrsad53@yahoo.com
// Ersoy Bölükbaşı 050411018 grafik tasarım ersoybolukbasi@gmail.com
// Barbaros Kurt 050411027 grafik tasarım barbaroskurtbkurt@hotmail.com

// http://img264.imageshack.us/img264/1341/paulkleejy5.jpg
// Paul Klee'nin yukarıda bulunan linkdeki eserinden etkilenerek yapılmıştır
// Genel olarak geometrik şekiller kullanılarak amaca ulaşılmaya çalışılmıştır.



int k=1;
int m=10;
void setup() {
  size(800,600);
  background(160,83,6);
    frameRate(20);
  
}

void draw()  {
  stroke(0);
  strokeWeight(20);
  fill(160,83,6);
  rect(0,0,799,599);
  
  strokeWeight(1);
  stroke(255,255,255);
  fill(255,31,31);

  rect(40,random(600),80,80);

  fill(41,113,3);
  rect(120,40,80,150);
  fill(29,12,3);
  rect(200,40,50,100);
  fill(29,70,45);
  rect(250,40,50,100);
  fill(random(255));
  rect(250,140,50,50);
  fill(random(255));
  rect(200,140,50,50);
  fill(random(255));
  rect(200,190,50,50);
  fill(random(255));
  rect(250,190,50,50);
  fill(41,11,95);
  rect(120,240,250,150);
  fill(random(255),random(255),random(255));  

  ellipse(k,115,150,150);
 
  fill(145,11,95);
  triangle(415,295,460,390,370,390);
  fill(random(255),random(255),random(255));
  triangle(515,295,460,390,560,390);
  fill(145,11,95);
  triangle(615,295,660,390,560,390);
  fill(random(255),random(255),random(255));
  triangle(715,295,660,390,760,390);
  fill(245,234,12);
  rect(370,240,345,54);
  fill(145,11,95);
  triangle(515,495,460,390,560,390);
  fill(random(255),random(255),random(255));
  triangle(415,495,460,390,370,390);
  triangle(615,495,660,390,560,390);
  fill(145,11,95);
  fill(random(255),random(255),random(255));
  triangle(615,495,660,390,560,390);
  fill(145,11,95);
  triangle(715,495,660,390,760,390);
  fill(48,85,0);
  rect(415,495,300,54);
  noStroke();
  fill(211,43,17);
  ellipse(500,110,164,164);
  stroke(255,255,255);
  strokeWeight(1);
    fill(160,34,15);
    rect(650,40,65,200);
      fill(56,23,56);
    rect(716,150,65,65);
      fill(12,78,67);
    rect(716,215,65,65);
    rect(120,495,250,54);
       fill(78,34,12);
     rect(320,390,50,105);
     fill(99,120,200);
     rect(120,390,150,105);
     fill(160,83,6);
     noStroke();
     ellipse(195,440,120,75);
             stroke(255,255,255);

                 fill(1,34,12);
                 
           rect(40,random(600),80,80);
         
  k=k+1;
  
  
}


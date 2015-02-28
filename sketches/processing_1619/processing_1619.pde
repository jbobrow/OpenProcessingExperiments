
void setup() { 
  size(475,475); 
  background(215); 
   
} 
 
void draw() { 
 
  //background değişen 
  frameRate(50); 
  fill(random (44),random (130),random (198),random(30)); 
  rect(0,25,500,420);  
 
  //tv dış siyah 
  fill(0); 
  rect(28,128,250,190); 
   
  //sol beyaz çizgi 
 noStroke(); 
 fill(255); 
  rect(35,135,34,140); 
   
  //sarı 
  noStroke(); 
  fill(240,183,24); 
  rect(69,135,34,140); 
   
  //açık mavi 
  noStroke(); 
  fill(25,205,247); 
  rect(103,135,34,140); 
   
  //yeşil 
  noStroke(); 
  fill(49,211,26); 
  rect(137,135,34,140); 
   
  //pembe 
  noStroke(); 
  fill(229,37,162); 
  rect(171,135,34,140); 
   
  //kırmızı 
  noStroke(); 
  fill(234,28,32); 
  rect(205,135,34,140); 
   
  //lacivert 
  noStroke(); 
  fill(81,76,229); 
  rect(239,135,34,140); 
 
//tv alt ilk kare 
noStroke(); 
  fill(69,83,100); 
  triangle(35,275,69,275,69,310); 
 
//alt beyaz kare 
  noStroke(); 
  fill(255); 
  rect(73,275,40,35); 
 
//alt kare 
  noStroke(); 
  fill(51,56,62 ); 
  rect(120,275,40,35); 
 
//alt kare 2 
  noStroke(); 
  fill(40,43,46 ); 
  rect(165,275,75,35); 
 
//yüz 
noStroke(); 
  fill(0 ); 
 rect(288,125,96,120); 
 
//yüz sol ilk çizgi 
noStroke(); 
  fill(188,91,42 ); 
 rect(288,125,20,120); 
 
//yüz 2. çizgi 
noStroke(); 
  fill(219,65,38 ); 
 rect(308,125,20,140); 
 
//yüz 3. çizgi 
noStroke(); 
  fill(72,28,20 ); 
 rect(328,125,20,140); 
 
//yüz 4. çizgi 
noStroke(); 
  fill(54,23,17 ); 
 rect(348,125,20,160); 
 
 
//saç 
smooth();
fill(229,229,229,230);
quad(275, 180, 290, 110, 365, 100, 340, 120);
quad(315, 150, 355, 100, 400, 120, 360, 140);
quad(380, 180, 362, 100, 400, 120, 395, 160);
 

 
//noStroke(); 
//line(275, 145, 285, 50); 
//line(385, 50,395, 145 ); 
 
//bezier(275, 145, 285, 50,  385, 50,395, 145); 
 
 
//boyun 
noStroke(); 
  fill(4,16,39 ); 
 ellipse(335,280,120,50); 
 
 
//gövde 
//noStroke(); 
 fill(4,16,39 ); 
 //rect(210,287,250,160); 
 
 
//sol kol 
noStroke(); 
fill(4,16,39 ); 
quad(65,318, 135, 318, 145, 445,70, 445 ); 
 
noStroke(); 
fill(4,16,39 ); 
quad(135,400, 225, 305, 250, 445,145, 445 ); 
 
fill(4,16,39 ); 
bezier(430, 445, 500, 190, 125, 230, 200, 445);


//gövde 
//fill(4,16,39 ); 
//beginShape();
//curveVertex(500, 645);
//curveVertex(460, 645);
//curveVertex(440, 445);
//curveVertex(390, 290);
//curveVertex(240, 290);
//curveVertex(210, 445);
//curveVertex(200, 645);
//endShape();
//noStroke(); 
  
 
//rect(210,287,250,160); 
 
 
//saç gölge 
//strokeWeight(20); 
//stroke(0); 
//fill(200); 
//line(300,60,310,70); 
 
//el 
smooth();
stroke(0); 
strokeCap(ROUND);
  fill(229,192,220 ); 
 triangle(230,410,190,390,200,320); //baş parmak 
 
triangle(210,440,230,410,150,320);  //işaret parmak 
triangle(210,440,230,410,145,330); 
triangle(210,440,230,410,145,340); 
triangle(210,440,230,410,150,355); 
 
 
 
 
} 


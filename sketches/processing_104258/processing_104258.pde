
//Arquitetura e Urbanismo - UTFPR
//Geórgia Collete Rodrigues dos Santos Cadamuro
//Computação 1
//1 período

void setup () {
  //fundo
  size(600, 400);
}
void draw () {
  background (227, 188, 137);
  //parede fundo
  for (int i = -10; i < 250; i = i+ 40) {
    stroke(193, 153, 117);
    fill(193, 146, 105);
    rect (50, i, 500, 20);
  }
  for (int i = 10; i < 250; i = i +40) {
    stroke(193, 153, 117);
    fill(196, 153, 115);
    rect (50, i, 500, 20);
  }
  
     //luzes
     noStroke();
    if (mouseX < 650 ) {
   fill(255, 210, 118, 90 - mouseX);
   } else {
     noFill();
     }
    for (int i = 145; i < 300; i = i +40) {
    ellipse (i, 150, 25, 200);
        }
     fill(193, 146, 105);
     rect (210, 111, 100, 18);
     rect(170, 70, 110, 20);
     fill(196, 153, 115);
     rect (210, 90, 100, 22);
     rect (240, 129, 100, 22);
     rect (130, 50, 170, 22);
   //parede  direita
  fill (250, 211, 159);                
  stroke (209, 177, 135);
  quad(515, 0, 600, 0, 600, 400, 515, 270);
  //parede esquerda
  fill (250, 211, 159);
  stroke (209, 177, 135);
  quad(0, 0, 50, 0, 50, 250, 0, 280);
  //banco
  //madeira
  fill(57, 22, 6);
  rect (0, 300, 500, 40);
  strokeWeight (2);
  stroke (26, 13, 0);
  line(120, 300, 120, 338);
  line(300, 300, 300, 338);
  //assento
  strokeWeight (1);
  stroke (215, 184, 152);
  fill(220, 187, 152);
  rect (0, 280, 500, 20);
  fill(230, 190, 152);
  quad (0, 280, 50, 250, 480, 250, 500, 280);
  
  //luzes
  if (mouseX > 250); {
    fill (234, 200, 130, 90 - mouseX);}
    noStroke();
    curve(100, 290 , 155, 230, 130, 230, 20, 0);
    quad (157, 230, 130, 230, 115, 50, 160, 80);
    curve(185, 290 , 200, 230, 170, 230, 90, 0);
    quad (198, 230, 170, 230, 155, 80, 210, 100);
    curve(220, 290 , 240, 230, 210, 230, 100, 0);
    quad (238, 230, 210, 230, 195, 100, 260, 150);
    curve(270, 290 , 280, 230, 250, 230, 120, 0);
    quad (278, 230, 250, 230, 235, 140, 290, 160);

  //escada
  //1
  stroke(215, 184, 152);
  fill (220, 187, 152);
  rect (340, 335, 230, 20); 
  fill (230, 190, 152);
  quad (339, 328, 563, 328, 570, 335, 340, 335);
  fill(85, 83, 82, 99);
  noStroke();
  rect (340, 350, 228, 5);
  //2
  stroke(215, 184, 152);
  fill (215, 184, 152);
  rect (364, 313, 200, 15); 
  fill (230, 190, 152);
  quad (362, 305, 557, 305, 564, 313, 364, 313);
  fill(85, 83, 82, 99);
  noStroke();
  rect (363, 325, 200, 5);
  //3
  noStroke ();
  fill (215, 184, 152);
  rect (362, 287, 195, 20); 
  fill (230, 190, 152);
  quad (360, 287, 555, 287, 547, 280, 355, 280);
  fill(85, 83, 82, 99);
  rect (360, 303, 196, 5);
  //4
  fill(230, 190, 152);
  quad (385, 250, 535, 250, 550, 260, 390, 260);
  fill (215, 184, 152);
  rect (390, 260, 157, 20);
  fill(85, 83, 82, 99);
  rect (390, 275, 155, 5);
  //5
  fill(230, 190, 152);
  quad (390, 225, 515, 225, 540, 235, 390, 235);
  fill (215, 184, 152);
  rect (390, 235, 150, 20);
  fill(85, 83, 82, 99);
  rect (390, 250, 150, 5);
  //6 -14 ( não funcionou utilizando for (int...) formato desejado não foi ocorreu, apesar de conseguir a diagonal degrau ficou com mesmo comprimento e altura)
  fill (215, 184, 152);
  rect ( 115, 40, 15, 40);
  rect ( 115, 65, 40, 15);
  rect ( 155, 65, 15, 40);
  rect ( 155, 90, 40, 15);
  rect ( 195, 90, 15, 40);
  rect ( 195, 115, 40, 15);
  rect ( 235, 115, 15, 40);
  rect ( 235, 140, 40, 15);
  rect ( 275, 140, 15, 40);
  rect ( 275, 165, 40, 15);
  rect ( 315, 165, 15, 40);
  rect ( 315, 190, 40, 15);
  rect ( 350, 190, 15, 40);
  rect ( 350, 215, 58, 15);
  //corrimão
  fill(214, 234, 255, 99);
  quad ( 240, 0, 100, 20, 250, 115, 300, 40);
  quad (250, 115, 300, 40, 410, 110, 410, 220);
    triangle (172, 65, 130, 65, 130, 39);
    triangle (210, 90, 170, 90, 170, 64);
    triangle (250, 115, 210, 115, 210, 90);
    triangle (289, 140, 250, 140, 250, 115);
    triangle (327, 165, 290, 165, 290, 141);
    triangle (365, 190, 330, 190, 330, 168);
    triangle (403, 215, 365, 215, 365, 190);
  //15-14
  fill (215, 184, 152);
  rect ( 10, 10, 105, 30);
  rect ( 20, 30, 110, 30);
  fill (193, 156, 123);
  
  //teto
  noStroke();
  fill (222, 185, 136);
  quad (0, 20, 0, 0, 600, 0, 580, 20);
  fill (147, 139, 123);
  ellipse(50, 10, 15, 5);
  ellipse(150, 10, 15, 5);
  ellipse(250, 10, 15, 5);
  ellipse(350, 10, 15, 5);
  ellipse(450, 10, 15, 5);
  ellipse(550, 10, 15, 5);

  //sofa
  fill(183, 98, 18);
  rect (100, 265, 200, 10);
  fill (82, 49, 17);
  rect (101, 274, 198, 2);
  fill (216, 134, 57);
  quad (100, 265, 300, 265, 310, 250, 125, 250);
  fill(183, 98, 18);
  quad (300, 265, 300, 275, 310, 250, 310, 250);
     
    //interruptor
    fill(255, 235, 185);
    ellipse (15, 155, 5, 15);
    
  //abajur
  strokeWeight (2);
  stroke (0);
  line (91, 255, 91, 215); 
  noStroke();
  fill (183, 98, 18);
  curve (0, 100, 105, 200, 80, 200, 120, 20);
  quad (107, 200, 80, 200, 83, 170, 100, 170);
  fill (252, 250, 158, 90 - mouseX);
  curve (0, 100, 105, 200, 80, 200, 120, 20);
  quad (107, 200, 80, 200, 83, 170, 100, 170);
  
  //vaso
  fill(99, 101, 106);
  rect (33, 210, 15, 60);
  fill(100, 100, 100);
  ellipse (67, 240, 15, 5);
  rect (60, 240, 15, 30);
  
         //luzes teto
    if (mouseY < 100) {
   fill(252, 248, 166, 90 - mouseY);
   } else {
     noFill();
     }
     quad (545, 10, 555, 10, 570, 360, 470, 360);
   for (int i = 45; i < 500; i = i+100){
     quad (i,  10, i+10, 10, i + 85, 360, i-30, 360);
     }
       }
 //imagem de inspiração para esboço http://www.pedreirao.com.br/wp-content/uploads/2012/06/Escada.jpg

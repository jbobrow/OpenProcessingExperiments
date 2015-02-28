
// Willy Max De Melo Orlandi
//29/04
// Um vÃ­rus para atacar os programas do japÃ£o
void setup() {  //setup function called initially, only 

  background(255);
  size(400,600);
 
  rect( 115, 140, 170, 120);

   rect(125,150,150,100);
   fill(300,50,0);
   ellipse( 200 ,200, 60, 60);   // bandeira do japan
   fill(0,0,0);
   rect( 150, 500, 70, 40); //corpo
   rect (160,480,7,25); //antena esquerda
   rect( 200, 480, 7, 25);// antena direita
   rect( 150, 540 , 7, 30);
   rect( 212, 540, 7, 30);
   rect( 140, 563, 15, 7);
   rect(217, 563, 15, 7); 
   fill(255)
   rect( 170,510, 5, 5);
   rect( 190, 510, 5, 5 );
   rect( 175, 520, 15, 15);
  triangle (190,340,160,370,220,370);

  rect(180, 370 , 10, 90); 
  
  rect( 125, 270 , 150, 50) ; 
  rect( 131, 272, 9, 9); // teclas de cima
  rect( 142, 272, 9, 9);
  rect( 153, 272, 9, 9);
  rect( 164, 272, 9, 9);
  rect( 175, 272, 9, 9);
  rect( 186, 272, 9, 9);
  rect( 197, 272, 9, 9);
  rect( 208, 272, 9, 9);
  rect( 219, 272, 9, 9);
  rect( 231, 272, 9, 9);
  rect( 242, 272, 9, 9);
  rect( 253, 272, 9, 9);
  rect( 264, 272, 9, 9);
  
  rect( 131, 282, 9, 9); //teclas do meio
 rect( 142, 282, 9, 9);
  rect( 153, 282, 9, 9);
  rect( 164, 282, 9, 9);
  rect( 175, 282, 9, 9);
  rect( 186, 282, 9, 9);
  rect( 197, 282, 9, 9);
  rect( 208, 282, 9, 9);
  rect( 219, 282, 9, 9);
  rect( 231, 282, 9, 9);
  rect( 242, 282, 9, 9);
  rect( 253, 282, 9, 9);
  rect( 264, 282, 9, 9);
  

rect( 131, 292, 9, 9);// terceira fileira
rect( 142, 292, 9, 9);
rect( 153, 292, 9, 9);
 rect(165,292, 50, 9);
  rect( 219, 292, 9, 9);  
rect( 231, 292, 9, 9);
  rect( 242, 292, 9, 9);
  rect( 253, 292, 9, 9);
  rect( 264, 292, 9, 9);
  textSize(50);
  text("Attack!", 300,500);
  
  }
  
  
  void draw() {
  if(mouseX > 200) {
  fill(255,0,0);
  rect (160,480,7,25); //antena esquerda
   rect( 200, 480, 7, 25);  //antena direita 
   }
   else
    fill (0,0,0);
      rect (160,480,7,25); //antena esquerda
   rect( 200, 480, 7, 25);  //antena direita 
  }

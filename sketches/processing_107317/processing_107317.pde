
void setup(){
  size (600, 450);
    background(#03021F);
frameRate(1);//velocidade da cintilação
}

void draw (){//traços do prédio

//for (int h = 465; h < 485 ; h = h+1) {
  //for(int v = 190; v < 360; v = v+15) {
  //line (h+480, 200, h+480, 200);
  //}
  
  background(#03021F);
  
  for(int a = 0; a <= 600; a = a+50){
    for(int b = 0; b <+ 450; b = b+50){
      stroke(255);
      point(random(a), random(b));
    }
  }
   
 for(int c = 30; c > 600; c = c+10){ 

ellipseMode(CENTER);  // Set ellipseMode to CENTER
fill(100);  // Set fill to gray
ellipse (random(c), random(c), 30, 30);  // Draw gray ellipse using CENTER mode


 }

fill(#468E73);
  noStroke();
  beginShape();{ //horizonte baixo
 bezier(0,380, 200, 350, 280, 330, 600, 380);}
   beginShape();{
   vertex(600, 380);
   vertex(0, 380 );
   vertex(0, 450);
   vertex(600, 450);
   }
   endShape();
   
   fill(255);
   stroke(0);
  strokeWeight(1.2);
beginShape ();//fachada frontal superior
vertex(280,110);
vertex(430,40);
vertex(430,130);
vertex(280,155);
endShape();

beginShape(); //Teto do pendente
vertex(430,130);
vertex(280,155);
vertex(325,180);
vertex(465, 180);
endShape();

beginShape(); //fachada frontal do meio
vertex(325,180);
vertex(465, 180);
vertex(475, 360);
vertex(480, 350);
vertex(270, 346);
vertex(270, 310);
vertex(330,300);
endShape();

beginShape(); //lateral direita inferior média
vertex(210, 350);
vertex(210, 290);
vertex(270,310);
vertex(270,350);
endShape();

beginShape();//fachada frontal inferior
vertex(210, 350);
vertex(210, 290);
vertex(120, 320);
vertex(120, 380);
vertex(310, 385);
vertex(310, 413);
vertex(450, 420);
vertex(450, 340);
endShape();

beginShape(); //fachada frontal inferior inferior
vertex(310, 385);
vertex(310, 413);
vertex(140, 405);
vertex(140, 380);
endShape();

beginShape();//lateral direita em L
vertex(510,185);
vertex(520, 410);
vertex(475,410);
vertex(465,180);
vertex(430,130);
vertex(430, 40);
endShape();

beginShape(); //fachada lateral inferior 
vertex(500, 410);
vertex(500, 355);
vertex(450,340);
vertex(450,420);
endShape();

beginShape();
vertex(290,118);
vertex(420,65);
vertex(420, 115);
vertex(290, 145);
vertex(290,118);
endShape();

quad(290, 118, 290, 145, 300, 143, 300, 123);//corte no topo
quad(290, 118, 300, 123, 420, 78, 420, 65);


line(270, 115, 440,35);//diagonal 1
line(425,33, 515, 190);//2
line(270, 157, 440, 128);//3
line(425,125, 470, 185);//4
line(280,155,325, 180 );//5
line(325,180, 465,180);//6
line(210, 290, 270, 310);//7
line(270, 310, 330, 300);//8
line(120, 320, 210, 290);//9 telhado
line(460, 340, 200,350);//10
line(455, 390, 120, 380);//11
line(455, 420, 135, 405); //12


line(120, 390, 120, 310);//vertical 1
line(140, 370, 140, 410);//2
line(210, 365, 210, 280);//3
line(280,100, 280, 165);//4
line(310, 420, 310, 375);//5
line(430, 140, 430,30);//6
line(450, 330, 450,430);//7
line(500, 345, 500, 400); //8

line (325, 170, 330, 310);//oblíqua 1
line(465,170,470,310);//oblíqua 2
line(510,175,520, 420); //oblíqua 3

}


// Constantes para o fundo degradê
int Y_AXIS = 1;
int X_AXIS = 2;
int x;
color c1, c2;

void setup() {
  size(900,600);

  // cores usadas
   c1 = color(#0F64D8);
  c2 = color(255);

}

void draw() {
  // Background
  setGradient(0, 0, width, height, c1, c2, Y_AXIS);
        stroke(1);
        
        
fill(55,130,50);
ellipse(900,400,400,350); //MONTANHAS
fill(64,137,61);
ellipse(680,400,410,300);
fill(55,130,50);
ellipse(0,400,400,350); 
fill(64,137,61);
ellipse(300,400,400,360); 



fill(#2B9B2A); //GRAMA
rect(0,360,900,600);

fill(26,100,8);// ARBUSTOS
ellipse(40,590,85,45); 
fill(25,70,31);
ellipse(65,580,90,60);
fill(23,85,31);
ellipse(57,545,90,75);
fill(26,100,8);
ellipse(40,529,75,60);
fill(23,85,31);
ellipse(20,500,80,60);
fill(25,70,31);
ellipse(10,550,100,90);

fill(44,32,6); // ARVORE
rect(762,310,14,100);
fill(25,70,31);
ellipse(770,280,90,130);
fill(44,32,6); 
rect(35,310,6,60);
fill(#1C3B1D);
ellipse(38,300,50,90);

 
 fill(#716C6C); // PILARES DE SUSTENTAÇÃO
 { rect(250, mouseY-250,20,60);
 rect(400, mouseY-250,20,60);
 rect(550, mouseY-250,20,60);}
 
 
 
 x++; // NUVENS
  fill (255);
  ellipse (x-500, 30,  110, 10);
  ellipse (x+175, 120, 89,  10);
  ellipse (x+150, 100, 150, 12);
  ellipse (x-100, 70,  130, 10);
  ellipse (x-175, 190, 100, 14);
  ellipse (x-120, 180, 90,  10);
  ellipse (x-400, 170, 70,  10); 
  
stroke(1);
fill (#F70C2C); // CONTENDER
rect (200,200,400,150);
fill (250);
rect (220,220,360,110); //fundo
fill (#EDF9FF,230); //vidro
rect (220,220,360,110);
stroke(1);
 for (int a=220; a<580; a+=51) 
  {
    fill (#BBBDBF);
    rect (a, mouseY-378, 3, 110);
  }
  
rect(500,150,15,50);
fill(#3F4040);
rect(500,160,15,8);

fill(#0A6710); // marca chão
rect(150,410,650,2);
//noStroke();
rect(20,370,50,1);

stroke(1); //sacada
 for (int a=300; a<340; a+=10) 
  {
    fill (#BBBDBF);
    rect ( 400,a, 200, 3);
  }
  rect(400,300,5,30);

fill(0,0,0,200); //PESSOA
  ellipse(300,265,20,20);
  rect(290,280,20,20);
  rect(292,300,6,27);
  rect(301,300,6,27);
  line(290,282,280,300);
  
  


  



 }

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // função para funcionar o gradiente do topo ao final da janela.
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  
    }
    
    
    
    //http://i68.photobucket.com/albums/i20/rfroni/18.jpg

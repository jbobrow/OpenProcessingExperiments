
int posy = 40;

size(800,600);
background(220,233,242);

for(int i = 0; i < 900; i = i + 20) {  // pattern de circulos de fondo
  for(int j = 0; j < 700; j = j + 20) {
    noFill();
    stroke(16,51,98);
    ellipse(i,j,100,100);
  }
}

noStroke();
fill(37,74,147,120);
triangle(400,490,640,160,160,160);
triangle(400,520,670,140,130,140);
triangle(400,550,700,120,100,120); //triangulo azul más grande
fill(219,39,33,150);
triangle(400,80+posy,170,380+posy,620,380+posy);
triangle(400,50+posy,140,400+posy,650,400+posy);
triangle(400,20+posy,100,420+posy,690,420+posy); //triangulo rojo más grande

fill(255);
ellipse(400,300,150,150);
noFill();
stroke(219,39,33);
ellipse(400,300,145,145); // ellipses sin relleno, centrales
ellipse(400,300,140,140);
ellipse(400,300,135,135);
ellipse(400,300,130,130);
ellipse(400,300,125,125);
ellipse(400,300,120,120);
ellipse(400,300,115,115);
ellipse(400,300,110,110);
ellipse(400,300,105,105);
ellipse(400,300,100,100);
ellipse(400,300,95,95);
ellipse(400,300,90,90);
ellipse(400,300,85,85);
ellipse(400,300,80,80);
ellipse(400,300,75,75);
ellipse(400,300,70,70);
ellipse(400,300,65,65);
ellipse(400,300,60,60);
fill(219,39,33);
ellipse(400,300,55,55); // ellipse roja central

noFill();
stroke(219,39,33,150);
strokeWeight(3);
ellipse(690,460,100,100); // ellipses rojas concentricas derecha
ellipse(690,460,90,90);
ellipse(690,460,80,80);
ellipse(690,460,70,70);
ellipse(690,460,60,60);
ellipse(690,460,50,50);
fill(255,255,255,200);
ellipse(690,460,40,40);

noFill();
ellipse(100,460,100,100); // Ellipses rojas concentricas izq
ellipse(100,460,90,90);
ellipse(100,460,80,80);
ellipse(100,460,70,70);
ellipse(100,460,60,60);
ellipse(100,460,50,50);
fill(255,255,255,200);
ellipse(100,460,40,40);

stroke(37,74,147,130);
noFill();
ellipse(100,120,100,100); // Ellipses azules concentricas izq
ellipse(100,120,90,90);
ellipse(100,120,80,80);
ellipse(100,120,70,70);
ellipse(100,120,60,60);
ellipse(100,120,50,50);
fill(255,255,255,200);
ellipse(100,120,40,40);

noFill();
ellipse(690,120,100,100); // Ellipses azules concentricas derecha
ellipse(690,120,90,90);
ellipse(690,120,80,80);
ellipse(690,120,70,70);
ellipse(690,120,60,60);
ellipse(690,120,50,50);
fill(255,255,255,200);
ellipse(690,120,40,40);

noFill();
strokeWeight(1);
stroke(255);
ellipse(100,300,180,180); // ellipses sin relleno blancas, izq
ellipse(100,300,175,175);
ellipse(100,300,170,170);
ellipse(100,300,165,165);
ellipse(100,300,160,160);
ellipse(100,300,155,155);
ellipse(100,300,150,150);
ellipse(100,300,145,145);  
ellipse(100,300,140,140);
ellipse(100,300,135,135);
ellipse(100,300,130,130);
ellipse(100,300,125,125);
ellipse(100,300,120,120);
ellipse(100,300,115,115);
ellipse(100,300,110,110);
ellipse(100,300,105,105);
ellipse(100,300,100,100);
ellipse(100,300,95,95);
ellipse(100,300,90,90);
ellipse(100,300,85,85);
ellipse(100,300,80,80);
ellipse(100,300,75,75);
ellipse(100,300,70,70);
ellipse(100,300,65,65);
ellipse(100,300,60,60);
ellipse(100,300,55,55);
ellipse(100,300,50,50);
ellipse(100,300,45,45);

noFill();
strokeWeight(1);
stroke(255);
ellipse(700,300,180,180); // ellipses sin relleno blancas, derecha
ellipse(700,300,175,175);
ellipse(700,300,170,170);
ellipse(700,300,165,165);
ellipse(700,300,160,160);
ellipse(700,300,155,155);
ellipse(700,300,150,150);
ellipse(700,300,145,145);  
ellipse(700,300,140,140);
ellipse(700,300,135,135);
ellipse(700,300,130,130);
ellipse(700,300,125,125);
ellipse(700,300,120,120);
ellipse(700,300,115,115);
ellipse(700,300,110,110);
ellipse(700,300,105,105);
ellipse(700,300,100,100);
ellipse(700,300,95,95);
ellipse(700,300,90,90);
ellipse(700,300,85,85);
ellipse(700,300,80,80);
ellipse(700,300,75,75);
ellipse(700,300,70,70);
ellipse(700,300,65,65);
ellipse(700,300,60,60);
ellipse(700,300,55,55);
ellipse(700,300,50,50);
ellipse(700,300,45,45);

noFill();
strokeWeight(1);
stroke(255);
ellipse(550,300,180,180); // ellipses sin relleno blancas,derecha más centrada
ellipse(550,300,175,175);
ellipse(550,300,170,170);
ellipse(550,300,165,165);
ellipse(550,300,160,160);
ellipse(550,300,155,155);
ellipse(550,300,150,150);
ellipse(550,300,145,145);  
ellipse(550,300,140,140);
ellipse(550,300,135,135);
ellipse(550,300,130,130);
ellipse(550,300,125,125);
ellipse(550,300,120,120);
ellipse(550,300,115,115);
ellipse(550,300,110,110);
ellipse(550,300,105,105);
ellipse(550,300,100,100);
ellipse(550,300,95,95);
ellipse(550,300,90,90);
ellipse(550,300,85,85);
ellipse(550,300,80,80);
ellipse(550,300,75,75);
ellipse(550,300,70,70);
ellipse(550,300,65,65);
ellipse(550,300,60,60);
ellipse(550,300,55,55);
ellipse(550,300,50,50);
ellipse(550,300,45,45);

noFill();
strokeWeight(1);
stroke(255);
ellipse(250,300,180,180); // ellipses sin relleno blancas, izq más centrada
ellipse(250,300,175,175);
ellipse(250,300,170,170);
ellipse(250,300,165,165);
ellipse(250,300,160,160);
ellipse(250,300,155,155);
ellipse(250,300,150,150);
ellipse(250,300,145,145);  
ellipse(250,300,140,140);
ellipse(250,300,135,135);
ellipse(250,300,130,130);
ellipse(250,300,125,125);
ellipse(250,300,120,120);
ellipse(250,300,115,115);
ellipse(250,300,110,110);
ellipse(250,300,105,105);
ellipse(250,300,100,100);
ellipse(250,300,95,95);
ellipse(250,300,90,90);
ellipse(250,300,85,85);
ellipse(250,300,80,80);
ellipse(250,300,75,75);
ellipse(250,300,70,70);
ellipse(250,300,65,65);
ellipse(250,300,60,60);
ellipse(250,300,55,55);
ellipse(250,300,50,50);
ellipse(250,300,45,45);

noFill();
strokeWeight(1);
stroke(255);
ellipse(400,150,180,180); // ellipses sin relleno blancas, superior
ellipse(400,150,175,175);
ellipse(400,150,170,170);
ellipse(400,150,165,165);
ellipse(400,150,160,160);
ellipse(400,150,155,155);
ellipse(400,150,150,150);
ellipse(400,150,145,145);  
ellipse(400,150,140,140);
ellipse(400,150,135,135);
ellipse(400,150,130,130);
ellipse(400,150,125,125);
ellipse(400,150,120,120);
ellipse(400,150,115,115);
ellipse(400,150,110,110);
ellipse(400,150,105,105);
ellipse(400,150,100,100);
ellipse(400,150,95,95);
ellipse(400,150,90,90);
ellipse(400,150,85,85);
ellipse(400,150,80,80);
ellipse(400,150,75,75);
ellipse(400,150,70,70);
ellipse(400,150,65,65);
ellipse(400,150,60,60);
ellipse(400,150,55,55);
ellipse(400,150,50,50);
ellipse(400,150,45,45);

noFill();
strokeWeight(1);
stroke(255);
ellipse(400,450,180,180); // ellipses sin relleno blancas, inferior
ellipse(400,450,175,175);
ellipse(400,450,170,170);
ellipse(400,450,165,165);
ellipse(400,450,160,160);
ellipse(400,450,155,155);
ellipse(400,450,150,150);
ellipse(400,450,145,145);  
ellipse(400,450,140,140);
ellipse(400,450,135,135);
ellipse(400,450,130,130);
ellipse(400,450,125,125);
ellipse(400,450,120,120);
ellipse(400,450,115,115);
ellipse(400,450,110,110);
ellipse(400,450,105,105);
ellipse(400,450,100,100);
ellipse(400,450,95,95);
ellipse(400,450,90,90);
ellipse(400,450,85,85);
ellipse(400,450,80,80);
ellipse(400,450,75,75);
ellipse(400,450,70,70);
ellipse(400,450,65,65);
ellipse(400,450,60,60);
ellipse(400,450,55,55);
ellipse(400,450,50,50);
ellipse(400,450,45,45);

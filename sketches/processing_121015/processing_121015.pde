
//Link com imagem do parque http://upload.wikimedia.org/wikipedia/commons/e/ea/ParqueVitoriaRegia_Bauru_SP_2007.jpg
//Eu não nasci em Bauru, mas na cidade que eu nasci não tem nada de legal, então vou fazer da cidade que eu morava
//E eu odeio desenhar

size(1100,800);
textSize(20);
text("Parque Vitória Régia - Bauru",400,30);


//agua
noStroke();
fill(90,94,206);             
rectMode(CENTER);
  rect(700,600,1400,500);

//centro do parque
stroke(0);
fill(108,91,91);             //marrom claro
ellipseMode(CENTER);
  ellipse(550,550,650,270);

//acesso ao parque
fill(118,107,107);
stroke(0);
strokeWeight(3);
  quad(500,685,450,800,650,800,600,685);

//placas acusticas (não sei como dar nome nisso)
fill(142,124,124);
stroke(0);
strokeWeight(2);
  quad(480,100,450,400,590,400,560,100);          //quinta placa
  quad(830,200,800,400,940,400,910,200);          //décima placa
  quad(200,150,170,400,310,400,280,150);          //primeira placa
  quad(270,250,240,400,380,400,350,250);          //segunda placa
  quad(340,200,310,400,450,400,420,200);          //terceira placa
  quad(410,300,380,400,520,400,490,300);          //quarta placa
  quad(550,230,520,400,660,400,630,230);          //sexta placa
  quad(620,200,590,400,730,400,700,200);          //sétima placa
  quad(690,210,660,400,800,400,770,210);          //oitava placa
  quad(760,300,730,400,870,400,840,300);          //nona placa

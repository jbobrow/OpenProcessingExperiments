
size(774,861);
PImage b;
b = loadImage("fondo.jpg");
background(b);
smooth();

//LINEAS
stroke(255,0,0);   //ROJAS
strokeWeight(4); 
line(90,130,200,420);
line(170,430,230,410);
line(385,390,430,390);
line(270,670,320,700);

stroke(0);    //NEGRAS
strokeWeight(4);
line(90,200,95,270);
line(55,220,135,220);
line(305,335,520,390);
line(400,200,410,385);

stroke(0);   //AZUL
strokeWeight(4);
line(550,240,285,675);

stroke(#F09E22);  //NARANJA
strokeWeight(4);
line(380,440,550,330);

//TRIANGULO
noStroke();
fill(#F09E22);
triangle(280,227,365,225,335,350);

//RECTANGULOS
noStroke();

fill(255,0,0); //ROJOS
quad(100,360,575,180,580,195,105,375);
quad(485,165,510,150,540,250,510,260);
quad(360,85,475,70,480,95,360,110);
quad(160,195,375,170,375,225,160,230);

fill(0);  //NEGROS
quad(330,310,410,280,420,300,340,330);
quad(200,130,450,95,460,160,210,190);
quad(275,50,355,40,365,110,285,120);

fill(0,0,100); //AZUL
  quad(235,680,260,685,255,715,235,710);
  quad(260,560,285,560,285,570,265,575);
  





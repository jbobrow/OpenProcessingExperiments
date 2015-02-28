
/*fiz esse desenho baseado em parte da música Pela Internet, de Gilberto Gil, 
que fala sobre a jangada, e ao fundo uma paisagem clássica carioca.*/
size(400,400);
background(190, 234, 237);
noStroke();

fill(252,228,3);
ellipse(300,50,50,50);

fill(103, 140, 94);
arc(300, 315, 80, 100, 180, 360);
arc(370, 315, 100, 250, 180, 360);

fill(71, 19, 214);
rect(0,300,400,300);


/*ondas*/
ellipse(100,300,100,10);
ellipse(250,300,100,10);
ellipse(300,300,100,10);
ellipse(0,300,100,10);

/*barco*/
fill(48, 51, 5);
quad(100,310,200,310,250,270,50,270);
rectMode(CENTER);
rect(150,205,5,150);
fill(255);
triangle(154,130,280,250,154,250);

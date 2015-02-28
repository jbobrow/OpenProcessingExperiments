
/* Rut Diaz Palacios
   2n GEDI - 3r trimestre
   Informàtica 2013 - G03
   Elisava */
   
/* Seguidament es donara don a les varables, les quals seràn substituides per un valor numèric enter, el qual farè servir més endevantper poder programar el Mickey Mouse. Més endevant explicarè de quina manera.*/
int plujay1;
int plujay2;
int plujay3;
int plujay4;
int ulls;
 
/* Per poder començar a donar-li "vida" al Mickey s'ha d'utilitzar la funció de Setup, on defineixo la mida del que serà el meu dibuix i el color de fons. És en aquest moment en el que li he donar valor a les variables establertes anteriorment. */  
void setup ()
{
 size(500,500);
 background(211,222,152);
 plujay1=90;
 plujay2=120;
 plujay3=95;
 plujay4=115;
 ulls=75;
}
/* A continuació, li donc forma al Mickey Mouse i els elements que l'envolten. L'objectiu és que els núbols i la pluja es moguin horitzontalment al moure el "mouse" en la direcció de les x alhora que la pluja va caient sobre el Mickey degut a la força de la gravetat (verticalment) mentres ell observa el recorregut dels núbols fins que desapareixen i es queda el Sol.*/  
void draw ()
{
  /*Aquest background fa la funció d'eliminar el rastre del moviment de la */
background(211,222,152);

/*Com abans havia explicat, la finalitat és que mentre els núvols van desapareixent amb el pas del ratolí sobre la pantalla, el sol cada vegada va creixent i es manté per alegrar el dia al Mickey.*/
noStroke();
fill(245,239,57);
ellipse(127+mouseX/5,30+mouseX/12,60+mouseX/6,50+mouseX/6);

/*Aquests núvols es mouen tant en horitzontal (mouseX) com en vertical(mouseY), formant cercles durant el seu trajecte guiat pel mouse*/
fill(141,230,245);
ellipse(130+mouseX,50+mouseY/8,70,50);
ellipse(160+mouseX,60+mouseY/6,60,70);
ellipse(195+mouseX,30+mouseY/6,80,60);
ellipse(210+mouseX,70+mouseY/6,90,45);
ellipse(250+mouseX,45+mouseY/6,55,60);
ellipse(30+mouseX,50+mouseY/6,70,50);
ellipse(60+mouseX,60+mouseY/7,60,70);
ellipse(60+mouseX,30+mouseY/7,80,35);
ellipse(10+mouseX,70+mouseY/6,90,45);
ellipse(50+mouseX,45+mouseY/6,55,60);
strokeWeight(2);
line(130,90,130,100);


strokeWeight(2);
stroke(183,100,44);
line(400,70,400,90);
noStroke();
/*el color del paraigües també canvia alhora que s'arrossega el mouse al seu damunt.*/
fill(mouseX,211,140);
ellipse(400,185,250,200);
fill(211,222,152);
quad(100,180,100,400,500,400,500,180);
fill(183,100,44);
quad(390,180,400,180,400,280,390,280);


 
stroke(44,154,183);
strokeWeight(2);
/*Les linies blaves que simulen les gotes de la pluja van caient sense pressa però sense pausa sota els núvols carregats de la tormenta fugaç.*/
line(130+mouseX,plujay1,130+mouseX,plujay1+10);
line(265+mouseX,plujay1,265+mouseX,plujay1+20);
line(50+mouseX,plujay1,50+mouseX,plujay1+10);
line(80+mouseX,plujay1,80+mouseX,plujay1+20);
plujay1=plujay1+1;
line(160+mouseX,plujay2,160+mouseX,plujay2-20);
line(10+mouseX,plujay2,10+mouseX,plujay2-20);
plujay2=plujay2+1;
line(235+mouseX,plujay3,235+mouseX,plujay3+13);
line(40+mouseX,plujay3,40+mouseX,plujay3+11);
plujay3=plujay3+1;
line(220+mouseX,plujay4,220+mouseX,plujay4+15);
line(195+mouseX,plujay4,195+mouseX,plujay4+18);
plujay4=plujay4+1;


line(50+mouseX,plujay4,50+mouseX,plujay4+20);
line(75+mouseX,plujay4,75+mouseX,plujay4+6);


 
fill(122,165,48);
noStroke();
quad(0,465,30,465,0,500,30,500);
quad(20,465,50,465,20,500,50,500);
quad(40,465,70,465,40,500,70,500);
quad(60,465,90,465,60,500,90,500);
quad(80,465,110,465,80,500,110,500);
quad(100,465,130,465,100,500,130,500);
quad(120,465,150,465,120,500,150,500);
quad(140,465,170,465,140,500,170,500);
quad(160,465,190,465,160,500,190,500);
quad(180,465,210,465,180,500,210,500);
quad(200,465,230,465,200,500,230,500);
quad(220,465,250,465,220,500,250,500);
quad(240,465,270,465,240,500,270,500);
quad(260,465,290,465,260,500,290,500);
quad(280,465,310,465,280,500,310,500);
quad(300,465,330,465,300,500,330,500);
quad(320,465,350,465,320,500,350,500);
quad(340,465,370,465,340,500,370,500);
quad(360,465,390,465,360,500,390,500);
quad(380,465,410,465,380,500,410,500);
quad(400,465,430,465,400,500,430,500);
quad(420,465,450,465,420,500,450,500);
quad(440,465,470,465,440,500,470,500);
quad(460,465,490,465,460,500,490,500);
quad(480,465,510,465,480,500,510,500);
 
 
noStroke();
fill(0);
ellipse(250,250,125,125);
ellipse(185,185,75,75);
ellipse(315,185,75,75);
fill(44,43,43);
ellipse(185,185,45,45);
ellipse(315,185,45,45);
 
stroke(0);
fill(0);
quad(220,310,200,360,300,360,280,310);
quad(220,320,220,335,100,265,100,250);
quad(280,320,280,335,400,265,400,250);
fill(255);
noStroke();
ellipse(100,265,70,40);
ellipse(127,250,16,44);
ellipse(400,265,70,40);
ellipse(372,250,16,44);
 
stroke(0);
fill(255,3,3);
quad(201,360,199,450,300,450,300,360);
strokeWeight(0.6);
line(250,450,250,420);
fill(255);
ellipse(262,385,15,30);
ellipse(238,385,15,30);
fill(0);
quad(215,450,215,490,230,490,230,450);
quad(270,450,270,490,285,490,285,450);
fill(240,201,46);
ellipse(195,490,80,60);
ellipse(305,490,80,60);
 
noStroke();
fill(237,218,187);
ellipse(230,235,50,70);
ellipse(270,235,50,70);
ellipse(250,270,105,80);
ellipse(250,305,45,25);
fill(252,212,238);
ellipse(212,263,23,13);
ellipse(287,263,23,13);
fill(0);
ellipse(250,270,25,15);
fill(121,120,121);
ellipse(248,268,20,10);
fill(216,212,215);
ellipse(246,266,15,5);
fill(255);
ellipse(240,230,18,40);
ellipse(260,230,18,40);
fill(0);
/*El ratolí no es perd ni una, va observant com s'allunyen els núvols i es queda el dia radiant (se li ha donat moviment als ulls).*/
ellipse(240,220+mouseX/20,7,12);
ellipse(260,220+mouseX/20,7,12);
fill(245,35,101);
ellipse(250,300,40,17);
 
fill(237,218,187);
ellipse(250,295,40,10);
stroke(1);
line(250,300,250,305);
strokeWeight(1.5);
line(230,298,220,290);
line(270,298,279,290);
 

 
fill(50,82,50);
text("Rut Diaz Palacios",380,140);
text("2n GEDI, G03",380,160);
}




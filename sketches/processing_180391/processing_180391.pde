
//això canvia la mida de la pantalla , les x i y son termes absoluts a partir de la mida de la pantalla
size(600,400);
//pinta tot el fons passant per sobre els elements que hi ha abans, es com un gran rectangle de color
background(0,138,225);
//dibuixa linees a partir del eix x,y has de donar 4 valors, 2 per definir cada punt
line(10,70,90,30);
//definir la mida de les linees
strokeWeight(4);
//silueta contron per influir en els colors, a partir daqui tot serà d'aquest color fins que donis la instrucció contrària
stroke(0,255,0);
line(50,0,50,100);
//no vull contorn
noStroke();
//x dibuixar rodones també 4 paràmetres els dos primers per definir el centre del elipsi 3r parametre es diametre horitzontal i l'atre diàmetre vertical 
//tenir en compte l'ordre perque sinò la gran quedaria per sobre la petita
ellipse(400,300,200,100);
//el mateix però amb colors de relleno
fill(225,205,0);
//en l'escala de grisos els colors tenen els mateixos valors en R G i B--> podem posar només 1 valor (255)
stroke(255,255,255);
ellipse(400,300,50,50);
//rectangle: tercer i quart perametre defineixen alt i ample pero els primers dos són els valors del punt superior esquerra
rect(00,100,200,200);


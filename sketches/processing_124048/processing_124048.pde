
PFont font1;

//LISTAS (STRINGS) DE CADA TIPO DE PALABRA

String adj1 = "Distraidos,Obligados,Censurados,Impulsados,Incitados,Instruídos,Agitados,Confundidos,Atraídos,Agotados,Perplejos,Conducidos,Retirados,Construidos,Alentados,Dirigidos,Manipulados,Deseosos,Alterados,Derretidos";
String prep = " a, ante, bajo, cabe, con, contra, de, desde, en, entre, hacia, hasta, para, por, según, sin, de, sobre, tras, en";
String vrb1 = " razonar, encender, ser, abrir, conocer, superar, implementar, penetrar, sumar, discutir, comprar, trepar, ganar, reir, quebrar, imprimir, englutir, gozar, justificar, sobrecoger";
String art1 = " la, una, la, una, la, una, la, una, la, una, la, una, la, una, la, una, la, una, la, una";
String sust1 = " inmortalidad, personalidad, versatilidad, durabilidad, realidad, posibilidad, libertad, casualidad, propiedad, sociedad, novedad, tempestad, antigüedad, nacionalidad, capacidad, brutalidad, fragilidad, maternidad, sexualidad, dualidad";
String vrb2 = "habíamos dejado,hubimos pensado,habíamos sentido,hubimos construído,habíamos salpicado,hubimos intuido,habíamos tomado,hubimos jurado,habíamos desgarrado,hubimos tostado,habíamos fracasado,hubimos declarado,habíamos pausado,hubimos negociado,habíamos follado,hubimos contraído,habíamos metido,habíamos escupido,hubimos sacudido,habíamos querido";
String conj1 = " y, que, y, que, y, que, y, que, y, que, y, que, y, que, y, que, y, que, y, que";
String vrb3 = " anocheciera, amaneciera, iluminara, entendiera, convocara, intuyera, aclamara, sospechara, cumpliera, recitara, balanceara, despachara, recorriera, agitara, oxidara, brincara, arreglara, conceptualizara, levitara, controlara";
String sustFs = " lámpara, indiferencia, dulzura, voz, alma, muerte, navaja, pamplina, mística, noche, uva, carne, fruta, sinceridad, calma, avaricia, pelona, nación, uña, dueña, ";
String sn = " sí, no, sí, no, sí, no, sí, no, sí, no, sí, no, sí, no, sí, no, sí, no, sí, no,";
String vrb4 = " veíamos, confiábamos, entendíamos, fusionábamos, interpretábamos, enfurecíamos, enfriábamos, reprimíamos, concentrábamos, vulcanizábamos, diseñábamos, componíamos, duchábamos, doblábamos, repetíamos, caíamos, imaginábamos, pujábamos, rentábamos, ingeniábamos";
String art2 = " las, unas, las, unas, las, unas, las, unas, las, unas, las, unas, las, unas, las, unas, las, unas, las, unas";
String sustFp = " caras, personas, nalgas, luchas, tubas, lanzas, estrellas, tierras, mañanitas, drogas, frutas, jirafas, leyes, canastas, reglas, proteinas, fracciones, líneas, alas, nubes";
String adv1 = " más, muchas, todas, todo, más, muchas, todas, todo, más, muchas, todas, todo, más, muchas, todas, todo, más, muchas, todas, todo";
String adj2 = " convincentes, ardientes, despampanantes, incluyentes, ardientes, dudosas, corrientes, parlantes, simpáticas, duraderas, escandalosas, chillantes, dolientes, graciosas, cotorras, comunes, glotonas, hermosas, pandrosas, gomosas";
String sustMs = " fervor, cuerpo, hecho, hombre, acordeón, estorbo, libro, calor, ordenador, embajador, sombrero, vaquero, embustero, gato, bicarbonato, agujero, pelado, caballo, baquetón, ensayo";
String nombre = " Macedonio, Agabio, Doroteo, Séptimo, Octavio, Pascual, Hugo, Ezra, Joaquín, Elías, Rogelio, Isaías, Carlos, Adolfo, Vicente, Oriol, Lucas, Bruno, Gianfranco, Abner";
String apellido = " Fernández, Ledesma, Vega, Ojeda, Farías, Escobar, Aguirre, Oliva, Ibarra, Paredes, Tapia, Gaitán, Benitez, Saucedo, Galindo, Talamantes, Castañeda, Márquez, Buendía, Valenzuela";
String vrb5 = " repetía, aseguraba, jugaba, abría, cerraba, despachaba, incluía, rompía, tropezaba, fumaba, tocaba, salpicaba, intuía, esculpía, ideaba, conceptualizaba, crecía, negaba, creaba, destruía";
String vrb6 = " es, tiene, puede, cambia, corre, salta, miente, corta, escribe, engaña, cubre, rola, ríe, muerde, llora, prefiere, acata, coge, soba, hiere";
String adj3 = " inmortal, sorprendente, inminente, espacial, natural, corriente, insignificante, terrestre, dudosa, doliente, ardiente, efervecente, flamable, aguantable, inflable, respetable, mensurable, potable, fundamental, frecuente";
String proN = " me, nos, me, nos, me, nos, me, nos, me, nos, me, nos, me, nos, me, nos, me, nos, me, nos,";
String vrb7 = " morirse, doblarse, cavarse, encontrarse, cocinarse, acariciarse, tronarse, detenerse, corregirse, componerse, explotarse, organizarse, repetirse, acercarse, colocarse, arrepentirse, venirse, regarse, chuparse, codearse";
String adj4 = " nulo, sabroso, inútil, despiadado, controlado, temeroso, gentil, alterado, vecino, burlón, agripado, encantado, ordenado, dudoso, fastidioso, ansioso, leproso, viscoso, rufián, pudoroso, chulo";
String vrb8 = " sucederle, caerle, sobarle, quitarle, comprarle, manifestarle, golpearle, chuparle, brotarle, presionarle, insistirle, seducirle, equiparle, levitarle, atraerle, convocarle, redactarle, engañarle, orientarle, aplastarle";
String proPs = " yo, él, ella, yo, él, ella, yo, él, ella, yo, él, ella, yo, él, ella, yo, él, ella, yo, ella";
String adv2 = " infinitamente, presuradamente, paulatinamente, torpemente, singularmente, horriblemente, francamente, probablemente, simplemente, suavemente, prudentemente, tranquilamente, aparentemente, secillamente, vagamente, particularmente, excesivamente, mentalmente, desgraciadamente, torpemente";
String adj5 = " consternada, agitada, censurada, comisionada, arraigada, superada, delicada, preparada, rociada, cocinada, educada, perpleja, delgada, tallada, amarrada, nublada, disparatada, reventada, atrasada, espantada";
String vrbC1 = " les gusta, les prende, les encanta, les atrae, les canta, les escupe, les riega, les restrega, les aconseja, les unta, les miente, les alza, les prende, les interrumpe, les mueve, les late, les quita, les sella, les cuenta, les mira";
String conj2 = " y, ni, que, porque, y, ni, que, porque, y, ni, que, porque, y, ni, que, porque, y, ni, que, porque";
String vrbC2 = " les mintieron, les sobaron, les ganaron, les impidieron, les inflaron, les demandaron, les destruyeron, les demandaron, les impermeabilizaron, les impidieron, les agarraron, les esculpieron, les cantaron, les escribieron, les sacaron, les redactaron, les diseñaron, les raparon, les consultaron, les cobraron";
String adj6 = " vieja, plena, rota, hueca, sóla, confundida, fundida, fácil, tonta, buena, blanca, güera, fea, aburrida, corta, compleja, sagrada, ecléctica, quebrada, planchada";
String vrbC3 = "Propuse,Ignoré,Presté,Conduje,Cargué,Soplé,Inhalé,Teletransporté,Sonreí,Agarré,Conceptualicé,Desarrollé,Iluminé,Realicé,Vaporicé,Dudé,Escarbé,Desarrollé,Corté,Acaté";
String vrb9 = " suicidáramos, comiéramos, fumáramos, tomáramos, seduciéramos, alivianáramos, persiguiéramos, intuyéramos, cogiéramos, eleváramos, danzáramos, abrazáramos, perdiéramos, redactáramos, aleteáramos, digiriéramos, empujáramos, manejáramos, apantalláramos, sobresaliéramos";
String vrb10 = " sospecho, conozco, brinco, recojo, olfateo, remato, corrijo, golpeo, aviento, recuerdo, imprimo, retiro, camino, saludo, saco, meto, lleno, pongo, checo, entiendo";
String adj7 = " al final, al principio, al comienzo, al final, al principio, al comienzo, al final, al principio, al comienzo, al final, al principio, al comienzo, al final, al principio, al comienzo, al final, al principio, al comienzo, al final, al principio";
String vrb11 = " resolvieron, condujeron, generaron, comieron, integraron, cometieron, impulsaron, chingaron, rompieron, quemaron, limpiaron, fregaron, sacaron, pasaron, invirtieron, enseñaron, engañaron, sufrieron, recrearon, aniquilaron";
String vrb12 = " suicidamos, conocimos, cocinamos, freímos, desdoblamos, confundimos, atacamos, desnudamos, recortamos, enloquecímos, sorteamos, limpiamos, buscamos, tomamos, repetimos, tronamos, levantamos, reflexionamos, economizamos, rastreamos"; 
String SINO = "Sí,No,Sí,No,Sí,No,Sí,No,Sí,No,Sí,No,Sí,No,Sí,No,Sí,No,Sí,No,";
String prep1 = " ante, bajo, con, contra, de, desde, en, entre, hacia, hasta, para, por, sin, sobre, tras, en, con, sin, hasta";
String prep2 = " ante, bajo, con, contra, de, desde, en, entre, hacia, hasta, para, por, según, sin, so, sobre, tras, en, por, desde";
String prep3 = "A,Ante,Bajo,Cabe,Con,Contra,De,Desde,En,Entre,Hacia,Hasta,Para,Por,Según,Sin,Para,Sobre,Tras,En";
String prep4 = " a, ante, bajo, sin, con, contra, de, desde, en, entre, hacia, hasta, para, por, según, sin, so, sobre, tras, en";
String YOS = "Yo,Él,Ella,Me,Yo,Él,Ella,Me,Yo,Él,Ella,Me,Yo,Él,Ella,Me,Yo,Él,Ella,Me";
String peros = "Pero,Sin embargo,No obstante,Pero,Sin embargo,No obstante,Pero,Sin embargo,No obstante,Pero,Sin embargo,No obstante,Pero,Sin embargo,No obstante,Pero,Sin embargo,No obstante,Pero,Pero";
String MAS = "más,menos,más,menos,más,menos,más,menos,más,menos,más,menos,más,menos,más,menos,más,menos,más,menos";
String ESA = "esa,aquella,esa,aquella,esa,aquella,esa,aquella,esa,aquella,esa,aquella,esa,aquella,esa,aquella,esa,aquella,esa,aquella";
String uneltu = "Un,Él,Tu,Un,Él,Tu,Un,Él,Tu,Un,Él,Tu,Un,Él,Tu,Un,Él,Tu,Un,Tu";
String QUELA = "que la,a la,sin la,y la,que la,a la,sin la,y la,que la,a la,sin la,y la,que la,a la,sin la,y la,que la,a la,sin la,y la";



//SEPARACION DE LISTAS (STRINGS) POR PALABRA

String[] list1 = split(adj1, ',');
String[] list2 = split(adj2, ',');
String[] list3 = split(adj3, ',');
String[] list4 = split(adj4, ',');
String[] list5 = split(adj5, ',');
String[] list6 = split(adj6, ',');
String[] list7 = split(adj7, ',');
String[] list8 = split(prep, ',');
String[] list9 = split(vrb1, ',');
String[] list10 = split(vrb2, ',');
String[] list11 = split(vrb3, ',');
String[] list12 = split(vrb4, ',');
String[] list13 = split(vrb5, ',');
String[] list14 = split(vrb6, ',');
String[] list15 = split(vrb7, ',');
String[] list16 = split(vrb8, ',');
String[] list17 = split(vrb9, ',');
String[] list18 = split(vrb10, ',');
String[] list19 = split(vrb11, ',');
String[] list20 = split(vrb12, ',');
String[] list21 = split(vrbC1, ',');
String[] list22 = split(vrbC2, ',');
String[] list23 = split(vrbC3, ',');
String[] list24 = split(art1, ',');
String[] list25 = split(art2, ',');
String[] list26 = split(sust1, ',');
String[] list27 = split(sustFs, ',');
String[] list28 = split(sustFp, ',');
String[] list29 = split(sustMs, ',');
String[] list30 = split(conj1, ',');
String[] list31 = split(conj2, ',');
String[] list32 = split(sn, ',');
String[] list33 = split(adv1, ',');
String[] list34 = split(adv2, ',');
String[] list35 = split(nombre, ',');
String[] list36 = split(apellido, ',');
String[] list37 = split(proN, ',');
String[] list38 = split(proPs, ',');
String[] list39 = split(SINO, ',');
String[] list40 = split(prep1, ',');
String[] list41 = split(prep2, ',');
String[] list42 = split(prep3, ',');
String[] list43 = split(prep4, ',');
String[] list44 = split(YOS, ',');
String[] list45 = split(peros, ',');
String[] list46 = split(MAS, ',');
String[] list47 = split(ESA, ',');
String[] list48 = split(uneltu, ',');
String[]list49 = split(QUELA,',');


// ASIGNACION DE VALORES

int x1;
int x2;
int x3;
int x4;
int x5;
int x6;
int x7;
int x8;
int x9;
int x10;
int x11;
int x12;
int x13;
int x14;
int x15;
int x16;
int x17;
int x18;
int x19;
int x20;
int x21;
int x22;
int x23;
int x24;
int x25;
int x26;
int x27;
int x28;
int x29;
int x30;
int x31;
int x32;
int x33;
int x34;
int x35;
int x36;
int x37;
int x38;

int s40;

color bColor = color(0, 255, 255);



void setup () {
orientation(LANDSCAPE);
size (1260,750);
frameRate(60);
}

int col = 0;


void draw() {
  
  
background(bColor); 
  
    
fill(0,25);
noStroke();
rect(0,(height/6)*5,width,height/6);



x1 = int (random(19)); 
x2 = int (random(19));
x3 = int (random(19));
x4 = int (random(19));
x5 = int (random(19));
x6 = int (random(19));
x7 = int (random(19));
x8 = int (random(19));
x9 = int (random(19));
x10 = int (random(19));
x11 = int (random(19));
x12 = int (random(19));
x13 = int (random(19));
x14 = int (random(19));
x15 = int (random(19));
x16 = int (random(19));
x17 = int (random(19));
x18 = int (random(19));
x19 = int (random(19));
x20 = int (random(19));
x21 = int (random(19));
x22 = int (random(19));
x23 = int (random(19));
x24 = int (random(19));
x25 = int (random(19));
x26 = int (random(19));
x27 = int (random(19));
x28 = int (random(19));
x29 = int (random(19));
x30 = int (random(19));
x31 = int (random(19));
x32 = int (random(19));
x33 = int (random(19));
x34 = int (random(19));
x35 = int (random(19));
x36 = int (random(19));
x37 = int (random(19));
x38 = int (random(19));


 font1 = createFont("AmericanTypewriter.ttf", 32,true);
 textFont(font1, 14);


 
 fill(30);
 textSize(16);
 text("DIÁLOGO SOBRE UN DIÁLOGO SOBRE UN DIÁLOGO", 270, 60);
 
 fill(0);
 text("A.-", 280, 140);
 
 fill(0);
 text(list1[x2]+list40[x3]+list9[x4]+list24[x5]+list26[x6]+", ", 475, 160);
  
 fill(0);
 text(list10[x7]+" para que"+list11[x8]+list41[x9]+list9[x10]+list24[x11]+list27[x12]+".",475, 180);
  
 fill(0);
 text(list39[x13]+" nos"+list12[x14]+list25[x15]+list28[x16]+".", 475, 200);
  
 fill(0);
 text(list42[x17]+list24[x18]+list27[x19]+" y"+list24[x20]+list27[x21]+",", 475, 220);
  
 fill(0);
 text(list46[x38]+list2[x22]+" que "+"el"+list29[x23]+",",  475, 240);
  
 fill(0);
 text(list24[x24]+list27[x25]+list41[x26]+list35[x27]+list36[x28]+list13[x29], 472, 260);
  
 fill(0);
 text(list49[x10]+list27[x30]+list14[x31]+list3[x32]+".", 475, 280);
  
 fill(0);
 text(list44[x15]+list13[x33]+" que"+list24[x34]+list27[x35]+" del"+list29[x36],475, 300);
  
 fill(0);
 text(list14[x37]+" del "+"todo"+list3[x38]+" y"+" que ", 472, 320);
  
 fill(0);
 text(list15[x1]+list14[x2]+" que"+list9[x3]+" el"+list29[x4]+" más"+list4[x5],472, 340);
  
 fill(0);
 text("que"+list14[x6]+list16[x7]+list43[x9]+" un"+list29[x8]+".", 475, 360); 
  
 fill(0);
 text(list44[x18]+list13[x10]+list8[x11]+list24[x12]+list27[x13]+list8[x14]+list35[x15]+"; ",475, 380);
  
 fill(0);
 text("la"+list13[x16]+" y"+" la"+list13[x18]+".", 475, 400);
  
 fill(0);
 text( list48[x3]+list29[x19]+list4[x20]+list13[x21]+list34[x22]+list24[x23]+" Cumparsita"+",",475, 420);
 
 fill(0);
 text( list47[x4]+list27[x24]+list5[x25]+" que"+list21[x26]+list8[x27]+list33[x28]+list28[x29]+",",475, 440); 

 fill(0);
 text(list31[x30]+list22[x31]+" que"+list14[x32]+list6[x33]+"." ,472, 460);

 fill(0);
 text( list23[x34]+list8[x35]+list35[x36]+" que nos"+list17[x37]+list8[x38]+list9[x1]+list8[x2]+list29[x3]+".",475, 480); 
 
 fill(0);
 text("Z.-"+"    ("+list3[x4]+" )"+".-", 280, 510);
 
 fill(0);
 text( list45[x18]+list18[x9]+list31[x6]+list7[x36]+list32[x15]+" se"+list19[x19]+".", 475, 530);
 
 fill(0);
 text("A.-"+"    ("+list8[x9]+list6[x10]+list27[x11]+" )"+".-", 280, 570); 
 
 fill(0);
 text( list34[x13]+list32[x12]+list18[x14]+" si a esa"+list27[x15]+" nos"+list20[x17]+".", 472, 600);


}

boolean toggle=false;


void mousePressed(){

  if (mouseY>(height/6)*5 && toggle==true){
   bColor = (color) random(0x1000000) | 0xff000000;
    noLoop();
    toggle=false;
  }
  else{
    if (mouseY>(height/6)*5 && toggle==false) {
    loop();
    toggle=true; 
   }
  }
}



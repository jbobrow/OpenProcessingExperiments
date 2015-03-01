
/*
    Alunos: Hudson Luiz Cordeiro
        Renata Assis Machado Carvalho
        Wagner Luis Pereira
        
        13/10/2014
        
        Este leque representa Ada Lovelace como mulher, representando sua feminilidade,
        e consequentemente representando as mulheres dentro da computação, numa mistura 
        com componentes eletrônicos representados pela placa mãe no meio do leque
        (como se fosse em sua aba principal). Essa mistura representa a mulher e a computação em apenas 
        um componente, mostrando assim que é algo homogêneo, quebrando a ideia de que mulheres 
        não combinam com a matemática e consequentemente a computação. Por fim, temos a 
        representação da base de toda a computação: a lógica. 
        Esta representada pelos símbolos 1 e 0, que são alocados em bits. 
        Estes sendo unidades em um computador que representam os valores verdadeiro (1) ou falso (0).
*/
PFont f;
size (800,700);
f = loadFont("ArialMT-36.vlw");
background (255,255,255);
textSize(32);
fill(50);
text("101010101010101010101010101010101010101010101011011010100101010101010101101101010101010101000111010101010101101001010101010110100110101110100010110101010101000101100110100111010101000101010100001110101001110101010101000100010001011100011010101001010010101000101010101011110001010100111010011010101001010101010101010111100010010110100010111001010001111001010110010101010100101101111110011010010010100111100010101011100111000110101001100111010101010111100110100110101100101101100101001101001010010111001101010101011100011010010101010001101010110110010101010101001010111001010100101001010001010100111101001101001010011000111001010101", 0, 0, 800, 800);

strokeWeight(3);
stroke(0);
fill(36, 36, 36);
arc(400, 545, 605,480,PI,3*HALF_PI);
arc(400, 545, 605,480,3*HALF_PI,2*PI);

noStroke();

triangle(400,600, 96,545, 706,545);
fill(102,102,102);
triangle(400,600, 250,575, 556,575);
stroke(0,0,0);
line(400,600,100,546);
line(400,600,700,546);
fill(102, 102, 102);

arc(400, 575, 265,180,PI,3*HALF_PI);
arc(400, 575, 265,180,3*HALF_PI,2*PI);
line (400,600, 470,315);
line (400,600, 330,315);
line (400,600, 210,360);
line (400,600, 590,360);
line (400,600, 115,470);
line (400,600, 685,470);
strokeWeight(2);
rectMode(CENTER);
fill(20, 107, 17);
rect (400,355 ,80,80);
fill(232, 205, 53);
rect (380,335 ,20,20);
fill(232, 205, 53);
rect (410,335 ,10, 25);
fill(232, 205, 53);
rect (422,335 ,10, 25);
fill(232, 205, 53);
rect (380,360 ,25, 10);
fill(232, 205, 53);
rect (380,370 ,25, 10);
fill(232, 205, 53);
rect (380,380 ,25, 10);
fill(232, 205, 53);
rect (410,380 ,10, 10);
fill(232, 205, 53);
rect (422,380 ,10, 10);
textFont(f, 30);
text( "1" , 280, 576);
text( "0" , 305, 548);
text( "1" , 345, 525);
text( "0" , 390, 512);
text( "1" , 435, 525);
text( "0" , 475, 548);
text( "1" , 500, 576);
strokeWeight(10);
stroke(#192ADE);
point (400,600);



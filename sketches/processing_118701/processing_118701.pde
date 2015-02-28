
  //variables boca
  int bocaX=130;
  int bocaY=80;
  int principibocaX = 235;
  int finalbocaX = 365;
  int principibocaY = 420;
  int finalbocaY = 450;
  //variables ulls per al mapejat
  float posicioesquerradefaultX = 0;
  float posicioesquerradefaultY = 0;
  float posicioesquerramapejadaX = 0;
  float posicioesquerramapejadaY = 0;
  float posiciodretadefaultX = 0;
  float posiciodretadefaultY = 0;
  float posiciodretamapejadaX = map(mouseX, 0, width, posiciodretadefaultX -11, posiciodretadefaultX +11);
  float posiciodretamapejadaY = map(mouseY, 0, width, posiciodretadefaultY -9, posiciodretadefaultY +9);
  //variables nas
  int arc1 = 300;
  int arc2 = 300;
  int arc3 = 343;
  int principinasX =290;
  int principinasY =291; 
  int finalnasX = 310;
  int finalnasY = 340 ;
   //Necessari per introduir text
  PFont font;
  //color aleatori del cabell, les celles i la perilla
  float cabellR = (random(255));
  float cabellG = (random(255));
  float cabellB = (random(255));
  
void setup(){
  
  size (600,600);   
  frameRate(23);
  font = createFont("Calibri", 18, true);
}
void draw() {
  background (#000000);
  fill (#FFFFFF);
  rect (20,550,30,20);
  fill (#000000);
  //introduccio de text, paraula tot en el requadre blanc de l'extrem d'abaix a l'esquerra
  textFont(font);
  textAlign(CENTER, TOP);
  line(0, 70, width, 70);
  text("tot", 35, 550);
  
  fill (#FCD0B4);
  //orelles
  noStroke();
  fill (#FCD0B4);
  ellipse(124,310,20,90);
  ellipse(476,310,20,90);
  fill(#000000);
  ellipse(125,310,5,20);
  ellipse(475,310,5,20);
  
  //cara
  fill (#FCD0B4);
  ellipse (300,300, 350, 500);
  
  //ulls
  fill(#FFFFFF);
  //map per a poder fixar el centre de l'ull i el moviment màxim en la x i la y, en relació amb el moviment del mouse
    //ull esquerra map
  posicioesquerradefaultX = (220);
  posicioesquerradefaultY = (265);
  posicioesquerramapejadaX = map(mouseX, 0, width, posicioesquerradefaultX - 11, posicioesquerradefaultX + 11);
  posicioesquerramapejadaY = map(mouseY, 0, width, posicioesquerradefaultY - 9, posicioesquerradefaultY + 9);
    //ull dret map
  posiciodretadefaultX = 385;
  posiciodretadefaultY = 265;
  posiciodretamapejadaX = map(mouseX, 0, width, posiciodretadefaultX -11, posiciodretadefaultX +11);
  posiciodretamapejadaY = map(mouseY, 0, width, posiciodretadefaultY -9, posiciodretadefaultY +9);
  //Silueta ull
  stroke(#000000);
    //esuqerra
  ellipse(220,265,70,60);
    //dret
  ellipse(385,265,70,60);
  //Iris
  fill(#0070B8);
    //esquerra
  ellipse(posicioesquerramapejadaX, posicioesquerramapejadaY,35,30);
    //dret
  ellipse(posiciodretamapejadaX, posiciodretamapejadaY,35,30);

  //Canvi de color de l'iris
  if ((mouseX>185&&mouseX<256&&mouseY>242&&mouseY<284)|(mouseX>353&&mouseX<414&&mouseY>242&&mouseY<284)){
     if (mousePressed==true) {
  fill (random(255),random(255),255);
   //esquerra
  ellipse(posicioesquerramapejadaX, posicioesquerramapejadaY,35,30);
    //dret
  ellipse(posiciodretamapejadaX, posiciodretamapejadaY,35,30);
     }
  }
 //pupila
  fill(#000000);
    //esquerra
  ellipse(posicioesquerramapejadaX, posicioesquerramapejadaY,23,18);
    // dret
  ellipse(posiciodretamapejadaX, posiciodretamapejadaY,23,18);
  
  //boca
  fill(#FFFFFF);  
  arc(300, 420, bocaX, bocaY, 0, PI, OPEN);
  line(principibocaX,419,finalbocaX,419);
  
  //condicio per la qual es consegueix fer augmentar la boca amb un límit, arribat al qual tornarà a la posició original 
  
  if (((mouseX>=principibocaX&&mouseX<=finalbocaX)&&(mouseY>=principibocaY&&mouseY<=finalbocaY))|(mouseX>20&&mouseX<50&&mouseY>550&&mouseY<570)) {
  if (mousePressed==true&&principibocaX>210){
  
  bocaX = (bocaX + 2);
  bocaY = (bocaY + 2);
  principibocaX = (principibocaX -1);
  finalbocaX = (finalbocaX + 1);
  principibocaY = principibocaY;
  finalbocaY = finalbocaY + 1;
    }
    else{
      bocaX=130;
      bocaY=80;
      principibocaX = 235;
      finalbocaX = 365;
      principibocaY = 420;
      finalbocaY = 450;
      
    }
  }
 
  //color aleatori pel cabell
  cabellR = (random(255));
  cabellG = (random(255));
  cabellB = (random(255));
  
  //Celles
  stroke(#480C0C);
  fill(#480C0C);
  if ((mouseX>173&&mouseX<427&&mouseY>200&&mouseY<227)&&mousePressed){
    fill (cabellR, cabellG, cabellB);
    stroke (cabellR, cabellG, cabellB);
  }
  //Cella esquerra (de esquerra a dreta)
  triangle(187,205,205,218,161,238);
  triangle(187,205,205,218,234,205);
  triangle(205,218,234,205,254,212);
  triangle(230,215,254,212,260,223);
  
  //cella dreta (de dreta a esquerra
  triangle(340,223,346,212,370,215);
  triangle(346,212,366,205,397,218);
  triangle(413,205,397,218,366,205);
  triangle(397,218,413,205,439,238);
 
  //nas  
  stroke(#000000);
  line(290,291,285,334);
  line(310,291,315,334);
  noFill();
  arc(arc1, 340, 60, 60,PI-0.50,PI+QUARTER_PI);
  arc(arc2, 340, 60, 60,TWO_PI-0.75,TWO_PI+0.45);

  stroke(#000000);
  noFill();
  arc(300, arc3, 40, 30,TWO_PI,TWO_PI+PI);
  if ((mouseX>principinasX&&mouseX<finalnasX&&mouseY>principinasY&&mouseY<finalnasY)|(mouseX>20&&mouseX<50&&mouseY>550&&mouseY<570)){
    if (mousePressed==true&&arc1>=295) {
  arc1 = arc1 - 1;
  arc2 = arc2 + 1;
  arc3 = arc3 + 2;
  principinasX = principinasX-1;
  principinasY = principinasY+1;
  finalnasX = finalnasX + 1;
  finalnasY = finalnasY + 1;
    }
    else{
       arc1 = 300;
       arc2 = 300;
       arc3 = 343;
      principinasX =290;
      principinasY =291; 
      finalnasX = 310;
      finalnasY = 340;
  } 
  }

 
  
  //Cabell
  noFill();
  arc(300, 400, 500,540,QUARTER_PI,TWO_PI);
  noStroke();

  //correccions
  fill(#000000);
  rect(100,27,400,100);
  triangle(143,188,138,113,246,121);
  triangle(457,188,462,113,354,121);
  fill(#480C0C);
  stroke(#480C0C);
  if ((mouseX>157&&mouseX<439&&mouseY>45&&mouseY<150)&&mousePressed){
    fill (cabellR, cabellG, cabellB);
    stroke (cabellR, cabellG, cabellB);
  }
  //Part esquerra
  triangle(143,188,164,143,182,161);
  triangle(164,143,182,161,198,97);
  triangle(182,161,236,138,300,91);
  triangle(182,161,198,97,300,91);
  triangle(198,97,300,91,227,73);
  triangle(300,91,300,129,236,138);
  triangle(262,56,227,73,300,91);
  triangle(300,50,300,91,262,56);
 
  //part dreta
  triangle(300,50,300,91,338,56);
  triangle(338,56,373,73,300,91);  
  triangle(300,91,300,129,364,138);
  triangle(402,97,300,91,373,73);  
  triangle(418,161,402,97,300,91);
  triangle(418,161,364,138,300,91);
  triangle(436,143,418,161,402,97);
  triangle(457,188,436,143,418,161);
  //color perilla
  fill(#480C0C);
  stroke(#480C0C);
    if ((mouseX>230&&mouseX<356&&mouseY>476&&mouseY<555)&&mousePressed){
    fill (cabellR, cabellG, cabellB);
    stroke (cabellR, cabellG, cabellB);
  }
  //Perilla esquerra
  triangle(261,482,231,531,265,548);
  triangle(261,482,265,548,300,510);

  //perilla dreta
  triangle(339,482,369,531,335,548);  
  triangle(339,482,335,548,300,510);
  
  triangle(300,510,335,548,265,548);
  triangle(300,555,335,548,265,548);

  //canvi color d'ulls
  if (mouseX>20&&mouseX<50&&mouseY>550&&mouseY<570){
     if (mousePressed==true) {
    //Iris
    fill (random(255),random(255),255);
      //esquerra
    ellipse(posicioesquerramapejadaX, posicioesquerramapejadaY,35,30);
      //dret
    ellipse(posiciodretamapejadaX, posiciodretamapejadaY,35,30);
    
    //pupila
    fill(#000000);
      //esquerra
    ellipse(posicioesquerramapejadaX, posicioesquerramapejadaY,23,18);
      // dret
    ellipse(posiciodretamapejadaX, posiciodretamapejadaY,23,18);
    //Perilla
        fill (cabellR, cabellG, cabellB);
      stroke (cabellR, cabellG, cabellB);
    
      //Perilla esquerra
      triangle(261,482,231,531,265,548);
      triangle(261,482,265,548,300,510);

      //perilla dreta
      triangle(339,482,369,531,335,548);  
      triangle(339,482,335,548,300,510);
  
      triangle(300,510,335,548,265,548);
      triangle(300,555,335,548,265,548);
  
    //Celles
    fill (cabellR, cabellG, cabellB);
    stroke (cabellR, cabellG, cabellB);
  
      //Cella esquerra (de esquerra a dreta)
      triangle(187,205,205,218,161,238);
      triangle(187,205,205,218,234,205);
      triangle(205,218,234,205,254,212);
      triangle(230,215,254,212,260,223);
  
      //cella dreta (de dreta a esquerra
      triangle(340,223,346,212,370,215);
      triangle(346,212,366,205,397,218);
      triangle(413,205,397,218,366,205);
      triangle(397,218,413,205,439,238);
    
     fill (cabellR, cabellG, cabellB);
    stroke (cabellR, cabellG, cabellB);
  
      //Part esquerra
      triangle(143,188,164,143,182,161);
      triangle(164,143,182,161,198,97);
      triangle(182,161,236,138,300,91);
      triangle(182,161,198,97,300,91);
      triangle(198,97,300,91,227,73);
      triangle(300,91,300,129,236,138);
      triangle(262,56,227,73,300,91);
      triangle(300,50,300,91,262,56);
 
    //part dreta
      triangle(300,50,300,91,338,56);
      triangle(338,56,373,73,300,91);  
      triangle(300,91,300,129,364,138);
      triangle(402,97,300,91,373,73);  
      triangle(418,161,402,97,300,91);
      triangle(418,161,364,138,300,91);
      triangle(436,143,418,161,402,97);
      triangle(457,188,436,143,418,161);
      
  }
  }
  fill(#000000);
  noStroke();
  
}
 
  



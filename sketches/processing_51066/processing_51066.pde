
/* *******************************************************************************************************************************
   Monstre de Kim Guilbault
   TP1 dans le cours EDM4600  
******************************************************************************************************************************** */


//Initialiser les variables globales de position
float x;
float y;


//Configurer la scène
void setup(){
  size(400,400);
  background(50);
}

//LE DÉCOR ------------------------------------------------------------------------------------------------------------------------------
void draw(){
  smooth();
    
    
  //Rangées de briques
  fill(71,6,3);
  rect(0,0, 400,224);
  fill(158,13,7);
  stroke(158,13,7);
  strokeJoin(ROUND);
  strokeWeight(15);

  //Rangée 1 de briques
  int rangee1=0;
  while(rangee1 < width){
    beginShape();
      vertex(rangee1,0); 
      vertex(rangee1+45,0);
      vertex(rangee1+45,20);
      vertex(rangee1,20);
      vertex(rangee1,0);
    endShape();
    rangee1 = rangee1+61  ;
  }
  
  //Rangée 2 de briques
  int rangee2=-30;
  while(rangee2 < width){
    beginShape();
      vertex(rangee2,36); 
      vertex(rangee2+45,36);
      vertex(rangee2+45,53);
      vertex(rangee2,53);
      vertex(rangee2,36);
    endShape();
    rangee2 = rangee2+61  ;
  }
  
  //Rangée 3 de briques
  int rangee3=-50;
  while(rangee3 < width){
    beginShape();
      vertex(rangee3,69); 
      vertex(rangee3+45,69);
      vertex(rangee3+45,86);
      vertex(rangee3,86);
      vertex(rangee3,69);
    endShape();
    rangee3 = rangee3+61  ;
  }
  //Rangée 4 de briques
  int rangee4=-30;
  while(rangee4 < width){
    beginShape();
      vertex(rangee4,102); 
      vertex(rangee4+45,102);
      vertex(rangee4+45,119);
      vertex(rangee4,119);
      vertex(rangee4,102);
    endShape();
    rangee4 = rangee4+61  ;
  }
  //Rangée 5 de briques
  int rangee5=-45;
  while(rangee5 < width){
    beginShape();
      vertex(rangee5,135); 
      vertex(rangee5+45,135);
      vertex(rangee5+45,152);
      vertex(rangee5,152);
      vertex(rangee5,135);
    endShape();
    rangee5 = rangee5+61  ;
  }
  
  //Rangée 6 de briques
  int rangee6=-10;
  while(rangee6 < width){
    beginShape();
      vertex(rangee6,168); 
      vertex(rangee6+45,168);
      vertex(rangee6+45,185);
      vertex(rangee6,185);
      vertex(rangee6,168);
    endShape();
    rangee6 = rangee6+61  ;
  }
  //Rangée 7 de briques
  int rangee7=-50;
  while(rangee7 < width){
    beginShape();
      vertex(rangee7,201); 
      vertex(rangee7+45,201);
      vertex(rangee7+45,218);
      vertex(rangee7,218);
      vertex(rangee7,201);
    endShape();
    rangee7 = rangee7+61  ;
  }
 

  //Sac de poubelle
  fill(32,46,7);
  stroke(20,31,3);
  strokeWeight(1);
  beginShape();
  curveVertex(15,143);
  curveVertex(16,145);
  curveVertex(72,154);
  curveVertex(87,179);
  curveVertex(105,209);
  curveVertex(106,232);
  curveVertex(85,249);
  curveVertex(72,269);
  curveVertex(44,255);
  curveVertex(33,269);
  curveVertex(14,269);
  curveVertex(-1,255);
  curveVertex(-21,257);
  curveVertex(-37,232);
  curveVertex(-70,229);
  curveVertex(-55,206);
  curveVertex(-33,183);
  curveVertex(-50,149);
  curveVertex(-38,122);
  curveVertex(4,142);
  curveVertex(10,119);
  curveVertex(25,81);
  curveVertex(26,126);
  curveVertex(35,102);
  curveVertex(54,80);
  curveVertex(49,106);
  curveVertex(56,112);
  curveVertex(55,124);
  curveVertex(13.5,179.5);
  endShape();

  //Boucle du sac de poubelle
  strokeWeight(3);
  noFill();
  beginShape();
  curveVertex(48,173);
  curveVertex(28,181);
  curveVertex(12,148);
  curveVertex(9,149);
  curveVertex(27,127);
  curveVertex(41,149);
  curveVertex(-24,138);
  curveVertex(-14,162);
  curveVertex(11,148);
  curveVertex(10,149);
  curveVertex(14,174);
  curveVertex(2,182);
  endShape();

  //Ligne sur le sac de poubelle
  beginShape();
  curveVertex(102,207);
  curveVertex(72,219);
  curveVertex(69,194);
  curveVertex(66,195);
  curveVertex(57,236);
  curveVertex(29,211);
  curveVertex(-0.5,184);
  endShape();
  
  //Graph
  stroke(30);
  beginShape();
  curveVertex(310,36);
  curveVertex(296,9);
  curveVertex(328,12);
  curveVertex(342,57);
  curveVertex(341,17);
  curveVertex(295,45);
  curveVertex(358,33);
  curveVertex(350,59);
  curveVertex(335,57);
  curveVertex(328,37);
  curveVertex(324,54);
  curveVertex(363,10);
  curveVertex(317,65);
  curveVertex(324,6);
  curveVertex(367,54);
  curveVertex(321,20);
  curveVertex(360,3);
  curveVertex(414.5,-25.5);
  endShape();
  
  //Banane
  fill(249,250,8);
  strokeWeight(1);
  beginShape();
  curveVertex(9,245);
  curveVertex(0,221);
  curveVertex(13,216);
  curveVertex(19,242);
  curveVertex(28,245);
  curveVertex(44,247);
  curveVertex(75,253);
  curveVertex(80,266);
  curveVertex(51,261);
  curveVertex(25,251);
  curveVertex(29,262);
  curveVertex(41,267);
  curveVertex(91,283);
  curveVertex(55,288);
  curveVertex(29,282);
  curveVertex(15,252);
  curveVertex(11,261);
  curveVertex(9,265);
  curveVertex(-2,277);
  curveVertex(-12,278);
  curveVertex(-4,262);
  curveVertex(0,260);
  curveVertex(10,243);
  curveVertex(0,222);
  curveVertex(-54.5,164);
  endShape();
  
  //Ligne centre banane
  noFill();
  beginShape();
  curveVertex(-12,265);
  curveVertex(3,214);
  curveVertex(30,270);
  curveVertex(88,286);
  curveVertex(163,304);
  endShape();
  
  //Ligne droite banane
  beginShape();
  curveVertex(-11,289);
  curveVertex(14,244);
  curveVertex(30,250);
  curveVertex(82,260);
  curveVertex(161,216);
  endShape();
  
  //Ligne gauche banane
  beginShape();
  curveVertex(25,223);
  curveVertex(14,242);
  curveVertex(2,265);
  curveVertex(-26,300);
  curveVertex(-42,350);
  endShape();

  
  //LE MONSTRE -------------------------------------------------------------------------------------------------------------------------
  
  //Pour changer éventuellement de position du monstre 
  x = width/2;
  y = height/2;
  
  strokeWeight(1);
  stroke(0);
  
  
  //Pieds 
  int piedLargeur = 13;
  int piedHauteur = 50;
  
  fill(0);
  rect(x+25,y+125, piedLargeur,piedHauteur); //Gauche
  beginShape();
    curveVertex(x,y+174);
    curveVertex(x+37,y+159);
    curveVertex(x+60,y+174);
    curveVertex(x+30,y+174);
    curveVertex(x,y+174);
  endShape();
 
  rect(x-40,y+125, piedLargeur,piedHauteur); //Droit
  beginShape();
    curveVertex(x,y+174);
    curveVertex(x-37,y+159);
    curveVertex(x-60,y+174);
    curveVertex(x-30,y+174);
    curveVertex(x,y+174);
  endShape();
    
  //Corps du monstre
  beginShape();
    vertex(x+40,y-20);
    vertex(x+70,y+100);
    vertex(x,y+175);
    vertex(x-70,y+100);
    vertex(x-40,y-20);
  endShape();
  
  //Habit 
  fill(140);
  quad(x+25,y-35, x+25,y+100, x-25,y+100, x-25,y-35);
  
  //Tête
  arc(x,y-85,120,130,0,PI);
    
  //Oreilles 
  triangle(x-60,y-105, x-25,y-85, x-60,y-85); //Gauche
  triangle(x+60,y-105, x+25,y-85, x+60,y-85); //Droite
  stroke(140);
  line(x-25,y-85, x-59,y-85); //Gauche
  line(x+25,y-85, x+59,y-85); //Droite
  
  //Intérieur d'oreilles
  noStroke();
  fill(250,212,212);
  triangle(x+57,y-98, x+45,y-85, x+57,y-82);
  triangle(x-57,y-98, x-45,y-85, x-57,y-82);
  
  //Nez
  quad(x,y-45, x+10,y-35, x,y-23, x-10,y-35);
  
  //Noeud papillon
  fill(0);
  noStroke();
  beginShape();
    vertex(x+20,y-20); //Coin supérieur droit
    vertex(x+20,y);
    vertex(x+5,y-5);
    vertex(x-5,y-5);
    vertex(x-20,y);
    vertex(x-20,y-20);
    vertex(x-5,y-15);
    vertex(x+5,y-15);
    vertex(x+20,y-20);
  endShape();
  stroke(0);
  
 //Queue petite
  fill(30);
  beginShape();
    vertex(x+85,y+83); //Point le plus à gauche de la queue
    vertex(x+120,y+67);
    vertex(x+160,y+100);
    vertex(x+95,y+110);
    vertex(x+85,y+83);
  endShape();
  
  //Queue moyenne
  fill(10);
  beginShape();
    vertex(x+70,y+100); //Point le plus bas de la queue
    vertex(x+69,y+87);
    vertex(x+80,y+75);
    vertex(x+95,y+20);
    vertex(x+190,y-30);
    vertex(x+180,y+60);
    vertex(x+85,y+83);
    vertex(x+70,y+100);
  endShape();
  
  //Queue grande
  fill(0);
  beginShape();
    vertex(x+70,y+100); //Point le plus bas de la queue
    vertex(x+69,y+87);
    vertex(x+80,y+75);
    vertex(x+65,y-10);
    vertex(x+150,y-80);
    vertex(x+155,y+40);
    vertex(x+85,y+83);
    vertex(x+70,y+100);
  endShape();
  
  //Rayures queue grande
  fill(255);
  quad(x+65.5,y-10.5, x+75,y-18.5, x+90,y+80, x+80, y+90);
  quad(x+85,y-26.5, x+95,y-34.5, x+110,y+68, x+100, y+74);
  quad(x+105,y-42.5, x+115,y-51.5, x+130,y+55, x+120, y+62);
  quad(x+125,y-59.5, x+135,y-67.5, x+150,y+43, x+140, y+50);
  quad(x+145,y-76.5, x+150, y-79.5, x+155, y, x+155, y+40);
  

  //Bandeau sur les yeux
  fill(0);
  strokeJoin(ROUND);
  strokeWeight(20);
  beginShape();
    vertex(x-30,y-70); 
    vertex(x+30,y-70);
    vertex(x+30,y-50);
    vertex(x-30,y-50);
    vertex(x-30,y-70);
  endShape();
  strokeWeight(1);
  
  //Chapeau
  rect(x-25,y-95, 50,10);
  rect(x-17.5,y-130, 35,40);
  
  //Yeux 
  int yeux = 30;
  int pupille = 15;
  fill(255);
  ellipse(x-20,y-60,yeux,yeux); //Gauche
  ellipse(x+20,y-60,yeux,yeux); //Droit
  
  fill(0);
  ellipse(x-20,y-60,pupille,pupille); //Gauche
  ellipse(x+20,y-60,pupille,pupille); //Droit

}//fin void draw()




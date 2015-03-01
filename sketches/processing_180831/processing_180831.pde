
void setup() {  //setup function called initially, only once
  size(801, 601);
  background(255);  
  smooth();
  
  textSize(12);
}
 
void draw() {  //draw function loops
  background(255);
    
  stroke(200);
  dessiner_grille();
  
  textSize(14);
  strokeWeight(1);
  stroke(0);
  fill(0);
  textSize(16);
  text("Pour dessiner une ellipse nous avons besoin de connaitre quatre arguments (ou valeurs) : ",25,40);
  textSize(14);
  fill(255,0,0);
  text("1- la distance au centre depuis le bord gauche ",25,70);
  fill(0,255,0);
  text("2- la distance au centre depuis le bord gauche ",25,90);
  fill(0,0,255);
  text("3- la largeur de notre ellipse",25,110);
  fill(255,125,50);
  text("4- la hauteur de notre ellipse",25,130);
  
  stroke(0);
  fill(0);
  textSize(16);
  text("Pour dessiner le cercle ci-dessous, il faut donc ecrire cette ligne de code: ",25,170);
  textSize(28);
  text("ellipse(      ,      ,      ,       );",25,220);
  fill(255,0,0);
  text("400",115,220);
  fill(0,255,0);
  text("420",165,220);
  fill(0,0,255);
  text("360",225,220);
  fill(255,125,50);
  text("260",285,220);
  
  
  strokeWeight(1);
  stroke(0);
  fill(180,150);
  ellipse(400,420,360,260);
  
  strokeWeight(1);
  stroke(0);
  fill(0);
  ellipse(400,420,2,2);
  
  strokeWeight(2);
  stroke(255,0,0);
  fill(255,0,0);
  line(0,417,0,423);
  line(0,420,400,420);
  line(400,417,400,423); 
  textSize(16);
  text("40 carreaux = 40 x 10 pixels = 400 pixels",25,420-10);
  
  strokeWeight(2);
  stroke(0,255,0);
  fill(0,255,0);
  line(397,0,403,0);
  line(400,0,400,420);
  line(397,420,403,420);
  textSize(16);
  text("42 carreaux = 42 x 10 pixels",width/2+20,220 );
  text("            = 420 pixels",width/2+20,240 );
  
  strokeWeight(2);
  stroke(0,0,255);
  fill(0,0,255);
  line(220,557,220,563);
  line(220,560,580,560);
  line(580,557,580,563);
  textSize(16);
  text("36 carreaux = 36 x 10 pixels = 360 pixels",width/2-150,575 );
  
  strokeWeight(2);
  stroke(255,120,25);
  fill(255,120,25);
  line(587,290,593,290);
  line(590,290,590,550);
  line(587,550,593,550);
  textSize(16);
  text("26 carreaux = 26 x 10 pixels",width/2+200,400);
  text("          = 260 pixels",width/2+200,420);
  
   
  strokeWeight(1);
  stroke(0);
  fill(0);
  line(width-100,height-67,width-100,height-73);
  line(width-80,height-67,width-80,height-73);
  line(width-100,height-70, width-80, height-70);
  textSize(12);
  text("20 pixels", width-100,height-50);
   
}
 
 
void dessiner_grille(){
    for (int i = 0 ; i <= width ; i+=10){
        line(i,0,i,height);
        for (int j = 0 ; j <= height ; j +=10){
            line(0,j,width,j);
        }
    }
}

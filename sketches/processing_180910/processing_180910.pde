
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
  text("Pour dessiner une carré nous avons besoin de connaitre quatre arguments (ou valeurs) : ",25,40);
  textSize(14);
  fill(255,0,0);
  text("1- la distance au coin superieur gauche du carre, depuis le bord gauche ",25,70);
  fill(0,255,0);
  text("2- la distance au coin superieur gauche du carre, depuis le bord haut ",25,90);
  fill(0,0,255);
  text("3- la largeur de notre carre",25,110);
  fill(255,125,50);
  text("4- la hauteur de notre carre",25,130);
   
  stroke(0);
  fill(0);
  textSize(16);
  text("Pour dessiner le carre ci-dessous, il faut donc ecrire cette ligne de code: ",25,170);
  textSize(28);
  text("rect(      ,      ,      ,       );",25,220);
  fill(255,0,0);
  text("400",85,220);
  fill(0,255,0);
  text("290",140,220);
  fill(0,0,255);
  text("360",190,220);
  fill(255,125,50);
  text("260",250,220);
   
   
  strokeWeight(1);
  stroke(0);
  fill(180,150);
  rect(400,290,360,260);
   
  
  strokeWeight(2);
  stroke(255,0,0);
  fill(255,0,0);
  line(0,287,0,293);
  line(0,290,400,290);
  line(400,287,400,293);
  textSize(16);
  text("40 carreaux = 40 x 10 pixels = 400 pixels",25,310);
   
  strokeWeight(2);
  stroke(0,255,0);
  fill(0,255,0);
  line(397,0,403,0);
  line(400,0,400,290);
  line(397,290,403,290);
  textSize(16);
  text("29 carreaux = 29 x 10 pixels",width/2+20,220 );
  text("            = 290 pixels",width/2+20,240 );
   
  strokeWeight(2);
  stroke(0,0,255);
  fill(0,0,255);
  line(400,557,400,563);
  line(400,560,760,560);
  line(760,557,760,563);
  textSize(16);
  text("36 carreaux = 36 x 10 pixels = 360 pixels",width/2+15,575 );
   
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
  line(100,height-67,100,height-73);
  line(80,height-67,80,height-73);
  line(100,height-70,80, height-70);
  textSize(12);
  text("20 pixels", 80,height-50);
    
}
  
  
void dessiner_grille(){
    for (int i = 0 ; i <= width ; i+=10){
        line(i,0,i,height);
        for (int j = 0 ; j <= height ; j +=10){
            line(0,j,width,j);
        }
    }
}


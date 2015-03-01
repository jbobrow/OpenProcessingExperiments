
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
  text("Pour dessiner un triangle nous avons besoin de connaitre six arguments (ou valeurs) : ",25,20);
  textSize(14);
  fill(255,0,0);
  text("1- la distance depuis le bord gauche au premier sommet du triangle",25,50);
  fill(0,255,0);
  text("2- la distance depuis le bord haut au premier sommet du triangle ",25,70);
  fill(0,0,255);
  text("3- la distance depuis le bord gauche au deuxieme sommet du triangle",25,90);
  fill(255,125,50);
  text("4- la distance depuis le bord haut au deuxieme sommet du triangle",25,110);
  fill(128,0,96);
  text("5- la distance depuis le bord gauche au troisieme sommet du triangle",25,130);
  fill(193,223,0);
  text("6- la distance depuis le bord haut au troisieme sommet du triangle",25,150);
    
  stroke(0);
  fill(0);
  textSize(16);
  text("Pour dessiner le triangle ci-dessous, il faut donc ecrire cette ligne de code: ",25,185);
  textSize(28);
  text("triangle(      ,      ,     ,     ,      ,      );",25,220);
  fill(255,0,0);
  text("400",125,220);
  fill(0,255,0);
  text("290",180,220);
  fill(0,0,255);
  text("700",230,220);
  fill(255,125,50);
  text("320",280,220);
  fill(128,0,96);
  text("530",330,220);
  fill(193,223,0);
  text("540",380,220);
    
    
  strokeWeight(1);
  stroke(0);
  fill(180,150);
  triangle(400,290,700,320, 530,540);
    
   
  strokeWeight(2);
  stroke(255,0,0);
  fill(255,0,0);
  line(0,287,0,293);
  line(0,290,400,290);
  line(400,287,400,293);
  textSize(16);
  text("40 carreaux = 400 pixels",25,310);
    
  strokeWeight(2);
  stroke(0,255,0);
  fill(0,255,0);
  line(397,0,403,0);
  line(400,0,400,290);
  line(397,290,403,290);
  textSize(16);
  text("29 carreaux ",width/2+20,250 );
  text("= 290 pixels",width/2+20,270 );
    
  strokeWeight(2);
  stroke(0,0,255);
  fill(0,0,255);
  line(0,317,0,323);
  line(0,320,700,320);
  line(700,317,700,323);
  textSize(16);
  text("70 carreaux = 700 pixels",150+15,340 );
    
  strokeWeight(2);
  stroke(255,120,25);
  fill(255,120,25);
  line(697,0,703,0);
  line(700,0,700,320);
  line(697,320,703,320);
  textSize(16);
  text("32 carreaux ",705,200);
  text("= 320 pixels",705,220);
  
  strokeWeight(2);
  stroke(128,0,96);
  fill(128,0,96);
  line(0,537,0,543);
  line(0,540,530,540);
  line(530,537,530,543);
  textSize(16);
  text("53 carreaux = 530 pixels",250+15,540+25 );
  
  strokeWeight(2);
  stroke(193,223,0);
  fill(193,223,0);
  line(527,0,533,0);
  line(530,0,530,540);
  line(527,540,533,540);
  textSize(16);
  text("54 carreaux ",535,450);
  text("= 540 pixels",535,470);
  
    
     pushMatrix();
     translate(0,20);
  strokeWeight(1);
  stroke(0);
  fill(0);
  line(100,height-67,100,height-73);
  line(80,height-67,80,height-73);
  line(100,height-70,80, height-70);
  textSize(12);
  text("20 pixels", 80,height-50);
  popMatrix();
     
     
  
}
   
   
void dessiner_grille(){
    for (int i = 0 ; i <= width ; i+=10){
        line(i,0,i,height);
        for (int j = 0 ; j <= height ; j +=10){
            line(0,j,width,j);
        }
    }
}

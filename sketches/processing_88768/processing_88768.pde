
//centre du pingouin monstre 
float x;
float y;
 
void setup(){
  size(400,400);
  frameRate(30);
  smooth();
   
//centre du monstre 
x = width/2;
y = height/2;

}
 
 
void draw (){
   
 background(255);
     
//ellipse tête
  fill (130,220,130);
  stroke(130,220,130);
  ellipse (x, y-50, 135, 135);
  
//ellipse corps
  fill (130,220,130);
  stroke(130,220,130);
  ellipse (x, y+35, 165, 165);
  
//ellipse bras gauche
  fill(130,220,130);
  stroke(130,220,130);
  pushMatrix();
  translate(x-80,y);
  rotate(PI/4);
  ellipse(0,0,30,120);
  popMatrix();
  
//ellipse bras droit
  fill(130,220,130);
  stroke(130,220,130);
  pushMatrix();
  translate(x+80,y);
  rotate(-PI/4);
  ellipse(0,0,30,120);
  popMatrix();
  
//ellipse ombrage bras gauche
  fill(180,230,180);
  stroke(180,230,180);
  pushMatrix();
  translate(x-95,y+8);
  rotate(PI/4.5);
  ellipse(0,0,10,60);
  popMatrix();
  
//ellipse ombrage bras droit
  fill(180,230,180);
  stroke(180,230,180);
  pushMatrix();
  translate(x+95,y+8);
  rotate(-PI/4.5);
  ellipse(0,0,10,60);
  popMatrix();
  
//ellipse oeil gauche
  fill (255);
  stroke(255);
  ellipse (x-22, y-45, 44, 60);
  
//ellipse pupillee oeil gauche
  fill (0);
  stroke(0);
  ellipse (x-8, y-45, 12, 22);
  
//ellipsereflet pupille gauche
  fill (125);
  stroke(125);
  ellipse (x-8, y-50, 5, 7);
  
//ellipse oeil droit
  fill (255);
  stroke(255);
  ellipse (x+25, y-45, 50, 40);

//ellipse pupille oeil droit
  fill (0);
  stroke(0);
  ellipse (x+7, y-45, 10, 20);
  
//ellipse reflet pupille droite
  fill (125);
  stroke(125);
  ellipse (x+7, y-50, 5, 7);
  
//ellipse bedon blanc
  fill (255);
  stroke(255);
  ellipse (x, y+40, 130, 145);
  
//triangle bec 
  fill(255,0,0);
  stroke(255,0,0);
  triangle(x-20,y-30,x+20,y-30,x,y);
  
//triangle reflet bec 
  fill(220,130,130);
  stroke(220,130,130);
  triangle(x-20,y-30,x,y-30,x,y);
  
//ellipse pied droit
  fill (255,0,0);
  stroke(255,0,0);
  ellipse (x+40, y+120, 70, 50);
  
//degradé pied droit (boucle dans le dégradé)
for(int i=0; i<=70; i++){
    noStroke();
    fill(255-i,0+i,0+i);
    ellipse (x+40,y+120, 70-i, 50-(5*i/7));
}
  
//ellipse pied gauche
  fill (255,0,0);
  stroke(255,0,0);
  ellipse (x-40, y+120, 70, 50);
  
//degradé pied droit (boucle dans le dégradé)
for(int i=0; i<=70; i++){
    noStroke();
    fill(255-i,0+i,0+i);
    ellipse (x-40,y+120, 70-i, 50-(5*i/7));
}

  }




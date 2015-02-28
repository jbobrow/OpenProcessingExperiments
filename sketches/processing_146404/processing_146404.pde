
//OBJETIVO: DARLE A LA BOLA QUE REBOTA CON EL FIN DE PARAR EL TIEMPO

//ULLS
float x=150;
float y=100;
float mida=30;
float v=4;
float vy=5;

//BOLA REBOT
float x1;
float y1;
int mida1= 50;
float v1=5;
float vy1=2;
int totalEements = 5;

//BOLA CANVI FORMA/COLORS


void setup(){
  size(500,600);

  x1=random(width);
  y1=random(height);
}
 
void draw (){
  background(255);
  //noCursor();
  
//bola rebot
  
  ellipse(x1,y1,mida1,mida1);
  x1=x1+v1; //x=x+1 (el valor d1 es substitueix per int v);
  y1=y1+vy1;
  if (x1+mida1/2> width || x1-mida1/2<0){
  v1=-v1;
  }
  if (y1+mida1/2> height || y1-mida1/2<0){
  vy1=-vy1;
  
  }
  
//comandaments bola cambia forma/color 
  
  if (mouseY <width/6) {
  
  fill(0,0,255);
  ellipse(mouseX,mouseY,50,50);

}
  else if (mouseY<(width/6)*2){
   fill(0,255,0);
   
   ellipse(mouseX,mouseY,75,75);

}
  else {
  
  fill(255,0,0);
  ellipse(mouseX,mouseY,90,90);
 
 
}
 
 
dibuixNobita();
  
comprobarLimits();

   if (x> 205 || x<135){
    v=-v;
  }
   if (y> 135 || y<55){
    vy=-vy;
   }
}
 
void dibuixNobita(){
  //cabell
  fill(0);
  ellipse(275,200,350,350);
 
  fill(255);
  noStroke();
  ellipse(300,325,300,300);
 
  //cara fons
  rect(95,150,50,100);
  fill(252,198,164);
  ellipse(250,250,300,250);
  noStroke();
  rect(125,120,274,150);
  ellipse(262,120,272,50);
  ellipse(420,250,70,100);
  stroke(1);
  ellipse(420,250,15,40);
 
  //fons retall cabell
  fill(255);
  noStroke();
  rect(85,111,50,50);
 
  //ulleres
  stroke(1);
  fill(255);
  rect(120,140,90,110);
  fill(255);
  rect(220,140,100,110);
  line(320,200,400,200);
  
  //nas
  fill(252,198,164);
  stroke(1);
  ellipse(200,250,30,30);
  fill(252,198,164);
  noStroke();
  ellipse(208,252,30,30);
 
  //coll
  fill(252,198,164);
  rect(220,340,100,50);
 
  //detalls
  stroke(1);
  noFill();
  bezier(135, 300, 120, 340, 150, 340, 135, 300);
  bezier(135,120,150,mouseY,170,100,190,130);
  bezier(220,130,250,mouseY,300,100,330,130);
  strokeWeight(2);
  bezier(430,120,435,115,450,100,460,80);
  bezier(430,120,435,125,450,125,460,145);
  fill(255);
  noStroke();
 
  //roba
  fill(252,mouseY,164);
  noStroke();
  rect(190,400,150,200);
  fill(252,mouseY,164);
  triangle(190,400,220,380,220,400);
  triangle(320,400,320,380,340,400);
  rect(220,380,100,20);
  ellipse(185,440,60,80);
  ellipse(180,520,60,200);
  ellipse(350,440,60,80);
  ellipse(355,520,60,200);
  stroke(1);
  noFill();
  bezier(200,600,200,570,190,550,190,450);
  bezier(330,600,330,570,320,550,330,450);
  fill(252,198,164);
  noStroke();
  triangle(220,379,320,379,230,450);
  stroke(1);

 //ulls
  fill(0);
  ellipse(x,y+100,30,30);
  ellipse(x+100,y+100,30,30);
  x=x+v; //x=x+1 (el valor d1 es substitueix per int v);
  y=y+vy;
  fill(255);
  ellipse(x-10,y+100,10,10);
  ellipse(x+90,y+100,10,10);

}
 
void comprobarLimits(){;
 
//if (mouseX > 220){ // quedarse ciego derecha
//  background(1);
//  fill(255,0,0);
//  textSize(25);
//  createFont("Arial",16,true);
//  text("¡¡AUGGHHTT!!! MIS OJOOOSSSSS!!!",40,250);
//}
//if (mouseX< 100){ //quedarse ciego izquierda
//  background(1);
//  fill(255,0,0);
//  textSize(25);
//  createFont("Arial",16,true);
//  text("¡¡AUGGHHTT!!! MIS OJOOOSSSSS!!!",40,250);
//}
//if (mouseY< 35){ //quedarse ciego arriba
//  background(1);
//  fill(255,0,0);
//  textSize(25);
//  createFont("Arial",16,true);
//  text("¡¡AUGGHHTT!!! MIS OJOOOSSSSS!!!",40,250);
//}
//if (mouseY> 165){ //quedarse ciego abajo
//  background(1);
//  fill(255,0,0);
//  textSize(25);
//  createFont("Arial",16,true);
//  text("¡¡AUGGHHTT!!! MIS OJOOOSSSSS!!!",40,250);
}

 void mousePressed(){
  if (dist (mouseX,mouseY,x1,y1)<mida1/2){ //fer que reboti unicament quan toques la bola
  
  v=0;
  vy= 0;
  
  v1=0;
  vy1= 0;
//x=mouseX;
//y=mouseY;
   }
 }




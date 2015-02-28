
int colorpokeball=#DF1600;
int colorLuna=#EFFF32;

void setup (){
  
  size (600,600);
  smooth();

}

void draw () {
  background(0,0,mouseX/2);
  
  //sol y luna
  fill(colorLuna);
  ellipse(550,50,50,50);
  
  //terreno
  fill(#00A413);
  rect (0,350,600,300);
  
  //cola Pokemo
  fill (0);
  rect (440,400,80,30);
  rect (490,400,30,190);
  rect (350,560,150,30);
  fill (74,132,170);
  ellipse (320,560,150,150);
  
  //orejas
  fill (74,132,170);
  ellipse (150,150,200,200);
  fill (163,74,170);
  ellipse (150,150,150,150);
  fill (74,132,170);
  ellipse (450,150,200,200);
  fill (163,74,170);
  ellipse (450,150,150,150);
  
  //Pokemon cuerpo
  fill(74,132,170);
  ellipse(300,300,400,400);
  ellipse(300-150,500,200,100);
  ellipse(300+150,500,200,100);
  
  //pokemonojos
  noStroke();
  fill(0);
  ellipse(200,250,100,mouseY/5);
  ellipse(400,250,100,mouseY/5);
  fill(#FFFFFF);
  ellipse(220,250,50,mouseY/10);
  ellipse(420,250,50,mouseY/10);
  
  //pokemonsSonrisa
  
  fill(163,74,170);
  arc(300,350,80,mouseY/2,radians(0),radians(180));
  fill(800,132,170);
  arc(300,350,80,mouseY/5,radians(0),radians(180));
  
  //manos Pokemon
  fill(74,132,170);
  ellipse (80,300,100,100);
  ellipse (520,300,100,100);
  
   //pokeball
  fill(#FFFFFF);
  arc(mouseX,mouseY,80,80,radians(0),radians(180));
  fill(colorpokeball);
  arc(mouseX,mouseY,80,80,radians(-180),radians(0));
  fill(#FFFFFF);
  stroke(0);
  ellipse (mouseX,mouseY,20,20);
   

}

void mousePressed(){

  fill(colorpokeball=#033D95);
  fill(colorLuna=#7E7E7E);

}

void mouseReleased(){

   fill (colorpokeball=#DF1600);
   fill (colorLuna=#EFFF32);

}






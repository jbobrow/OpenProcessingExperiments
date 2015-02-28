
//cara JAKE
void setup (){
  size (450,450);
  background (255,255,0);
}
//la usaremos para MouseReleased
int variable = 0;

void draw (){
//ojos
  background (255,255,0);
  noStroke();
  fill (255);
  ellipse(100,125,100,10+mouseY/5);
  ellipse(350,125,100,10+mouseY/5);
//pupilas, al presionar se vuelven de colores llamativos, sino
//se ponen negros
  if (mousePressed){
    int relleno = int (random(255));
    fill(relleno,relleno*2,relleno/5);
  }
  else{ 
    fill(0,0,0);
  }
//ojos, aumentan y disminuyen en los 2 ejes sin que pase un tope  
  ellipse(100,125,5+mouseX/6,5+mouseY/8);
  ellipse(350,125,5+mouseX/8,5+mouseY/8);
//cejas
   fill (0,0,0);
   triangle(50,75,175,65,175,35);
   triangle(400,75,275,65,275,35);
//nariz, cambia al mover por los ejes
  fill(mouseX,0,mouseY);
  ellipse(225,225,75,75);
  //mofletes
  fill(255,variable/2,variable/2);
  ellipse(50,275,75,75);
  ellipse(400,275,75,75);
//prueba
//boca
  fill (255,0,0);
  arc(225,300,300,250,radians(10),radians(170));
}
void mouseReleased (){
  if (variable == 0){
    variable = int (random(255));
  }
  else{
    variable = 0;
  }
}
  
  


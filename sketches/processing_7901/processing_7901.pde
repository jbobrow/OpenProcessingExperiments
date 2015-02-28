
void setup () {
  size (ancho, alto);
  background(#FFFFFF);
  frameRate(500);
  smooth();
}

int alto = 500;
int ancho = 900;
float x, y;
int cont = 0;
int cont2 = 1;
void draw () {
  noStroke();
  fill(#000000);
  float r = random(random(20));
  x = random(ancho);
  y = random(alto);
  
  ellipse(x,y,r,r);
  if (x > random(300,400) && x < random(500,600) && y > random(100,200) && y < random(300,400)){
    fill(#FFFFFF);
    //noFill();
    stroke(#000000);
    ellipse(x,y,r+1,r+1);
  }
  cont++;  
  if (cont%500 == 0){
    //save((month()+""+day()+""+hour()+""+minute()+""+second())+".PNG");
    //println(cont2);
    //println((month()+""+day()+""+hour()+""+minute()+""+second())+".PNG");
    cont2++;
    filter(BLUR,2);
    if(cont2 > 15){
      noLoop();
      //println("NOLOOP");
    }
  }
}

void mouseReleased(){ 
  background(#FFFFFF);
  redraw();
  cont = 0;
  cont2 = 0;
}
   




triang a, b;

    
void setup () {
  size (500, 700);
  background (255);//triang (float x, float y, , float speed, color1, opacidad) 
  
  a = new triang (250,350, 0.9, 255, 100);
  b = new triang (50, 50, 0.3, 255, 100);
}

void draw () {
  
  
  a.update();
  a.display();

  b.update();
  b.display();
  
  if(mousePressed); {   //NO ME FUNCIONA
  if(mouseButton==RIGHT) {
    a.speed++;
    b.speed++;
  }
  
  if(mouseButton==LEFT) { //NO ME FUNCIONA! =(
    
    stroke(255,0,0);
  }
  else {
    stroke(1);
  }
}
  
  float x = random (0, 550);
  float y = random (0, 750);
  float girar = random (0.0+PI, 0.0+TWO_PI);//  rojo
  float girar1 = random (0.0-HALF_PI, PI);// gris
  float girar2 = random (0.0+HALF_PI, PI+ HALF_PI); //azul
  float girar3 = random (0.0-HALF_PI, TWO_PI); //cyan
  float opacidad = random (10, 100);
 
  
   //linea cyan
  pushMatrix();
  translate(x++, y++);
  rotate (girar3);
  strokeWeight (0.5);
  stroke(0,174,239,90);
  line(150,300, 150,400);
  popMatrix();
 
  //linea roja
  pushMatrix();
  translate(x++, y++);
  rotate(girar);
  strokeWeight(0.5);
  stroke(255,0,0,90);
  line(250,300, 250,400);
  popMatrix();

//linea gris
  pushMatrix();
  translate(x++, y++);
  rotate(girar1);
  strokeWeight(0.5);
  stroke(200,90);
  line(250,200, 250,500);
  popMatrix();
  
 //linea azul 
  pushMatrix();
  translate(x++, y++);
  rotate (girar2);
  strokeWeight (0.2);
  stroke(0,0,255,90);
  line(250,300, 250,400);
  popMatrix();
   
}

class triang {
  float xpos;
  float ypos;
  float speed;
  int color1;
  int color2;
  float gira;
 
  triang (float x, float y, float s, int c1, int c2) {
    
    xpos = x;
    ypos = y;
    speed = s;
    color1 = c1;
    color2 = c2;

  }
 
 
  void update() {
    xpos = xpos+50;
    ypos = ypos+25;
    gira = gira+0.01;
 
    if (ypos > height) {
      ypos*= -1;
      xpos*=-1;
    }
  }
 
  void display() {
    pushMatrix();
    translate (width/2, height/2);
    scale(0.3);
    rotate (gira);
    stroke(1);
    strokeWeight(0.7);
    fill (color1, color2);
    beginShape();
    vertex(0+xpos, 0+ypos);
    vertex(8+xpos, 20+ypos);
    vertex(200+xpos, 0+ypos); //si le pongo 200 en X queda interesante
    endShape(CLOSE);
    popMatrix();
  }
}


triang a, b;
//import processing.pdf.*; 

void setup () {
  size (500, 700);
  //beginRecord(PDF, "sketch_1.pdf");
  background (255);//triang (float x, float y, , float speed, color1, opacidad) 

  a = new triang (250, 350, 0.9, 255, 110);
  b = new triang (50, 50, 0.3, 255, 110);
}

void draw () {

  a.update();
  a.display();

  b.update();
  b.display();

//NO ME FUNCIONA
  if (mousePressed); 
  {   
    if (mouseButton==RIGHT) {
      a.speed++;
      b.speed++;
    }

    if (mouseButton==LEFT) { //NO ME FUNCIONA! =(

      strokeWeight(random(1,2));
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
  stroke(0, 174, 239, 120);
  line(150, 300, 150, 400);
   //linea roja
  translate(x++, y++);
  rotate(girar);
  strokeWeight(0.5);
  stroke(255, 0, 0, 120);
  line(250, 300, 250, 400);
  //linea gris
  translate(x++, y++);
  rotate(girar1);
  strokeWeight(0.5);
  stroke(200, 110);
  line(250, 200, 250, 500);
  //linea azul 
  translate(x++, y++);
  rotate (girar2);
  strokeWeight (0.2);
  stroke(0, 0, 255, 120);
  line(250, 300, 250, 400);
  popMatrix();
  
    {
 float angle = 0.0;
 float opacity = random(10,60);
 float diam = random(0, 900);
 float valorSeno = sin(angle);
 float r = map(valorSeno, -1, 1, 0,255);
 float g = map(valorSeno, -1, 1, 0,0);
 float b = map(valorSeno, -1, 1, 0,0);
 float speed = random (0.005, 0.05);

 //circulos loco
 noFill();
 stroke(r,g,b,opacity);
 strokeWeight(random(0.2,0.4));
 ellipse(250,350, diam, diam);
  }
  
  
  //circulo 2 azul
     {
 float angle = 0.0;
 float opacity = random(10,60);
 float diam = random(200, 900);
 float valorSeno = sin(angle);
 float r = map(valorSeno, -1, 1, 0,0);
 float g = map(valorSeno, -1, 1, 0,0);
 float b = map(valorSeno, -1, 1, 0,255);
 float speed = random (0.005, 0.05);

 //circulos loco azul
 noFill();
 stroke(r,g,b,opacity);
 strokeWeight(random(0.2,0.4));
 ellipse(250,350, diam, diam);
  }  

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

//void keyPressed() {
  //if (key == 'q') {
    //endRecord();
    //exit();
  //}
//}

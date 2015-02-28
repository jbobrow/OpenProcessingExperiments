
/* @pjs preload="quarto.jpg, coz.jpg, ban.jpg, q2.jpg, varr.jpg, sala.jpg, corr.jpg"; 
*/

PFont fonte;
PImage quarto;
PImage coz;
PImage ban;
PImage q2;
PImage varr;
PImage sala;
PImage corr;

void setup() {
  size(600, 600);
  background(255);
  fonte = createFont("bola", 14);
  textFont(fonte);
  quarto = loadImage("quarto.jpg");
  coz = loadImage("coz.jpg");
  ban = loadImage("ban.jpg");
  q2 = loadImage("q2.jpg");
  varr = loadImage("var.jpg");
  sala = loadImage("sala.jpg");
  corr = loadImage("corr.jpg");
}


void draw() {
  background(255);
  for (int i=100; i<500; i+=7) { //gramado
    for (int j=40; j<640; j+=7) {
      stroke(0);
      stroke(#57AF8B);
      strokeWeight(2);
      stroke(#1E6246);
      point(i, j);
      point(i+3, j+3);
    }
  }

  strokeWeight(5);
  stroke(0);
  fill(255);
  rect(120, 60, 360, 480); //base da planta
  for (int v= 300; v < 480; v+=20) {
    for (int var1 = 460; var1 < 540; var1+=20) { //desenha os ladrilhos da varanda
      strokeWeight(1);
      stroke(0);
      rect(v, var1, 20, 20);
    }
  }
  strokeWeight(5);  
  line(300, 60, 300, 285);
  line(300, 400, 300, 540);   //paredes
  line(120, 285, 230, 285);
  line(120, 400, 230, 400);
  line(300, 460, 480, 460);
  line(400, 260, 480, 260);
  line(220, 285, 220, 400);
  line(290, 285, 300, 285);
  line(290, 400, 300, 400);


  strokeWeight(4);
  stroke(255);
  line(120, 150, 120, 230); //janelas
  line(120, 315, 120, 340);
  line(170, 540, 250, 540);
  line(395, 60, 475, 60);
  line(380, 460, 460, 460);


  strokeWeight(5);
  line(310, 60, 360, 60); //porta_cozinha
  line(310, 460, 360, 460); //porta_varanda
  line(220, 295, 220, 345); //porta_banho

  fill(0);
  text("Quarto", 140, 120); //nomeia cada cômodo
  text("Cozinha", 320, 120);
  text("Banho", 140, 320);
  text("Quarto", 140, 460);
  text("Estar", 320, 350);
  text("Varanda", 320, 480); 


  if (mouseX>=120 && mouseX <=300 && mouseY >=60 && mouseY <=285) { //quando o mouse estiver sobre quarto

    image(quarto, 120, 60, 180, 225);
  }

  if (mouseX >305 && mouseX <=480 && mouseY >=60 && mouseY <=260) { // mouse sobre cozinha

    image(coz, 302, 62, 175, 195);
  }
  if (mouseX >=120 && mouseX <=290 && mouseY >285 && mouseY<=400) { //mouse sobre banheiro

    image(ban, 120, 285, 105, 115);
  }
  if (mouseX >=120 && mouseX <=300 && mouseY >=400 && mouseY <=540) { //mouse sobre quarto_2

    image(q2, 120, 400, 180, 140);
  }
  if (mouseX >300 && mouseX <=480 && mouseY >=460 && mouseY <=540) { //mouse sobre varanda

    image(varr, 300, 460, 180, 85);
  }
  if (mouseX >300 && mouseX <=480 && mouseY >=260 && mouseY<=460) { //mouse sobre varanda
    fill(155);

    image( sala, 300, 260, 185, 200);
    image( corr, 220, 290, 80, 110);
  }
  textAlign(RIGHT);
  fill(0);
  text("Nathana Czornei 2S2012", width-10, height-10);
}




PImage hangover, catrar, run, nass, walkaway, walkaway2;
boolean graustufen = false;
boolean weich;
boolean rotieren = false;
boolean move = false;

int xnass = 0; // x-Koordinate der nassen Katze
float pos1 = 0;
float pos2 = 300;
float pos3 = 200;
float dramatic = 15;
float xhang = 0;
float xrar = 200;
float yrar = 0;
float breitrar = 300;
float hochrar = 300;
float rad;

void setup(){
  size(500,600);
  background(255);
  
  hangover = loadImage("katze1.jpg");
  catrar = loadImage("katze2.jpg");
  run = loadImage("katze3.jpg");
  nass = loadImage("katze4.jpg");
  walkaway = loadImage("katze5.jpg");
  walkaway2 = loadImage("katze5.jpg");
  walkaway2.filter(BLUR, 20);
}

void draw(){
  image(hangover, xhang, pos2, 300,300);
  image(catrar, xrar, yrar, breitrar, hochrar);
  image(run, pos1, pos1, 200, 300);

  // erstes bild grau machen
  if(graustufen){
    run.filter(GRAY);
    run.filter(POSTERIZE, dramatic);
  }
   
  // viertes bild weichzeichnen
  if(weich){
    image(walkaway2, pos2, pos2, 200, 300);
  } else {
    image(walkaway, pos2, pos2, 200, 300);
  }
   
  // drittes bild verschieben und pixelspur hinterlassen
  if(mouseX < 300 && mouseY > 300){
    if (mousePressed){
      move = true;
    }
  }
  
  if(move) {
    xhang--;
  }
}

public void mouseClicked(){
  //setzt graustufen mit jedem klick gröber
  if(mouseX < 200 && mouseY < 300){
    graustufen = true;
    dramatic--;
  }
  // dramatic nie kleiner als 2
  if(dramatic == 2){
    dramatic++;
  }
  // bei erstem klick weichgezeichnet, beim zweietn wieder normal
  if(mouseX > 300 && mouseY > 300){
    weich = !weich;
  }
}

public void mouseDragged(){
  // lässt zweites bild im uhrzeiger drehen
  if(mouseX > 200 && mouseY < 300){
    xrar = xrar + sin(1);
    rad++;
    breitrar--;
    hochrar--;
  }
}
  


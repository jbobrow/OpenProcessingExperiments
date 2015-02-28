
float vel;
float velx;
float posY;
float posX;
float tamanio;
float easy;
float fade;
float rand;
boolean drag;
boolean tut;
boolean hit;

void setup() {
  tut=true;
  fade = 25;
  easy = 1.03;
  size(691,400);
  //size(int(displayWidth/1.25), int(displayHeight/1.25));
  velx = random(-20, 20);
  vel = random(-10, 10);
  posY = random(50, height-50);
  posX= random(50, width-50);
  tamanio=90;
  background(0);
  noStroke();
  drag = false;
hit=false;
}

void mouseDragged() {
  fill(255);
  posY=mouseY;
  posX=mouseX;
  vel = 0;
  velx = 0;
  drag = true;
}

void mouseReleased() {
  vel = mouseY - pmouseY; 
  velx = mouseX - pmouseX;
  drag = false;
  tut = false;
}

void draw() {
  colorMode(RGB);
  fill(0, fade);
  rect(0, 0, width, height);
  
  fill(255);
  if (drag==true && tut == true) {
    text("tira la bola yico", mouseX+70, mouseY);
  }

  if (drag==false && tut == true) {
    text("clickea y draguea", mouseX+70, mouseY);
  }

  colorMode(HSB);
  
  fill(map(posY, 0, height, 100, 255), 100, map(posX, 0, width, 100, 255));  
  ellipse(posX, posY, tamanio-velx/2, int(tamanio-vel/1.5));

  posX = posX + velx;
  posY = posY + vel;


  if (velx > 0) {
    velx = velx / easy;
  }

  if (vel > 0 ) {
    vel = vel * easy;
  }
  else {
    vel = vel / easy;
  }

  if (posX > width-tamanio/2) {
    velx = velx * -1;
    hit=true;
  }
  if ((posX - tamanio/2 < 0)) {
    velx = velx * -1;
    hit=true;
  }

  if (posY + tamanio/2 > height) {
    vel = vel * -1;
    hit=true;
  }
  if ((posY - tamanio/2 < 0)) {
    vel =2; //techo
    hit=true;
  }
  
  if (hit ==true) {
    
    fill(map(posY, 0, height, 100, 255), 100, random(30,80));  
    rect(0, 0, width, height);
    stroke(255);
    noFill();
    ellipse(posX, posY, 2*(tamanio-vel), 2*(tamanio+velx));
    noStroke();

    rand = random(0, 25);

    if (int(rand)==1) {
      fill(255);
      text("wow", posX+80, posY);
    }
    if (int(rand)==2) {
      fill(255);
      text("rico..", posX+80, posY);
    }
    if (int(rand)==3) {
      fill(255);
      text("mmm", posX+80, posY);
    }
    if (int(rand)==4) {
      fill(255);
      text("boing!", posX+80, posY);
    }
    //fill(255);text(rand, posX+80, posY);

    hit=false;
  }

  if (drag == false) {
    vel = vel + easy/100;
  } // gravedad
}

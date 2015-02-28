
float vx, vy;
float bolaX, bolaY;
float barraY;
float largoBarra, anchoBarra;
float diametro;
//float v;

void setup(){
  size(600, 400);
  anchoBarra = 30;
  largoBarra = 85;
  background(0);
  rectMode(CENTER);
  noStroke();
  rect(anchoBarra/2, largoBarra/2, anchoBarra, largoBarra);
  diametro = 50;
  bolaX = width/2;
  bolaY = height/2;
  //v = 5;
  vx = 5;
  vy = 1;
  ellipse(bolaX, bolaY, 50, 50);
}

void draw(){
  if (keyPressed){
    if (key == 'w'){
      barraY = constrain(barraY - 5, largoBarra/2, height + largoBarra/2);
    }
    if (key == 's'){
      barraY = constrain(barraY + 5, largoBarra/2, height - largoBarra/2);
    }
  }
  background(0);
  rect(anchoBarra/2, constrain(barraY, largoBarra/2, height - largoBarra/2), anchoBarra, largoBarra);
  
  bolaX += vx;
  bolaY += vy;
  if ( bolaX + diametro/2 >= width ){
    vx = -vx;
  }
  if ( (bolaY + diametro/2 >= height) || (bolaY - diametro/2 <= 0) ){
    vy = -vy;
  }
  if ( (bolaX - diametro/2 <= anchoBarra) && (bolaY <= barraY + largoBarra/2) && (bolaY >= barraY - largoBarra/2) ){
   vx = -vx;
  }
  if ( (bolaX - diametro/2 <= anchoBarra) && ( (bolaY > barraY + largoBarra/2) || (bolaY < barraY - largoBarra/2) ) ){
    bolaX = width/2;
    bolaY = height/2;
  }
  smooth();
  ellipse(bolaX, bolaY, diametro, diametro);
}


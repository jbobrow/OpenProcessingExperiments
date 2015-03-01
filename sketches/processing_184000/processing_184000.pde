
//variables i matrius
int sz;
int astres = 30;
float colorLluna = 170;
float [] posicioX = new float [astres];
float [] posicioY = new float [astres];
float [] velocitatX = new float [astres];
float [] velocitatY = new float [astres];
float [] colorSol = {250,100,30};


void setup() {
  size(800, 500);
 
 //inici
 for (int i =0; i<astres; i++) {
    posicioX[i] = width/2;
    posicioY[i] = height/2;
    velocitatX[i] = random (1,5);
    velocitatY[i] = random (1,5);
    sz = 120;
 }
}


void draw() {
  noStroke();
  
  //fons dia
  fill(230,240,250);
  rect(0,0,width/2,height);
    //núvols dia
    fill(255);
    ellipse(width/3,height/1.75,sz+50,sz-20);
    ellipse(width/4.5,height/1.75,sz+50,sz-20);
    ellipse(width/5,height/5,sz+10,sz/2);
    ellipse(width/9.5,height/5,sz+10,sz/2);
  
 //fons nit
  fill(5,15,90);
  rect(width/2,0,width/2,height);
    //estrelles nit
    fill(255,245,175);
    ellipse(width/1.5,height/4,sz/7,sz/7);
    ellipse(width/1.8,height/2,sz/9,sz/9);
    ellipse(width/1.2,height/7,sz/6,sz/6);
    ellipse(width/1.90,height/6,sz/11,sz/11);
    ellipse(width*0.9,height*0.8,sz/5,sz/5);
    ellipse(width*0.7,height*0.9,sz/10,sz/10);
    ellipse(width*0.6,height*0.65,sz/8,sz/8);
    ellipse(width/1.25,height*0.5,sz/12,sz/12);
   noFill();

  //moviment
  for (int i=0; i<astres;i++) {
    posicioX[i] +=  velocitatX[i];
    posicioY[i] += velocitatY[i];
  
  //rebot
  if (posicioX[i] < 0 + sz/2 || posicioX[i] > width - sz/2) {
    velocitatX[i] = -velocitatX[i];
  }
  if (posicioY[i] < 0 + sz/2 || posicioY[i] > height - sz/2) {
    velocitatY[i] = -velocitatY[i];
  }

  //canvi sol
  if(posicioX[i] < width/2){ 
    fill(colorSol[0],colorSol[1],colorSol[2]);
    stroke(colorSol[0],colorSol[1],colorSol[2]);
    strokeWeight(3);
    line(posicioX[i]+sz,posicioY[i],posicioX[i]-sz,posicioY[i]);
    line(posicioX[i],posicioY[i]+sz,posicioX[i],posicioY[i]-sz);
    line(posicioX[i]-sz/2,posicioY[i]-sz/2,posicioX[i]+sz/2,posicioY[i]+sz/2);
    line(posicioX[i]+sz/2,posicioY[i]-sz/2,posicioX[i]-sz/2,posicioY[i]+sz/2);

  //canvi lluna
  } else {
   fill(colorLluna);
    noStroke();
  }
  
  //astre
  ellipse(posicioX[i], posicioY[i], sz/1.15, sz/1.15);
  
  //cràters
  if(posicioX[i] > width/2){
    fill(100);
      ellipse(posicioX[i]-20,posicioY[i]-20,sz/4,sz/4);
    ellipse(posicioX[i]+5,posicioY[i]+10,sz/6,sz/7);
  }
}
}


void mousePressed (){
  colorLluna = random (100,200);
  colorSol[1] = random (100,150);
  colorSol[2] = random (0,100);
   
}


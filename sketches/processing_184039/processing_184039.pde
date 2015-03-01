
//variables + matrius
float sz = 30;
int round = 40;
float Color = 255;
float [] posicioX = new float [round];
float [] posicioY = new float [round];
float [] velocitatX = new float [round];
float [] velocitatY = new float [round];
PImage foto;




void setup(){

size(900,600);
foto = loadImage("StarWars.png");


 //inici
 for (int i =0; i<round; i++) {
    posicioX[i] = width/2;
    posicioY[i] = height/2;
    velocitatX[i] = random (1,8);
    velocitatY[i] = random (1,8);

 }
}

void draw(){
  
  background(0);
  image(foto, 0, 0, width, height);

  
  for (int i =0; i<round; i++) {
    posicioX[i] += velocitatX[i];
    posicioY[i] += velocitatY[i];
 
  
//boleta
stroke(0);
strokeWeight(1);
ellipse(posicioX[i], posicioY[i], sz, sz);
ellipse(posicioX[i], posicioY[i], sz/1.2, sz/1.2);
ellipse(posicioX[i], posicioY[i], sz/2, sz/2);
ellipse(posicioX[i], posicioY[i], sz/3, sz/3);
noStroke();

//linies

stroke(random(255), random(255), random(255));
strokeWeight(8);
line(posicioX[i]+sz/2, posicioY[i], posicioX[i]+sz/2+sz/4, posicioY[i]);
line(posicioX[i]-sz/2, posicioY[i], posicioX[i]-sz/2-sz/4, posicioY[i]);

strokeWeight(12);
line(posicioX[i]+sz/2+sz/4, posicioY[i]+sz, posicioX[i]+sz/2+sz/4, posicioY[i]-sz);
line(posicioX[i]-sz/2-sz/4, posicioY[i]+sz, posicioX[i]-sz/2-sz/4, posicioY[i]-sz);
noStroke();


//rebot
    if (posicioX [i]>=width||posicioX[i]<=0) {
      velocitatX[i]=-velocitatX[i];
    }
    if (posicioY[i]>=height || posicioY[i]<=0) {
      velocitatY[i]=-velocitatY[i];
    }
 
    if (posicioX[i]+sz/2>width||posicioX[i]-sz/2<=0) {
      velocitatX[i]=-velocitatX[i];
    }
 
    if (posicioY[i]+sz/2>height||posicioY[i]-sz/2<=0) {
      velocitatY[i]=-velocitatY[i];
  }
}
}

void mousePressed(){
  
  fill(random(255), random(255), random(255));
  sz = random(100);
   
}




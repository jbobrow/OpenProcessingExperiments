
float xaigua = 0;
float yaigua = 500;
float maigua = 150;
 
//control nube
float xnube = 50;
float ynube = 45;
float mnube = 50;
 
//control del pollito

int total= 50;
float [] pollox = new float [total];
float [] polloy = new float [total];
float [] velocitatx = new float [total];
float [] velocitaty = new float [total];
 float mpollo = 40;
 
int bones=0;
int dolentes=0;
 
void setup() {
  size (800, 500);
  
  //condicio
  for (int i =0; i<total; i++) {
    pollox[i] =  width/2;
    polloy[i] =  height/2;
    velocitatx[i] = random (2, 4);  
    velocitaty[i] = random (2, 4);
  }
  
  
}
 
void draw() {
  float xarbre = mouseX;
  float yarbre = 400;
  float mida = 200;
  fill(5);
 
  background (102, 213, 234);
 
 // 1000 crack!!!
 if(bones>=100){
      fill(random(255),random(255),random(255));
      textSize (100);
      text ("¡Edgar tramposo!", 60,height/2);
    }
  //tronc
 
  fill(155, 116, 78);
  noStroke();
  rect(xarbre, yarbre, mida, mida/4);
  ellipse(xarbre, yarbre+25, mida/4, mida/4);
  ellipse(xarbre, yarbre+25, mida/4, mida/4);
  ellipse(xarbre+mida, yarbre+25, mida/4, mida/4);
  rect (xarbre+mida-30, yarbre-20, mida-190, mida-170);
  ellipse(xarbre+mida-25, yarbre-16, mida/20, mida/20);
 
  stroke(134, 105, 77);
  strokeWeight(2);
  line(xarbre+30, yarbre+10, xarbre+150, yarbre+10);
  line(xarbre-10, yarbre+40, xarbre+90, yarbre+40);
  line(xarbre-5, yarbre+30, xarbre+180, yarbre+30);
 
  // onades
 
  fill(77, 113, 134);
  noStroke();
 
  ellipse(xaigua, yaigua, maigua, maigua);
  ellipse(xaigua+100, yaigua, maigua, maigua);
  ellipse(xaigua+200, yaigua, maigua, maigua);
  ellipse(xaigua+300, yaigua, maigua, maigua);
  ellipse(xaigua+400, yaigua, maigua, maigua);
  ellipse(xaigua+500, yaigua, maigua, maigua);
  ellipse(xaigua+600, yaigua, maigua, maigua);
  ellipse(xaigua+700, yaigua, maigua, maigua);
  ellipse(xaigua+800, yaigua, maigua, maigua);
 
  //nube
  fill(255);
  ellipse(xnube, ynube, mnube, mnube);
  ellipse(xnube*2, ynube, mnube*2, mnube);
  ellipse(xnube*3, ynube, mnube*2, mnube);
 
  ellipse(xnube*10, ynube*5, mnube+10, mnube+10);
 
  ellipse(xnube*10+mnube-5, ynube*5, mnube+10, mnube+10);
  ellipse(xnube*10+mnube*2-10, ynube*5, mnube+10, mnube+10);
 
  //dibuix pollito aka pilota + actualitzacio condicio
  
  for (int i =0; i<total; i++) {
    pollox[i] += velocitatx[i];
    polloy[i] += velocitaty[i];
 
  fill(255, 251, 139);
 
  //pollox = pollox + velocitatx;
  ellipse(pollox[i], polloy[i], mpollo, mpollo+15);
  ellipse(pollox[i], polloy[i]+25, mpollo+15, mpollo+15);
  fill(255, 34, 56);
  triangle(pollox[i]-5, polloy[i], pollox[i]+5, polloy[i], pollox[i], polloy[i]+5);
  fill(255);
  ellipse(pollox[i]-6, polloy[i]-10, mpollo/4, mpollo/4);
  ellipse(pollox[i]+6, polloy[i]-10, mpollo/4, mpollo/4);
  fill(5);
  ellipse(pollox[i]-6, polloy[i]-10, mpollo/8, mpollo/8);
  ellipse(pollox[i]+6, polloy[i]-10, mpollo/8, mpollo/8);
 
 
  //movimiento pelota
 
  pollox[i]= pollox[i] + velocitatx[i];
   polloy[i]= polloy[i]+ velocitaty[i];
 
 //condicions pel rebot
 
 
  if (polloy[i]-20<=0) {
    velocitaty[i]=-velocitaty[i];
  }
 
  if (pollox[i]>=width-20) {
    velocitatx[i]= -velocitatx[i];
  }
 
  if (pollox[i]-20 <=0) {
    velocitatx[i]=-velocitatx[i];
  }
 
  // que rebote en el tronco
 
 if (pollox[i] >= mouseX-mida && pollox[i] <= mouseX+mida&& polloy[i] >= yarbre-9-mpollo && polloy[i] <= yarbre+9-mpollo) {
 
    velocitaty[i] = -velocitaty[i];
  
  //recompte bones  
    float disty= polloy[i];
    if (disty <=height) bones=bones +1;
    
    
    
    
    
  }
  
  if (mousePressed) {
    pollox[i] = mouseX;
    polloy[i] = mouseY;
    bones=0;
  
}
 
}
fill(5);
textSize(30);
text ("Pollitos Salvados: "+ bones,460,50);

}


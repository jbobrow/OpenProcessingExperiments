
//Josep Rimbau. Grup 3. Informatica-practica 4
//establim parametres
int homers = 40;
int i; 
int z=150;
//establim matrius per posicions en X en Y i les seves velocitats
float[] posicionsX = new float[homers];

float[] posicionsY = new float[homers];

float[] velocitatsX = new float[homers];

float[] velocitatsY = new float[homers];
//definim els colors dels ulls aleatoriament
color[]colorulls=new color [homers];

void setup(){
  size(600,600);
//definim posicions i velocitats
  for(int i = 0; i<homers; i++){
    posicionsX[i] = random(width/2, height/2);
    posicionsY[i] = random(width/2, height/2);
    velocitatsX[i] = random(1,3);
    velocitatsY[i] = random(1,3);
    colorulls[i] = color(random(255), random(255), random(255));
  }
    
}
 
void draw(){
  background(255,250,255);
  fill(245,207,15);
  // creem un bucle per a les seves accions
  for(int i = 0; i<homers; i++){
    posicionsX[i] += random(-5,5);
    posicionsY[i] += random(-5,5);
    //creem limits en X
    if((posicionsX[i]<0)||(posicionsX[i]>width)){
      velocitatsX[i] = -velocitatsX[i];
    }
    //Creem lmits en Y
    if((posicionsY[i]<0)||(posicionsY[i]>height)){
      velocitatsY[i] = -velocitatsY[i];
    }

//dibuixem el nostre personatge
  //orellas
strokeWeight(1);
stroke(0,0,0);
fill(245,207,15);
  ellipse(posicionsX[i]+z/6,posicionsY[i]+z/60,z/12,z/10);
  ellipse(posicionsX[i]-z/6,posicionsY[i]+z/60,z/12,z/10);
    //ORELLASINTERIOR
     
 strokeWeight(2);
  ellipse(posicionsX[i]-z/6,posicionsY[i]+z/60,z/24,z/20);
  ellipse(posicionsX[i]+z/6,posicionsY[i]+z/60,z/24,z/20);
  
  //CABELLS
  fill(250,250,250);
  stroke(110,110,110);
  ellipse(posicionsX[i],posicionsY[i]-z/4,z/8,z/10);
  ellipse(posicionsX[i],posicionsY[i]-z/4,z/12,z/14);
  strokeWeight(1);
   
  //CARA
  stroke(0,0,0);
  fill(245,207,15);
  rectMode(CENTER);
  rect(posicionsX[i],posicionsY[i],z/3,z/2,z/2);
  // si fem click el nas es posa vermell
  if(mousePressed){
  fill(255,21,21);
}
  //NAS
  ellipse(posicionsX[i],posicionsY[i],z/25,z/25);
  //ULLS
  fill(colorulls[i]);
  ellipse(posicionsX[i]+z/15,posicionsY[i]-z/12,z/8,z/8);
  ellipse(posicionsX[i]-z/15,posicionsY[i]-z/12,z/8,z/8);
  fill(0,0,0);
  ellipse(posicionsX[i]+z/15,posicionsY[i]-z/12,z/30,z/30);
  ellipse(posicionsX[i]-z/15,posicionsY[i]-z/12,z/30,z/30);
  fill(250,250,250);
  ellipse(posicionsX[i]+z/13.5,posicionsY[i]-z/12,z/80,z/80);
  ellipse(posicionsX[i]-z/17,posicionsY[i]-z/12,z/80,z/80);
  //BOCA
  fill(180,120,40);
  ellipse(posicionsX[i],posicionsY[i]+z/7.5,z/4,z/5);
   fill(0,0,0);
  ellipse(posicionsX[i],posicionsY[i]+z/7.5,z/16,z/16);
strokeWeight(2);
stroke(110,110,110);
 //cabells lateral esquerra
 line(posicionsX[i]-z/6,posicionsY[i]-z/10,posicionsX[i]-(z/60)*9,posicionsY[i]-z/30);
  line(posicionsX[i]-(z/60)*9,posicionsY[i]-z/30,posicionsX[i]-z/7.5,posicionsY[i]-z/10);
  line(posicionsX[i]-z/6,posicionsY[i]-z/10,posicionsX[i]-(z/60)*11,posicionsY[i]-z/30);
  line(posicionsX[i]-(z/60)*11,posicionsY[i]-z/10,posicionsX[i]-(z/60)*11,posicionsY[i]-z/30);
   //cabells lateral dreta
  line(posicionsX[i]+z/6,posicionsY[i]-z/10,posicionsX[i]+(z/60)*9,posicionsY[i]-z/30);
  line(posicionsX[i]+(z/60)*9,posicionsY[i]-z/30,posicionsX[i]+z/7.5,posicionsY[i]-z/10);
  line(posicionsX[i]+z/6,posicionsY[i]-z/10,posicionsX[i]+(z/60)*11,posicionsY[i]-z/30);
  line(posicionsX[i]+(z/60)*11,posicionsY[i]-z/10,posicionsX[i]+(z/60)*11,posicionsY[i]-z/30);


  }
  
}

void mousePressed(){
// Quan fem click apereixen 20 homers
homers = 20;
}










int n = 100;
Bal[] balArray = new Bal[n];
float[] middelX = new float[n];
float[] middelY = new float[n];
float afstand;
float dichtbijst = 600;
float dichtX, dichtY;

void setup() {
 size(800,800);
 smooth();
 //strokeWeight(3);
 frameRate(50);
 
  for(int i = 0; i < n; i++){
     Kleur kleur = getKleur();
     float speedX = random(-6, 6);
     float speedY = random(-6, 6); 
     float grootte = random(3, 25); 
     float strook = random(0.1,3);
   
     
     balArray[i] = new Bal(kleur, speedX, speedY, grootte, strook);
   }

}


void draw() {
  background(255,255,255);

    for(int i = 0; i < n; i++){
      balArray[i].update();
      balArray[i].display();
      
      middelX[i] = balArray[i].posXBal; //array met middelpunten wordt geinitialiseerd. 
      middelY[i] = balArray[i].posYBal;
      
      
      
        if(balArray[i].cBal.a <= 0) {  //zodra de bal niet meer zichtbaar is, initialiseer je een nieuwe bal.
           
           balArray[i].cBal = getKleur();
           balArray[i].speedXBal = random(-6, 6);
           balArray[i].speedYBal = random(-6, 6); 
           balArray[i].grootteBal = random(1, 15); 
           balArray[i].posXBal = mouseX;
           balArray[i].posYBal = mouseY;
      }
    }
    

    
//    for(int i = 0; i < n; i++){
//      for(int j = 1; j < n-1; j++){
//        if(middelX[i] == middelX[j] && middelY[i] == middelX[i]) {
//          println("zichzelf");
//          break;
//        }
//        afstand = dist(middelX[i], middelY[i], middelX[j], middelY[j]);
//        
////        println("Xi = " + middelX[i]);
////        println("Yi = " + middelY[i]);
////        println("Xj = " + middelX[j]);
////        println("Yj = " + middelY[j]);
//        //println("dist " + afstand);
//        
//        if(afstand <= dichtbijst){
//          dichtbijst = afstand; //als de afstand kleiner is dan de grootste, wordt dat de nieuwe dichtbijst
//          dichtX = middelX[j]; // bewaar de x&y waardes van die afstand
//          dichtY = middelY[j];
//        }
//        afstand = 0;
//      }
//      line(middelX[i], middelY[i], dichtX, dichtY);
////        println("Xi = " + middelX[i]);
////        println("Yi = " + middelY[i]);
////        println("dichtX = " + dichtX);
////        println("dichtY = " + dichtY);
//        
//    }
  
}

class Bal{
  Kleur cBal;
  float posXBal;
  float posYBal;
  float speedXBal;
  float speedYBal;
  float grootteBal;
  float strookBal;

  //constructor
  Bal(Kleur c, float speedX, float speedY, float grootte, float strook) {
   cBal = c; 
   posXBal = mouseX;
   posYBal = mouseY; 
   speedXBal = speedX;
   speedYBal = speedY;
   grootteBal = grootte;
   strookBal = strook;
  }
  
  
  void update() {
    
    posXBal += speedXBal;
    posYBal += speedYBal;
    grootteBal+=0.4;
    if(cBal.a > 0) cBal.a -= 0.15;
    
    
  }
  
  void display() {
    float x = posXBal;
    float y = posYBal;
    
    pushStyle();
      noStroke();
      fill(cBal.getColor());
      ellipse(x, y, grootteBal, grootteBal);
    popStyle();  
            
    pushStyle();
      strokeWeight(strookBal);
      stroke(cBal.getEffen());
      fill(0,0,0,0); //doorschijnend want de alpha waarde = 0
      ellipse(x, y, grootteBal, grootteBal);
    popStyle();
  }
}

class Kleur{
 int r;
 int g;
 int b;
 int a = int(random(0,250));


 color getColor(){
  return color(r,g,b,a);
 }
 
 color getEffen(){ //pak de kleur maar dan zonder de alpha waarde
   return color(r,g,b);
 }
}

Kleur getKleur(){ //initialiseerd de verschillende kleuren
  Kleur k = new Kleur();
  
  switch(int(random(0,4))){
   case 0:
      k.r = 40;
      k.g = 37;
      k.b = 185;
      break;
    case 1:
      k.r = 185;
      k.g = 37;
      k.b = 107;
      break; 
    case 2:
      k.r = 37;
      k.g = 162;
      k.b = 185;
      break;
    case 3:
      k.r = 37;
      k.g = 185;
      k.b = 145;
      break;
    case 4:
      k.r = 131;
      k.g = 185;
      k.b = 37;
      break;
     
  }
  return k;
}



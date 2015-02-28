
//////////////////////////////
/////Anne Murray-Potvin///////
//////MURA25579203////////////
//////////////////////////////
float x;
float y;
int etat;
float diametre;
float radians ;
float tempsE;
float timeStamp;
float courant;
float cible;
float vitesseCouleur;
float counter = 0;
float[] poisX = {x-35,x+35,x,x-50,x-20,x+20,x+50,x-35,x+35,x,x-70,x+70,x-50,
                 x-20,x+50,x+20,x-70,x+70,x-35,x+35,x-50,x+50,x-70,x+7,x-35,
                 x+35,x-70,x+70,x-35,x+35,x-70,x+70,x-35,x+35,x+50,x-50,x-20,
                 x+20,x,x-75,x-57,x-35,x-15,x+5,x+24,x+43,x+65,x+60};
          
float[] poisY = {y-100,y-100,y-100,y-80,y-80,y-80,y-80,y-60,y-60,y-60,y-60,
                 y-60,y-40,y-117,y-40,7-117,y-20,y-20,y-20,y-20,y-20,y,y,y+20
                 ,y+20,y+20,y+20,y+60,y+60,y+60,y+60,y+60,y+60,y+60,y+60,y+40,
                 y+40,y+40,y+50,y+80,y+80,y+85,y+80,y+80,y+90,y+85,y+90,y+40};
                 
float[] poisR = {10,10,20,10,5,10,10,10,20,20,10,10,10,10,10,15,10,10,5,10,
                 15,10,10,20,10,15,10,10,5,10,10,10,20,10,5,10,10,15,10,
                 10,10,10,10,15,10,5,10,20};

void setup() {
        size(400,400);
        frameRate(30); 
        smooth(); 
        x = width/2;
        y= height/2;
        diametre = 30;
        etat =0;
        courant=0;
        cible=0; 
        vitesseCouleur=6;
              
}
 
void draw() {
background(10,194,242); 
pushMatrix();
translate (x,y);
popMatrix();

        
////PERSONNAGE//// 
fill(255,courant,214);
noStroke();
ellipse(x,y+55,150,50);
ellipse(x,y-50,150,150);
rectMode(CENTER);
rect(x,y+5,150,100);

////BANDEAU////
if (etat == 1 ){
      fill(random(0,255),random(0,255),random(0,255));
      }else{
      fill(255,courant,214); 
      
    }
    rect(width/2,(height/2)-45,150,35);


////TENTACULE////
        
//1e tentacule 
pushMatrix();
translate(x-75,y+80);
rotate(60);
fill(255,courant,214);
ellipse(0,0,20,90);
popMatrix();

//2e tentacule      
pushMatrix();
translate(x-57,y+85);
rotate(60);
fill(255,courant,214);
ellipse(0,0,20,90);
popMatrix();

//3e tentacule       
pushMatrix();
translate(x-35,y+80);
rotate(60);
fill(255,courant,214);
ellipse(0,0,20,90);
popMatrix();

//4e tentacule      
pushMatrix();
translate(x-15,y+80);
rotate(0);
fill(255,courant,214);
ellipse(0,0,20,90);
popMatrix();

//5e tentacule       
pushMatrix();
translate(x+5,y+90);
rotate(0);
fill(255,courant,214);
ellipse(0,0,20,90);
popMatrix();

//6E Tentacule
pushMatrix();
translate(x+24,y+85);
rotate(60);
fill(255,courant,214);
ellipse(0,0,20,90);
popMatrix();

//7e tentacule
pushMatrix();
translate(x+43,y+90);
rotate(60);
fill(255,courant,214);
ellipse(0,0,20,90);
popMatrix();

//8e tentacule
pushMatrix();
translate(x+65,y+80);
rotate(330);
fill(255,courant,214);
ellipse(0,0,20,90);
popMatrix();


//////////pois///////////
pushMatrix(); 
noStroke();
translate(width*0.5,height*0.5);
  for(int i=0; i<48;i=i+1) {
  fill(random(256),random(256),random(256));
  ellipse(poisX[i],poisY[i],poisR[i],poisR[i]);
//}  
}
popMatrix();
 
////OEUIL BLANC////        
fill(255);
ellipse(x,y-50,75,75);


////OEUIL BLEU////
if(mousePressed){
  fill(random(0,255),random(0,255),random(0,255));
}else{
fill(8,255,224);
}
ellipse(x-3,y-50,60,60);

////OEUIL NOIR////
for ( int i = 35; i >0; i =i -1){
        fill(127*i/35);
        ellipse(x,y-50,i,i);
   }
       
////ÉTINCELLE DE YEUX////  
fill(255);
ellipse(x-10,y-60,15,15);
ellipse(x-15,y-75,10,10);

////BOUCHE////
fill(0);

arc(x,y,75,75,0,PI);

////DENTS////
fill(255);
  for(int i=-30; i<36; i= i+7) {
  float distance = dist(mouseX,mouseY,x+i,y+9);
   if (distance<diametre*0.25){
     fill(0);
   }else{ 
     fill(255);
   }
     rect(x+i,y+5,6,10);
     ellipse(x+i,y+9,5,5);
     
   
  }



////LANGUE////
fill(100,0,20);
arc(x,y+23,50,28,0,PI);
ellipse(x-13,y+24,27,15);
ellipse(x+13,y+24,27,15);

////BOULE DISCO////
for ( int i = 70; i >0; i =i -1) {
    fill(random(0, 255), random(0, 255), random(0, 255));


    float oscillation = cos(counter)*170;
    float oscillationY = sin(counter)*170;

    ellipse (width *0.5+ oscillation, height*0.5+ oscillationY, 2+i, 2+i);
    
  }
  counter = counter +0.08;
  
  
///ASSOUPLISSEMENT DE COULEUR DU PERSONNAGE///// 
tempsE=millis()-timeStamp;
  if (tempsE>=1500) {
    cible=214;
  }
  if (tempsE>=3600) {
    cible=0;
    timeStamp=millis();
  }
float distance = abs(cible - courant);
 if ( courant < cible ) {
    courant = courant +min( vitesseCouleur, distance);
  }
  else {
    courant = courant - min(vitesseCouleur, distance);
  }
  
}


/////CARRÉ DANS MONSTRES QUI ACTIVE LE BANDEAU////
void mousePressed() {
  
  boolean ouest = mouseX < width/2+75;
  boolean est = mouseX > width/2-75;
  boolean nord = mouseY > height/2-75;
  boolean sud = mouseY < height/2+75;
  
  if(ouest && est && nord && sud) {
    if ( etat == 0){
      etat = 1;
    }else{
      etat = 0;
    }
}
}

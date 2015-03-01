

int blocksize = 10;
int moviment = 0; // moviment vaixell
boolean nit = false;
int moviment2=0; // moviment finestra
boolean mati = false;
int nuvol1 = 0;
int nuvol2 = 0;
int nuvol3 = 0;

void setup(){
  size (400,400);
  background(255);
}

void draw(){
 
  frameRate(10);
  for(int y=0; y<height; y+=blocksize) { //mar escala masiva
  for(int x=0; x<width;x+=blocksize) {
    fill(0,0, random(100,255)); // aleatori pero de colors blaus
    rect(x,y,blocksize,blocksize);
  }
  }

    fill (0);
    rect (0,0,400,274);  // tapar mar escala masiva

  for (int a=0; a<height; a=a+300){ // estrelles
  for (int b=0;b<width;b=b+300){
    fill (random(255), random(200));
    ellipse(random(400), random(250), 3, 3);
  }
  }

  noStroke();
  fill(#643200); // pal de adalt
  rect(0,0,400,10); 
  fill(255); // lluna sencera
  ellipse(100,45,30,30);
  fill(0); //mitja lluna
  ellipse(109,45,30,30);

if (moviment < 400){
   fill (#800000);
   beginShape();
   vertex (10+moviment,274);
   vertex(0+moviment,258);
   vertex(70+moviment,258);
   vertex(50+moviment,274);
   vertex(10+moviment,274);
   endShape();
   fill(#964b00);
   rect (27+moviment,225,2,33);
   fill(#ff0000);
   triangle(28+moviment,225,52+moviment,233,28+moviment,242);  //bandera vaixell

   moviment = moviment +2; // moviment vaixell
}
fill(#382983);
ellipse (10,30,120,800);//cortina dreta
ellipse (390,100,120,800); //cortina esquerra

moviment2 = moviment2 +10; // moviment finestres
if (nit == true){ // tancament finestres
  fill(#382983);
  ellipse (10,30+moviment2,120+moviment2,800+moviment2);//cortina dreta
  ellipse (390,100,120+moviment2,800); //cortina esquerra
 
}else{
  nit = false;
  moviment2 =0;
}

if (mati==true){
  
    fill(255);
    rect (0,0,400,400);
    background(255);
  
  frameRate(10);
  for(int y=0; y<height; y+=blocksize) { //mar escala masiva
  for(int x=0; x<width;x+=blocksize) {
    fill(0,0, random(200,255)); // aleatori pero de colors blaus
    rect(x,y,blocksize,blocksize);
  }
  }

    fill (#00ffff);
    rect (0,0,400,274);  // tapar mar escala masiva
  
    fill(#ffff00); // sol
    ellipse(100,45,30,30);

    fill(255); // nuvol1
    ellipse( 60+nuvol1,78,20,20);
    ellipse( 60+nuvol1,80,20,20);
    ellipse( 50+nuvol1,81,20,20);
    ellipse( 65+nuvol1,79,20,20);
   
    fill(255); // nuvol2
    ellipse( 60+nuvol2,118,40,20);
    ellipse( 60+nuvol2,120,40,20);
    ellipse( 50+nuvol2,119,40,20);
    ellipse( 65+nuvol2,1229,40,20);
   
    fill(255); // nuvol3
    ellipse( 70+nuvol3,88,20,20);
    ellipse( 70+nuvol3,90,20,20);
    ellipse( 60+nuvol3,91,20,20);
    ellipse( 75+nuvol3,89,20,20);

   
     if(nuvol1 > width){
       nuvol1 = -160; 
     }else{
       nuvol1 = nuvol1 + 10; 
     }  
   
     if (nuvol2 >width){
       nuvol2 = -20;
     }else{
       nuvol2 = nuvol2 + 7;
     }
   
      if (nuvol3 >width){
       nuvol3 = -20;
     }else{
       nuvol3 = nuvol3 + 3;
     }
   
  fill(#643200); // pal de adalt
  rect(0,0,400,10);    
   
  fill(#382983);
  ellipse (10,30,120,800);//cortina dreta
  ellipse (390,100,120,800); //cortina esquerra
  
} //tancament if inicial

} // tancament void draw

void mousePressed(){
  nit = true; 
}

void mouseReleased(){
 nit = false; 
 mati = true;
}



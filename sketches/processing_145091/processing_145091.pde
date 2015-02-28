
float x;
float y;
float v = random(3);
float vy = random(3);

void setup(){
 size(500,500);
 x = random(width/2);
 y = random(height/2);
}

void draw(){
Fondo();
BMO();
Limites();
ActualizaPosicion();


}

void Fondo(){
background(255);
}

void BMO(){

//Cuerpo
fill(98,189,164);strokeWeight(2);rect(x-87.5,y-125,175,250,20);

//Ranura
fill(16,41,41);rect(x-55,y+17.5,55,8);

//Conector
fill(8,24,107);ellipse(x+45,y+21.5,8,8);

//Cruz
fill(254,237,32);strokeWeight(2);rect(x-55,y+55,20,6);rect(x-48,y+48,6,20);
noStroke();rect(x-53.5,y+56.5,18,4);

//BotonDoble
fill(8,24,107);stroke(0);strokeWeight(1);rect(x-60,y+97.5,15,4,2);rect(x-40,y+97.5,15,4,2);

//Triangulo
fill(0,222,255);strokeWeight(2);triangle(x+12.5,y+58,x+32.5,y+58,x+22.5,y+42);

//CirculoVerde
fill(0,255,57);strokeWeight(2);ellipse(x+55,y+61,15,15);

//CirculoRojo
fill(255,0,0);ellipse(x+33.75,y+85,25,25);

//PieDerecho
fill(98,172,180);rect(x-45,y+125,20,90,0,0,10,10);

//PieIzquierdo
fill(98,172,180);rect(x+25,y+125,20,90,0,0,10,10);

 if (mousePressed) {
   x = mouseX;
   y = mouseY; 
   
   //Pantalla
   fill(random(255), random(255), random(255));rect(x-67.5,y-105,135,110,15);
   noFill(); ellipse(x,y-35,20,20);
   
   float z = random(50);
   
   if (z < 25) {
      fill(0); ellipse(x-25,y-70,5,10); ellipse(x+25,y-70,5,10);
   }
   else if (z < 50) {
     line(x-30,y-70,x-20,y-70); line(x+20,y-70,x+30,y-70);
   }
 }
 else {
   //Pantalla2
   fill(222,255,238);rect(x-67.5,y-105,135,110,15);
   noFill();arc(x-25,y-70,10,10,0,PI);arc(x+25,y-70,10,10,0,PI);arc(x,y-60,50,50,+HALF_PI-QUARTER_PI,+HALF_PI+QUARTER_PI);
 }

 if (x < width/2&&y < height/2) {
   //BrazoDerecho
   fill(98,172,180);rect(x-137.5,y+58,50,20,0,0,0,20);rect(x-137.5,y-10,20,68,5,5,0,0);
   noStroke();rect(x-136,y+30,17,38);
   stroke(0);line(x-(250-112.5-20/3),y-9,x-(250-112.5-20/3),y-2);line(x-(250-112.5-40/3),y-9,x-(250-112.5-40/3),y-2);
   //BrazoIzquierdo
   fill(98,172,180);rect(x+87.5,y+58,50,20,0,20,0,0);rect(x+117.5,y+78,20,68,0,0,5,5);
   noStroke();rect(x+119,y+70,17,38);
   stroke(0);line(x+(367.5+20/3-250),y+138,x+(367.5+20/3-250),y+145);line(x+(367.5+40/3-250),y+138,x+(367.5+40/3-250),y+145);
 }
 else if (x > width/2&&y > height/2) {
   //BrazoIzquierdo
   fill(98,172,180);rect(x-137.5,y+58,50,20,0,0,0,20);rect(x-137.5,y-10,20,68,5,5,0,0);
   noStroke();rect(x-136,y+30,17,38);
   stroke(0);line(x-(250-112.5-20/3),y-9,x-(250-112.5-20/3),y-2);line(x-(250-112.5-40/3),y-9,x-(250-112.5-40/3),y-2);
   //BrazoDerecho
   fill(98,172,180);rect(x+87.5,y+58,50,20,0,20,0,0);rect(x+117.5,y+78,20,68,0,0,5,5);
   noStroke();rect(x+119,y+70,17,38);
   stroke(0);line(x+(367.5+20/3-250),y+138,x+(367.5+20/3-250),y+145);line(x+(367.5+40/3-250),y+138,x+(367.5+40/3-250),y+145);
 }
 if (x > width/2&&y < height/2) {
   //BrazoDerecho
   fill(98,172,180);rect(x+87.5,y+58,50,20,0,0,20,0);rect(x+117.5,y-10,20,68,5,5,0,0);
   noStroke();rect(x+119,y+30,17,38);
   stroke(0);line(x+(367.5+20/3-250),y-9,x+(367.5+20/3-250),y-2);line(x+(367.5+40/3-250),y-9,x+(367.5+40/3-250),y-2);
   //BrazoIzquierdo
   fill(98,172,180);rect(x-137.5,y+58,50,20,20,0,0,0);rect(x-137.5,y+78,20,68,0,0,5,5);
   noStroke();rect(x-136,y+70,17,38);
   stroke(0);line(x-(250-112.5-20/3),y+138,x-(250-112.5-20/3),y+145);line(x-(250-112.5-40/3),y+138,x-(250-112.5-40/3),y+145);
 }
 else if (x < width/2&&y > height/2) {
   //BrazoDerecho
   fill(98,172,180);rect(x+87.5,y+58,50,20,0,0,20,0);rect(x+117.5,y-10,20,68,5,5,0,0);
   noStroke();rect(x+119,y+30,17,38);
   stroke(0);line(x+(367.5+20/3-250),y-9,x+(367.5+20/3-250),y-2);line(x+(367.5+40/3-250),y-9,x+(367.5+40/3-250),y-2);
   //BrazoIzquierdo
   fill(98,172,180);rect(x-137.5,y+58,50,20,20,0,0,0);rect(x-137.5,y+78,20,68,0,0,5,5);
   noStroke();rect(x-136,y+70,17,38);
   stroke(0);line(x-(250-112.5-20/3),y+138,x-(250-112.5-20/3),y+145);line(x-(250-112.5-40/3),y+138,x-(250-112.5-40/3),y+145);
 }

x = x+v;
y = y+vy;
}

void Limites(){
  if (x+137.5 > width||x-137.5 <0) {
    v=-v;
  }
  if (y+215 > height||y-125 <0) {
    vy=-vy;
  }   
}

void ActualizaPosicion(){
  float r = random(100);

  if (r < 25) {
    //derecha
    x = x+v;
  } 
  else if (r < 50) {
    //izquierda
    x = x-v;
  } 
  else if (r<75) {
    //arriba
    y = y -v;
  } 
  else if (r<100) {
    //abajo
    y = y +v;
  }
}



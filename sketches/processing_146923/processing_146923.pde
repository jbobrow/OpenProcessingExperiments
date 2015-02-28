
int i;
int a = 3;
int b = 3;
int total = 10;

float [] x = new float[total];
float [] y = new float[total];
float [] vx = new float[total];
float [] vy = new float[total];

void setup(){
 size(500,500);

 for (int i=0; i<total; i++) {
  x[i] = width/2;
  y[i] = height/2;
  vx[i] = a;
  vy[i] = b;
 }
}

void draw(){
 
 //Fondo
  background(255); 
  
for (int i=0; i<total; i++){
 x[i] += vx[i];
 y[i] += vy[i];
}
  
 //BMO
  
  //Cuerpo
  fill(98,189,164);strokeWeight(2);rect(x[i]-87.5,y[i]-125,175,250,20);

  //Ranura
  fill(16,41,41);rect(x[i]-55,y[i]+17.5,55,8);

  //Conector
  fill(8,24,107);ellipse(x[i]+45,y[i]+21.5,8,8);

  //Cruz
  fill(254,237,32);strokeWeight(2);rect(x[i]-55,y[i]+55,20,6);rect(x[i]-48,y[i]+48,6,20);
  noStroke();rect(x[i]-53.5,y[i]+56.5,18,4);

  //BotonDoble
  fill(8,24,107);stroke(0);strokeWeight(1);rect(x[i]-60,y[i]+97.5,15,4,2);rect(x[i]-40,y[i]+97.5,15,4,2);

  //Triangulo
  fill(0,222,255);strokeWeight(2);triangle(x[i]+12.5,y[i]+58,x[i]+32.5,y[i]+58,x[i]+22.5,y[i]+42);

  //CirculoVerde
  fill(0,255,57);strokeWeight(2);ellipse(x[i]+55,y[i]+61,15,15);

  //CirculoRojo
  fill(255,0,0);ellipse(x[i]+33.75,y[i]+85,25,25);

  //PieDerecho
  fill(98,172,180);rect(x[i]-45,y[i]+125,20,90,0,0,10,10);

  //PieIzquierdo
  fill(98,172,180);rect(x[i]+25,y[i]+125,20,90,0,0,10,10);

 if (mousePressed) {
   x[i] = mouseX;
   y[i] = mouseY; 
   
   //Pantalla
   fill(random(255), random(255), random(255));rect(x[i]-67.5,y[i]-105,135,110,15);
   noFill(); ellipse(x[i],y[i]-35,20,20);
   
   float z = random(50);
   
   if (z < 25) {
      fill(0); ellipse(x[i]-25,y[i]-70,5,10); ellipse(x[i]+25,y[i]-70,5,10);
   }
   else if (z < 50) {
     line(x[i]-30,y[i]-70,x[i]-20,y[i]-70); line(x[i]+20,y[i]-70,x[i]+30,y[i]-70);
   }
 }
 else {
   //Pantalla2
   fill(222,255,238);rect(x[i]-67.5,y[i]-105,135,110,15);
   noFill();arc(x[i]-25,y[i]-70,10,10,0,PI);arc(x[i]+25,y[i]-70,10,10,0,PI);arc(x[i],y[i]-60,50,50,+HALF_PI-QUARTER_PI,+HALF_PI+QUARTER_PI);
 }

 if (x[i] < width/2&&y[i] < height/2) {
   //BrazoDerecho
   fill(98,172,180);rect(x[i]-137.5,y[i]+58,50,20,0,0,0,20);rect(x[i]-137.5,y[i]-10,20,68,5,5,0,0);
   noStroke();rect(x[i]-136,y[i]+30,17,38);
   stroke(0);line(x[i]-(250-112.5-20/3),y[i]-9,x[i]-(250-112.5-20/3),y[i]-2);line(x[i]-(250-112.5-40/3),y[i]-9,x[i]-(250-112.5-40/3),y[i]-2);
   //BrazoIzquierdo
   fill(98,172,180);rect(x[i]+87.5,y[i]+58,50,20,0,20,0,0);rect(x[i]+117.5,y[i]+78,20,68,0,0,5,5);
   noStroke();rect(x[i]+119,y[i]+70,17,38);
   stroke(0);line(x[i]+(367.5+20/3-250),y[i]+138,x[i]+(367.5+20/3-250),y[i]+145);line(x[i]+(367.5+40/3-250),y[i]+138,x[i]+(367.5+40/3-250),y[i]+145);
 }
 else if (x[i] > width/2&&y[i] > height/2) {
   //BrazoIzquierdo
   fill(98,172,180);rect(x[i]-137.5,y[i]+58,50,20,0,0,0,20);rect(x[i]-137.5,y[i]-10,20,68,5,5,0,0);
   noStroke();rect(x[i]-136,y[i]+30,17,38);
   stroke(0);line(x[i]-(250-112.5-20/3),y[i]-9,x[i]-(250-112.5-20/3),y[i]-2);line(x[i]-(250-112.5-40/3),y[i]-9,x[i]-(250-112.5-40/3),y[i]-2);
   //BrazoDerecho
   fill(98,172,180);rect(x[i]+87.5,y[i]+58,50,20,0,20,0,0);rect(x[i]+117.5,y[i]+78,20,68,0,0,5,5);
   noStroke();rect(x[i]+119,y[i]+70,17,38);
   stroke(0);line(x[i]+(367.5+20/3-250),y[i]+138,x[i]+(367.5+20/3-250),y[i]+145);line(x[i]+(367.5+40/3-250),y[i]+138,x[i]+(367.5+40/3-250),y[i]+145);
 }
 if (x[i] > width/2&&y[i] < height/2) {
   //BrazoDerecho
   fill(98,172,180);rect(x[i]+87.5,y[i]+58,50,20,0,0,20,0);rect(x[i]+117.5,y[i]-10,20,68,5,5,0,0);
   noStroke();rect(x[i]+119,y[i]+30,17,38);
   stroke(0);line(x[i]+(367.5+20/3-250),y[i]-9,x[i]+(367.5+20/3-250),y[i]-2);line(x[i]+(367.5+40/3-250),y[i]-9,x[i]+(367.5+40/3-250),y[i]-2);
   //BrazoIzquierdo
   fill(98,172,180);rect(x[i]-137.5,y[i]+58,50,20,20,0,0,0);rect(x[i]-137.5,y[i]+78,20,68,0,0,5,5);
   noStroke();rect(x[i]-136,y[i]+70,17,38);
   stroke(0);line(x[i]-(250-112.5-20/3),y[i]+138,x[i]-(250-112.5-20/3),y[i]+145);line(x[i]-(250-112.5-40/3),y[i]+138,x[i]-(250-112.5-40/3),y[i]+145);
 }
 else if (x[i] < width/2&&y[i] > height/2) {
   //BrazoDerecho
   fill(98,172,180);rect(x[i]+87.5,y[i]+58,50,20,0,0,20,0);rect(x[i]+117.5,y[i]-10,20,68,5,5,0,0);
   noStroke();rect(x[i]+119,y[i]+30,17,38);
   stroke(0);line(x[i]+(367.5+20/3-250),y[i]-9,x[i]+(367.5+20/3-250),y[i]-2);line(x[i]+(367.5+40/3-250),y[i]-9,x[i]+(367.5+40/3-250),y[i]-2);
   //BrazoIzquierdo
   fill(98,172,180);rect(x[i]-137.5,y[i]+58,50,20,20,0,0,0);rect(x[i]-137.5,y[i]+78,20,68,0,0,5,5);
   noStroke();rect(x[i]-136,y[i]+70,17,38);
   stroke(0);line(x[i]-(250-112.5-20/3),y[i]+138,x[i]-(250-112.5-20/3),y[i]+145);line(x[i]-(250-112.5-40/3),y[i]+138,x[i]-(250-112.5-40/3),y[i]+145);
 }
 
 
  //Limites
   if (x[i]+137.5 > width||x[i]-137.5 <0) {
    vx[i]= -vx[i];
   }
   if (y[i]+215 > height||y[i]-125 <0) {
    vy[i]=-vy[i];
   }   
  
  //ActualizaPosicion
   float r = random(100);

   if (r < 25) {
    //derecha
    x[i] = x[i]+vx[i];
   } 
   else if (r < 50) {
    //izquierda
    x[i] = x[i]-vx[i];
   } 
   else if (r<75) {
    //arriba
    y[i] = y[i] -vy[i];
   } 
   else if (r<100) {
    //abajo
    y[i] = y[i] +vy[i];
   }

}



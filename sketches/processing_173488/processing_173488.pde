
int t= second(),m=minute(), h=hour();
int j,k;
int d=day(),mes =month (), a=year();
void setup (){
size (1100,800);
 background (0);
 PFont mono;
    smooth(20);
    mono = loadFont("Moonbeam-48.vlw");
   textFont(mono);
    textSize(50);
//Fecha inicial
    fill(107,229,191,90);
    text("D", 800, 75);  
    text(d, 800, 125);
  fill(202,107,229,90);
  text("M", 875, 75);
  text(mes, 875, 125);
  fill(229,196,27,90);
  text("A", 950, 75);
  text(a, 950, 125);  
//Hora inicial
  fill(107,229,191,90);
  text(hour()+" : ", 800, 180);
//Minuto inicial
  fill(202,107,229,90);
  text(minute()+" : ", 875,180);
//Segundo inicial
  fill(229,196,27,90);
  text(second(), 950, 180);  
 for (int i=12; i<24; i=i+1){
 
    smooth();
      fill(0,80);
   ellipse (400+(250*cos(0.52*i-1.57)),400+(250*sin(0.52*i-1.57)),240,240);
    }
 //Rellena los círculos concéntricos que representan los minutos dentro de las horas ya pasadas.
    if (h<12){
     k=h+12;
   }
   k=h;
    for (int i=12; i<k; i=i+1){
      for (int j= 0; j<240; j=j+4){
        strokeWeight(2);
        stroke (random (255),random(255),random (255),80);
        noFill();
   ellipse (400+(250*cos(0.52*i-1.57)),400+(250*sin(0.52*i-1.57)),240-j,240-j);
      }
    }
     for (int j=0; j<m*4 ;j=j+4){
       strokeWeight(2);
    stroke (random (255),random(255),random (255),80);
   ellipse (400+(250*cos(0.52*h-1.57)),400+(250*sin(0.52*h-1.57)),240-j,240-j);
     }
     for(int i=0; i<t;i+=1){
       stroke(0);
        strokeWeight(0.1);
     smooth(10);
    fill(random (255),random(255),random(255),i/2+5);
    ellipse(400+(100*cos(0.105*i-1.57)),400+(100*sin(0.105*i-1.57)),100,100);
   
     }
}

  void draw(){
//Cuando cambia de un segundo al siguiente se ejecuta lo que sigue.
//Borra el número del segundo anterior con un rectángulo negro y escribe el nuevo segundo en el mismo lugar.
//Además dibuja un nuevo círculo de color aleatorio.
    if (t!=second ()){
      
      fill(0);
      noStroke();
      rect(950,130,1000,220);
  
      t=second();
      fill(229,196,27,90);
  text(t, 950, 180); 
     stroke(0);
    strokeWeight(0.1);
     smooth(10);
    fill(random (200),random(100),random(100),second()/2+5);
ellipse(400+(100*cos(0.105*second ()-1.57)),400+(100*sin(0.105*second ()-1.57)),100,100);
    }
//Cuando cambia el minuto borra el número anterior con un cuadrado negro y escribe el nuevo.
//
       if (m!=minute ()){
      m=minute();
      fill(0);
      rect(875,130,900,180);
      fill(202,107,229,90);
  text(m+" : ", 875,180);
      j=m;
      strokeWeight(2);
      stroke (random (255),random(255),random (255),80);
      noFill();
  ellipse (400+(250*cos(0.52*h-1.57)),400+(250*sin(0.52*h-1.57)),240-j,240-j);
    }
     if (h!=hour()){
       h=hour();
       noStroke();
       fill(0);
       rect(800,130,850,180);
       fill(107,229,191,90);
  text(hour()+" : ", 800, 180);
     }
     if ((hour()==0)&&(minute()==0)){
       if(second()==0){
       noStroke();
       fill(0);
       rect(0,0,800,800);}
     }
     }





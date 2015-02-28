
//SEGUNDOS
PVector segundos = new PVector(0,0);
float angSegundos = 10;
float radioSegundos =200;
int szSegundos=20;

//MINUTOS
PVector minutos = new PVector(0,0);
float angMinutos = 5;
float radioMinutos =150;
int szMinutos=20;

//HORAS
PVector horas = new PVector(0,0);
float angHoras = 2;
float radioHoras =100;
int szHoras=20;

void setup(){
  size(500,500);
  fill(175);
  strokeWeight(7);}
  
  
  void draw(){
    background(0);
    //SEGUNDOS
    angSegundos = map(second(),0,60,0,-TWO_PI);
    angSegundos += PI;
    segundos.x=width/2 + radioSegundos * sin(angSegundos);
    segundos.y=height/2 + radioSegundos * cos(angSegundos);
    
    noFill();
    stroke(100);
    ellipse(width/2,height/2,radioSegundos*2,radioSegundos*2);
    fill(100);
    
    ellipse(segundos.x,segundos.y,szSegundos,szSegundos);
    
   //MINUTOS
    angMinutos = map(minute(),0,60,0, -TWO_PI);
    angMinutos += PI;
    minutos.x=width/2 + radioMinutos * sin(angMinutos);
    minutos.y=height/2 + radioMinutos * cos(angMinutos);
    
    noFill();
    stroke(175);
    ellipse(width/2,height/2,radioMinutos*2,radioMinutos*2);
    fill(175);
    
   ellipse(minutos.x,minutos.y,szMinutos,szMinutos);
   
   
    //HORAS
    angHoras = map(hour(),0,24,0,-TWO_PI)%12;
    
    horas.x=width/2 + radioHoras * sin(angHoras);
    horas.y=height/2 + radioHoras * cos(angHoras);
    
    noFill();
    stroke(200);
    ellipse(width/2,height/2,radioHoras*2,radioHoras*2);
    fill(200);
    
   ellipse(horas.x,horas.y,szHoras,szHoras);
   
   
   if (mousePressed == true) { 
     background(0);
     noStroke();
     fill(175);
     ellipse(width/2,height/2,segundos.x*2,minutos.x*2);
     fill(0);
     stroke(100);
     strokeWeight(3);
     line(width/2,height/2,segundos.x,segundos.y);
     strokeWeight(5);
     line(width/2,height/2,minutos.x,minutos.y);
     strokeWeight(7);
     line(width/2,height/2,horas.x, horas.y);
     
   } 
  }

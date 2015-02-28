
color azul= color (35,148,160);
color rojo= color (232,49,49);
PFont fnt;
int radioint = 10;
int radio = 300;
int distancia = 5;
int t = 50;



class monster{ 
  color colorRelleno;
  int t;
  color sombras;
  int num;
  int x[];
  int y[];
  int nom;
  int p[];
  int q[];
  String Texto;
  String Texto2;
  String Texto3;
int counter;
float posX;
float posY;
float posYmax;

  
  monster(){
    this.t=50;
    this.colorRelleno= azul;
    this.sombras= colorRelleno-40;
    this.num=100;
    this.x= new int[num];
    this.y= new int[num];
    this.p= new int[nom];
    this.q= new int[nom];
    this.Texto= "    ZzZ";
    this.Texto2= "   Zzz";
    this.Texto3= "  ... Zzz";
    this.counter= 0;
    this.posX=600;
    this.posY=300;
    this.posYmax=100;
    
 
    
  }
  
  monster(int tt, int Relleno)
  {
    this.t=tt;
    this.colorRelleno=Relleno;
  }
  
  
  void dibujar (){
  
      for ( int i= 1; i<=10 ; i= i+1){
      fill(255);
      rect(random(1000), random(400), 2, 2);
  }
   for ( int i= 1; i<=10 ; i= i+1){
      fill(255);
      rect(random(1000), random(400), 1, 1);
  }
   for ( int i= 1; i<=10 ; i= i+1){
      fill(255);
      rect(random(1000), random(400), 1, 1);
  }
   for ( int i= 1; i<=10 ; i= i+1){
      fill(255);
      rect(random(1000), random(400), 2, 2);
  }
   for ( int i= 1; i<=10 ; i= i+1){
      fill(255);
      rect(random(1000), random(400), 1, 1);
  }
   for ( int i= 1; i<=10 ; i= i+1){
      fill(255);
      rect(random(1000), random(400), 2, 2);
  }
   for ( int i= 1; i<=10 ; i= i+1){
      fill(255);
      rect(random(1000), random(400), 1, 1);
  }
   for ( int i= 1; i<=10 ; i= i+1){
      fill(255);
      rect(random(1000), random(400), 1, 1);
  }

    stroke(255);
    strokeWeight (5);
    //Cuerpo
  fill(colorRelleno);
  rect (width/3, height*2/4, 7*t,3*t);
  
  //Cabeza
  fill(colorRelleno);
  rect (width*3/7,height*2/5,3*t,2*t);
  
  fill(sombras);
  
  // Ojos
  fill(sombras);
    stroke(0);
  strokeWeight(2);
 ellipse(width*4/9+t/6,height*4/9,t/2,t/2);
 ellipse(width*5/9+t/18,height*4/9,t/2,t/2);
 fill(0);

 

 stroke(255); 
 fill(sombras);
  strokeWeight(5);
 
 //manos
beginShape();
 vertex (width*4/11, height*6/11);
 vertex(width*4/11, height*7/11);
 vertex(width*4/11 +t,height*7/11);
 vertex(width*4/11 +t,height*6/11);
 endShape();
 
 beginShape();
 vertex (width*4/11+t*5 , height*6/11);
 vertex(width*4/11+t*5, height*7/11);
 vertex(width*4/11 +t*6,height*7/11);
 vertex(width*4/11 +t*6,height*6/11);
 endShape();
 
 //Panza
 rect(width*5/13,height*8/12, 5*t,t);
 
 //Patas
  beginShape();
 vertex (width*4/11+t*5 , height*2/4 +3*t );
 vertex(width*4/11+t*5, height*10/12);
 vertex(width*4/11 +t*6,height*10/12);
 vertex(width*4/11 +t*6,height*2/4 +3*t);
 endShape();
 
  beginShape();
 vertex (width*4/11 , height*2/4 +3*t );
 vertex(width*4/11, height*10/12);
 vertex(width*4/11+t ,height*10/12);
 vertex(width*4/11 +t,height*2/4 +3*t);
 endShape();
 



 //orejas
fill(sombras);
 rect(width*3/7+t/2,height*2/5-t,t/2,t);
 rect(width*3/7 +2*t,height*2/5-t,t/2,t);
 
 //boca
 strokeWeight(3);
 line(width*3/7+t/2,height*2/5+3*t/2,width*3/7 +5*t/2 ,height*2/5+3*t/2);
 
 //dientes
 fill(255);
  strokeWeight(2);
 triangle(width*3/7+(t/2),height*2/5+3*t/2,width*3/7+ t,height*2/5+3*t/2,width*3/7+t/2+t/4,height*2/5+t);
 triangle(width*3/7+2*t,height*2/5+3*t/2,width*3/7 +5*t/2,height*2/5+3*t/2,width*3/7+5*t/2-t/4,height*2/5+t);
  
   strokeWeight(5);
   
   

 if (mousePressed == true){
   
   
 
   //Cuerpo
  fill(colorRelleno);
  rect (width/3, height*2/4, 7*t,3*t);
  
  //Cabeza
  fill(rojo);
  rect (width*3/7,height*2/5,3*t,2*t);
  
  fill(sombras);
  
  // Ojos
  fill(255);
    stroke(0);
  strokeWeight(2);
 ellipse(width*4/9+t/6,height*4/9,t/2,t/2);
 ellipse(width*5/9+t/18,height*4/9,t/2,t/2);
 fill(0);

 strokeWeight(3);
  ellipse(width*4/9+t/6,height*4/9,t/10,t/10);
 ellipse(width*5/9 +t/18,height*4/9,t/10,t/10);

 stroke(255); 
 fill(sombras);
  strokeWeight(5);
 
 //manos
beginShape();
 vertex (width*3/11, height*6/11);
 vertex(width*3/11, height*7/11);
 vertex(width/3 +t,height*7/11);
 vertex(width/3 +t,height*6/11);
 endShape();
 
 beginShape();
 vertex (width/3+t*6 , height*6/11);
 vertex(width/3+t*6, height*7/11);
 vertex(width*5/11 +t*6,height*7/11);
 vertex(width*5/11 +t*6,height*6/11);
 endShape();
 
 //Panza
 rect(width*5/13,height*8/12, 5*t,t);
 
 //Patas
  beginShape();
 vertex (width*4/11+t*5 , height*2/4 +3*t );
 vertex(width*4/11+t*5, height*10/12);
 vertex(width*4/11 +t*6,height*10/12);
 vertex(width*4/11 +t*6,height*2/4 +3*t);
 endShape();
 
   beginShape();
 vertex (width*4/11 , height*2/4 +3*t );
 vertex(width*4/11, height*10/12);
 vertex(width*4/11+t ,height*10/12);
 vertex(width*4/11 +t,height*2/4 +3*t);
 endShape();
 
  fill(rojo);
 //orejas
 rect(width*3/7+t/2,height*2/5-t,t/2,t);
 rect(width*3/7 +2*t,height*2/5-t,t/2,t);
 
 //boca
  
 strokeWeight(3);
 fill(0);
 rect(width*3/7+t/2,height*2/6+3*t/2,t*2,t);
 
 //dientes
 fill(255);
  strokeWeight(2);
 triangle(width*3/7+(t/2),height*2/6+3*t/2 +t,width*3/7+ t,height*2/6+3*t/2+t,width*3/7+t/2+t/4,height*2/6+t+t);
 triangle(width*3/7+2*t,height*2/6+3*t/2 + t,width*3/7 +5*t/2,height*2/6+3*t/2+t,width*3/7+5*t/2-t/4,height*2/6+t+t); 
  
   strokeWeight(5); 
   
     
}

}

 void estela(){
   
   smooth();
 fill(random(255),random (255),random(255),100);
 background (0);

 for(int i=num-1; i>0; i--)
{
  x[i] = x[i-1];
  y[i] = y[i-1];
  
}
x[0] =mouseX;
y[0] = mouseY;
for(int i=0; i<num; i++)
ellipse(x[i], y[i], i/2.0, i/2.0);
}

void texto(){
      
 frameRate(5);
  fnt = loadFont("KhmerUI-48.vlw");
  textFont(fnt,40);
  fill(color(random(240),random(98,216),random(240,250)));
 
  text(Texto2,posX,posY);
    
  if(counter<18){
  posY=posY+5;
  }
  else {
  posY=posY-5;
}
if(counter==30){
  counter=0;
}
if (counter==0){
  posY=posYmax;
} 

counter++; 
 if (mousePressed == true){
  fill(0);
  noStroke();
  rect(posX,posY-50,100,80);
 }

  textSize(20);
   text(Texto,posX-20,posY-35);
   if(counter<18){
  posY=posY+5;
  }
  else {
  posY=posY-5;
}
if(counter==30){
  counter=0;
}
if (counter==0){
  posY=posYmax;
} 
counter++; 
 if (mousePressed == true){
  fill(0);
  noStroke();
  rect(posX,posY-50,100,80);
 }

  textSize(20);
   text(Texto3,posX-20,posY+5);
   if(counter<18){
  posY=posY+10;
  }
  else {
  posY=posY-10;
}
if(counter==30){
  counter=0;
}
if (counter==0){
 posY=posYmax;
} 

counter++; 
 if (mousePressed == true){
  fill(0);
  noStroke();
  rect(posX,posY-50,100,80);
 }
}

}

 monster fijo,modificado;

void setup(){
   
  size(1000,500);
  background(0);
  smooth();

  strokeJoin(ROUND);
  strokeWeight(5);
  rectMode(CORNER);
  ellipseMode(CENTER);
  fijo= new monster();
  



}
void draw(){

    fijo.estela();
  fijo.dibujar();
    fijo.texto();
    
     for (int i = 0; i < radio; i+=distancia)
  {
    fill(255, i/radioint); 
    noStroke();
    ellipse(mouseX, mouseY, radio - i, radio - i);
  }
  
  noStroke();
fill(139.101,30); 
 //tierra
   beginShape();
 vertex (0, height*10/12 );
 vertex(width, height*10/12);
 vertex(width ,height);
 vertex(0,height);
 endShape();



}


  
  





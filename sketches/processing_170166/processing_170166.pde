
PImage img;
PFont f;
int nivel = 0;

color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;

float x = 500;
float y = 400;
float diameter = 400;



void setup(){
 size(800,800);
 img = loadImage("portraitbase.jpg");
 img.resize(300,300); 
 f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on

 rectColor = color(255);
 rectHighlight = color(150);
 circleColor = color(255);
 circleHighlight = color(150);
 baseColor = color(255);
 currentColor = baseColor;
 ellipseMode(CENTER);
 

}

void draw (){
  
 background(currentColor);
  
  
  
 if (nivel == 0) {
 background(255);  
 textFont(f,36);
 fill(0);
 textAlign(LEFT);
 text("Autoretrato - Autoportrait",150,350); 
 text("ENJMIN",150,400);  
 textFont(f,22);
 fill(0);
 text("Luis Wong",150,450);
 textFont(f,16);
 fill(0);
 text("Les instructions de cette interaction sont en espagnol.",250,550);
 textFont(f,16);
 fill(0);
 text("Haz click.",250,600);
 if (mousePressed && nivel == 0) {
   nivel = 1;
   delay(500);
 }
 
 
 //Nivel 1
 } else if (nivel == 1){
 background(255);
 fill(rectColor);
 stroke(0);
 rect(150,300,200,200);
 
 fill(circleColor);
 stroke(0);
 ellipse(500,400,200,200); 
 
 textFont(f,20);
 fill(0);
 text("Toca el cuadrado para avanzar. Y el círculo para retroceder.",50,750);
   
   //Sobre - rectángulo
   if ((mouseX >=150 && mouseX <= 350) & (mouseY >=300 && mouseY <=500)){
     rectOver = true;
     rectColor = rectHighlight;  
   } else {
     rectOver = false;
     rectColor = baseColor;
   }
 
   
   
   float disX = x - mouseX;
   float disY = y - mouseY;
 
   //Sobre - círculo
   if (sqrt(sq(disX) + sq(disY)) < 100) {
      circleOver = true;
      circleColor = circleHighlight;
      
   } else {
      circleOver = false;
      circleColor = baseColor;
      
   }
   
   //Clicks - botones rectángulo y círculo
   if (rectOver && mousePressed && nivel==1){
     nivel = 2;
     delay(500);
   } else if (circleOver && mousePressed && nivel==1) {
     textFont(f,36);
     fill(0);
     nivel = 0;
     delay(500);
   }
 
 }
 
 
 
 //Nivel 2
 else if (nivel == 2){
 
 textFont(f,16);
 fill(0);
 String s = "El autoretrato es una forma para conocernos a nosotros mismos. A través de este ejercicio podemos mirarnos hacia dentro y expresar aquello que sentimos que nos hace como somos. En mi caso, ha sido una oportunidad para aprender a utilizar un lenguaje de programación al cual nunca antes me había acercado (Processing). Los textos están en español para representar el origen que tengo.";
 textAlign(CENTER);
 text(s, 25, 150, 750, 250);  
 
 textFont(f,30);
 fill(0);
 textAlign(LEFT);
 text("San Francisco - Marzo 2014",50,750);
 textFont(f,16);
 fill(0);
 image(img, 250,300);
 textAlign(LEFT);
 text("Haz click para comenzar de nuevo",50,780);
 textFont(f,16);
 fill(0);
 textAlign(CENTER);
 text("www.luiswong.com",width/2,650);
   if (mousePressed && nivel == 2) {
   delay(500);
   nivel = 0;
   }
 }
 
}

void delay(int delay)
{
  int time = millis();
  while(millis() - time <= delay);
}



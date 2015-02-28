
float timer = 0.00;
float x= 0;
float x2 = 0;
float x3 = 0;
float x4 = 0;
int counter = 0;

PFont r;
String message = "too much to handle";
String message1 = "You're out of control";
float theta; 
int index;

color[] palette=new color[3];

Void setup(){
  size(600,600);
  f = createFont("Arial",16,true); 
  h = createFont("arial", 16, true);
  r = createFont("arial", 20, true);
  color(RGB);
  textMode(MODEL);
  
  palette[0]=color(0,255,255,200);
  palette[1]=color(255,0,255,200);
  palette[2]=color(255,255,0,200);
}

void draw(){

  x= x + 3;
  timer = timer + (2.0/30);
  counter = millis()/1000;
  
  index = round(random(0,2));
  fill(palette[index]);
  rect(0,0,600,600);
  
 
  textFont(f);
  fill(255,26,72);
  textAlign(CENTER);
  textSize(28);
  text("Maybe there's more to life than being really, really, really ridiculously good looking?", (700 - x),90);
  
  textFont(h);
  fill(38,167,250);
  textSize(random(12,36));
  text("Be who you are", (1100 - x),220);
  
  textFont(h);
  fill(153,50,198);
  textSize(random(18,40));
  text("Do what makes you happy", (1300 - x),340);
  
  textFont(h);
  fill(250,255,21);
  textSize(30);
  text("Smile", (1400 - x),480);
  
  textFont(h);
  fill(245,161,35);
  textSize(30);
  text("Where are your manners?!", (1500 - x),100);
  
  textFont(h);
  fill(0);
  textSize(38);
  text("BE INDEPENDENT", (1400 - x),250);
  
  textFont(h);
  fill(255,46,39);
  textSize(38);
  text("Have a strong work ethic", (1500 - x),400);
  
  textFont(r);
  fill(255,26,141);
  textSize(25);
  text("Y o u   o n l y   g o t   t h e   j o b   b e c a u s e   y o u' r e   p r e t t y", (1500 - x),580);
  
   if (counter>16 && counter<=18){
    fill(0);
    rect(0,0,600,600);
    textSize(50);
    textAlign(CENTER);
    fill(255);
    text("BREATH",300,300);
  }
  
  if (counter>18 && counter<=21){
    fill(255);
    rect(0,0,600,600);
    textSize(50);
    textAlign(CENTER);
    fill(0);
    text("INHALE",300,300);
  }
  
  if (counter>21 && counter<=24){
    fill(0);
    rect(0,0,600,600);
    textSize(50);
    textAlign(CENTER);
    fill(255);
    text("EXHALE",300,300);
  }
  
   if (counter>24 && counter<=40){
    fill(255);
    rect(0,0,600,600);
    textSize(50);
    textAlign(CENTER);
    fill(0);
    text("REPEAT",300,300);
  }
  
  println(counter);
  
  if (counter>4 && counter<=16){
  textFont(r);
  fill(60,232,35);
  translate(width/4,height/1.5);  // Translate to the center
  rotate(theta);                // Rotate by theta           
  text(message,0,0);            
  theta += 0.05;                // Increase rotation
  
  textFont(r);
  fill(44,172,206);
  textSize(30);
  translate(width/7,height/7);  // Translate to the center
  rotate(theta);                // Rotate by theta           
  text(message1,20,56);            
  theta += 0.02; 
  }
  
   
//http://www.processing.org/tutorials/text/
}





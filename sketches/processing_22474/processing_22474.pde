
PImage img,clock1,clock2;
float seiGradi = PI/30;
float trentaGradi = PI/6;

void setup()
{
  smooth();
  clock1 = loadImage("clock1.png");
  clock2 = loadImage("clock2.png");
  img= loadImage("map.jpg");
  size (img.width,img.height);  
}

void draw()
{
  noCursor();
  image(img,0,0);
  
  PFont font;
  font = loadFont("Segmental-48.vlw");
  fill(255);
  textFont(font, 32);
       
  text("NewYork",210, 640);
  text("Brasila",395, 640);
  text("London",610, 640);
  text("Rome",825, 640);
  text("Tehran",1010, 640);
  text("Tokyo",1215, 640);
  
  infobox();
  worldTime();
  
  translate(-1250,-650);
  image(clock1 ,mouseX-50,mouseY-50);
  
  stroke(0,120);
  line(mouseX,0,mouseX,800);
  line(0,mouseY,1440,mouseY);
  
  noStroke();
  translate(mouseX,mouseY);
  clock((mouseX/15)/4,(mouseX+30/15)/4); //time zone
  
}
void worldTime (){
  squadro(150,600,1200,170);
  
  translate(250,700);
  image(clock2,-50,-50); //NewYork
  clock(-7,0);
  
  translate(200,0);
  image(clock2,-50,-50); //Brasilia
  clock(-4,0);
  
  translate(200,0);
  image(clock2,-50,-50); //London
  clock(-1,0);
  
  translate(200,0);
  image(clock2,-50,-50); //Rome
  clock(0,0);
  
  translate(200,0);
  image(clock2,-50,-50); //Tehran
  clock(3,30);
  
  translate(200,0);
  image(clock2,-50,-50); //Tokyo
  clock(8,0);
}

void infobox (){
  squadro(10,30,160,300);
  fill(255,200);
  PFont font;
  font = loadFont("Segmental-48.vlw");
  textFont(font, 25);
  text (year()+" /"+month()+" /"+day(),20,70);
  text (hour()+" :"+minute()+" :",20,120);
  textFont(font, 20 );
  text (second()+" :"+millis(),100,120);
  text("X = "+ mouseX, 20, 150);
  text("Y = "+ mouseY, 20, 170);  
}

void clock (int T1, int T2)
{
  int secondi = second();  
  disegnaLancetta( secondi*seiGradi, 45, 1); 

  int minuti = minute()+T2;  
  disegnaLancetta( minuti*seiGradi, 35,2 );
  
  
  int ore = hour()+T1;   
  disegnaLancetta( ore*trentaGradi, 25,3 );
}

void disegnaLancetta( float angolo, float lunghezza,int Spessore ) 
{
  pushMatrix();
  rotate( angolo-HALF_PI );
  strokeWeight(Spessore);
  stroke(200);
  line( 0,0, lunghezza,0 );
  popMatrix();  
}

void squadro(int x1, int y1, int x2, int y2)
{
  fill(153,30);
  rect(x1 , y1 , x2 , y2);
}


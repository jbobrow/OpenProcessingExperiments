
PFont font;
String[] fontList = PFont.list();

PImage img;
int angle;

 
void setup(){
  img = loadImage("apple_white.png");
 
  size(450, 450, P3D);
  angle = 0;
  
  println(fontList);
  font = createFont("Arial",96);
  textFont(font);
}

void draw(){
  //haikei
  background(10,10,10);
  
  //mozi
  fill(255);
  text("Apple",105,430);
  
  //gazou
  imageMode(CENTER);
  tint(random(100,200));
  image(img, 100, 55);
  
  //kaitensokudo
  angle += 1;
  if(angle > 360) angle = 0;
  
  //hakonoiro
  fill(random(200,255),50,50);
  
  //hakono3Dsettei
  for(int x = 0; x <= 800; x += 20){
    for(int y = 0; y <= 200; y += 20){
  translate(490, 1 );
  //rotateX(radians(angle));
  rotateY(radians(angle));
  //rotateZ(radians(angle));
  box(50, 50, 50);
   }
  }
}
  
  //kurikkudemozi
 void mousePressed(){
   fill(255);
   text("Apple",105,430);
 }
 



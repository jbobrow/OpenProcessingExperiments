


PImage pho;
PImage beefbones;
PFont myfont;
float chicken=4;
String message = "YUMMY!";
float theta;


 
void setup(){
size(800,800);
myfont=loadFont("Avenir-Book-48.vlw");

pho=loadImage("Pho-Beef-Noodles-2008.jpg");
beefbones=loadImage("beefbones.jpg");
  
 
}
void draw(){
  background(mouseX,mouseY,frameRate);
  image(pho,mouseX,0,mouseY,height);
  image(beefbones,mouseY,0,mouseX,height);
  chicken = map(40,40,height,50,100);
  
  textSize(chicken);
  textFont(myfont, 30);
  textAlign(CENTER);
  text("What's the secret to making pho broth?",400,mouseY/3);
  float sinOfTime = sin( millis() * 0.004 );
  float sinMapped = map( sinOfTime, -1.0, 1.0, 100, 140 );  
  textFont(myfont, sinMapped);
  fill(0, 102, 153);
  text("Beef and PORK bones",0,400,800,600);
  
   textFont(myfont);                 // Set the font
  translate(width/2,height/2); // Translate to the center
  rotate(theta);               // Rotate by theta
  textAlign(CENTER) ;
  text(message,mouseX,mouseY); 
  
  
  theta += 0.01; 
  

}





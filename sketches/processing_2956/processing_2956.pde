
PImage imagen;
void setup () {
  size(450, 684);
  imagen= loadImage("gnda.jpg");
  rectMode(CENTER);
  background(0);

}

void draw(){
 
  if(mousePressed){
  float pointillize =random(3,20);
  int n = int(random(imagen.width));
  int m = int(random(imagen.height));
  color pix = imagen.get(n, m);
  fill(pix,200);
  ellipse(n, m, pointillize, pointillize);
  noStroke();
 
  
}else if (keyPressed){
      float des = (height-mouseY) / 10;  
  color img;  
  int x = int( random(450) );  
  int y = int( random(684) );  
  img = imagen.get(  x , y ); 
  fill( red(img) , green(img) , blue(img) , 100 ); 
  noStroke();
  float lado = random(3,20); 
  rect( x , y , lado , lado ); 
  }
  } 






float posX = 250;
float posY = 300;

void setup(){
  size(500,500);
  smooth();
}

void draw(){
background(255); 
noStroke();
fill(0);

posX = posX + random(-1,1);
posY = posY + random(-1,1);

pushMatrix ();

if (dist(mouseX,mouseY,posX,posY)< 50) {
  if(mousePressed){
  posX = posX + random(-200,200);
  posY = posY + random(-200,200);
  }
  else{posX = posX+random(-4,4);
  posY = posY+random(-4,4);
  }
  if(posX < 0){
  posX = posX + 200;}
  if(posX > width){
  posX = posX - 200;}
  
  if(posY < 0){
  posY = posY + 200;}
  if(posY > height){
  posY = posY - 200;}

}

translate (posX,posY);

ellipse (0,0,170,200);
ellipse (0,-100,150,100);
fill(255);
ellipse (0,-115,40,60);
fill(0);
ellipse (0,-109,35,35);
ellipse (-25,-150,10,100);
ellipse (25,-150,10,100);
fill(255);
ellipse (8,-117,10,10);

if (dist(mouseX,mouseY,posX,posY)< 50) {
ellipse (0,-70,20,10);

}


popMatrix ();

}


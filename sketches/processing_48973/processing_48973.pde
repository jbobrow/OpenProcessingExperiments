
void setup(){
  size(512,512);
  background (0,0,0);
  frameRate(15);
  smooth();
}

void draw(){

//width, height
// mouseX, mouseY- pozycja myszki
// pmouseX pmouseY- poprzednia pozycja myszki  
filter(BLUR);

int d= int(random(40, 120));
noStroke();
fill(255, 10);
ellipse(random(width), random(width), d,d);


if (mousePressed == true){ // rysuj jak naciskasz przycisk lewy myszki
  if (mouseButton == LEFT )
  //narysuj elipse -x,y, szerokosc, wysokosc
  
fill(25,60,80,100);
noStroke();
ellipse(mouseX,mouseY,d,d);
}
}



int posicionX;

void setup(){
  
  size(700,300);
  posicionX=100;

}

void draw(){
  background(135, 206, 255);

  fill(255,255,0);
ellipse(500,30,50,50);
   fill(200,0,0);
     triangle(posicionX+80,140,posicionX+80,55,posicionX+120,140);
   triangle(posicionX+30,140,posicionX+70,55,posicionX+70,140);
 line(posicionX+75,posicionX+145,posicionX+75,50);
 fill(128);
    quad(posicionX+0,145,posicionX+150,145,posicionX+120,180,posicionX+30,180);
     
  fill(0, 0, 255);
      rect(0,170,700,300);
   
  posicionX=posicionX+1;


if (posicionX==700) {
  posicionX=0;
}
}


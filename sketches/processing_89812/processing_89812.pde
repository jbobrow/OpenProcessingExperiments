
//rotating on a assigned axis using translate: rotate, scale

String message = "tickle";
float angle;
float x,y ;

void setup(){
size(640,480);
  textFont(createFont("Helvetica",36));
smooth();
}

void draw(){
 fill(50,255,30, 50);
  rect(0, 0, width, height);
angle +=.03;

translate(mouseX,mouseY);

rotate (angle);
scale(2,2);


fill(0);
  text("RADAR", x, y);
  
  }



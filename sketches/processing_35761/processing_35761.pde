
int sizes = 60;
float ypos = 200;
float xpos = 350;

float x_current = 350;
float y_current = 200;
float distX;
float distY;

float dsitXfinal = 0;
float distYfinal = 0;

float easea = 0.1; //force
float easeb = 0.8; //force

void setup() {
  size(700,400);
  background(0);
  
}

void draw(){
  smooth();
  background(0);
  stroke(200,50);
  fill(200,50);
  ellipse(xpos,ypos,sizes,sizes);
strokeWeight(2);
  //line(350,200,xpos,ypos);
  line(0,0,xpos,ypos);
  line(0,400,xpos,ypos);
  line(700,0,xpos,ypos);
  line(700,400,xpos,ypos);
  line(350,0,xpos,ypos);
  line(350,400,xpos,ypos);
  line(0,200,xpos,ypos);
  line(750,200,xpos,ypos);
  line(0,100,xpos,ypos);
  line(0,300,xpos,ypos);
  line(750,100,xpos,ypos);
  line(750,300,xpos,ypos);
  line(187.5,0,xpos,ypos);
  line(537.5,0,xpos,ypos);
  line(187.5,400,xpos,ypos);
  line(537.5,400,xpos,ypos);
  line(268.75,0,xpos,ypos);
  line(431.25,0,xpos,ypos);
  line(268.75,400,xpos,ypos);
  line(431.25,400,xpos,ypos);
if (mousePressed == true){
  xpos = mouseX;
  ypos = mouseY;}  
  else{
 float distX = 350 - xpos;
 xpos = xpos + (distX/10);
 float distY = 200 - ypos;
 ypos = ypos + (distY/10);
 
 delay(5);
  
}
//void mouseReleased() {

   //xpos = xpos + 0.8;
   //ypos = ypos + 0.8;}




}




int mysize = 30;
float ypos = 200;
float xpos = 350;

float ease = 10;

void setup() {
  size(700,400);
  background(255);
  
}

void draw(){
  smooth();
  background(255);
  stroke(0);
  fill(0);
  ellipse(xpos,ypos,mysize,mysize);
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
  
if (mousePressed == true){
  xpos = mouseX;
  ypos = mouseY;}  
    //if(dist(xpos,ypos,mouseX,mouseY)>80){
    //xpos = xpos + (mouseX - xpos)/(80 + ease);
    //ypos = ypos + (mouseY - ypos)/(80 + ease);}
  
}
void mouseReleased() {
  xpos = 350;
  ypos = 200;
}
void mouseMoved()  {

}


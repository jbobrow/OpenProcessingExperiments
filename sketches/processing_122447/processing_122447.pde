
int eSize;//int eSize sitei
int x,y;//int x,y sitei

void setup(){
  size(600,600);//size 600*600
  background(0);//back is black
  noStroke();
  smooth();
}


void draw(){
  //tokuninashi
}


void mouseMoved(){
  eSize = 200;
}
  
void mouseDragged(){
  fill(random(0,255),random(0,255),random(0,255));
  if(key == 'a')fill(0);//a push kesigomukinou
   else fill(random(0,255),random(0,255),random(0,255));
    ellipse(mouseX+200,mouseY+200,100,100);//zyozyoni purasu
    ellipse(mouseX+100,mouseY+100,100,100);
    ellipse(mouseX, mouseY, 100,100);
} 
//landom color three sircle



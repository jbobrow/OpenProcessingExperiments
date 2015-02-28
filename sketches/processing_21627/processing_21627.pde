
int num=6;
 
Squa[] Squas = new Squa[num];
color[] Colors = new color[3];
 
void setup(){
  size(300,300);
   noStroke();
    rectMode(CENTER);
 Colors[0] = color(255,0,0,50);
 Colors[1] = color(0,255,0,50);
 Colors[2] = color(0,0,255,50);
 for(int i=0;i<Squas.length;i++){
   Squas[i]= new Squa();
 }

}
 
void draw() {
  background(255);
 
  for(int i=0; i < Squas.length; i++) {
    Squas[i].update();
    Squas[i].draw();
  }
}
 
 
class Squa {
 
  float xpos = random(20,width-20);
  float ypos = random(20,height-20); 
  float Size=random(100); 
  color c = Colors[floor(random(0,3))];
 
  Squa() {
  }
   
  void update() {
    Size++;
   if(Size > width) { 
   Size = 1; 
    xpos = random(20,width-20);
    ypos = random(20,height-20); 
    }
  }
 
  void draw() {
   
    fill(c);
    rect(xpos,ypos,Size,Size);
  }
}



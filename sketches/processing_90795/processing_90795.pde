
class Ell {
  
  int x;
  int y;
  int d;
  int p;
  int i;
  
  Ell(int iTemp, int pTemp){
    d = 30;
    x = width*iTemp/5;
    y = 450;
    p=pTemp;
    
  }
  
  void update(){
    if((dist(x ,y,mouseX,mouseY) < 30/2 )&& (mousePressed)){
    x = x + (mouseX - pmouseX);
    y = y + (mouseY - pmouseY);
}
  }

void display(){
  noStroke();
  fill(pal[p]);
  ellipse(x, y, d, d);
  }

}

color [] pal = {#FFFFFF,#FFe8ED,#F569CB,#FF9B16,#D8FF5A};

Ell ell1;
Ell ell2;
Ell ell3;
Ell ell4;

void setup(){
  size(600,500);
  smooth();
  background(pal[0]);

  ell1 = new Ell(1, 1);
  ell2 = new Ell(2, 2);
  ell3 = new Ell(3, 3);
  ell4 = new Ell(4, 4);

  ellipseMode(CENTER);
  fill(#860084);
  text("Click and slowly drag the circles to draw. Press any key to clear the screen.", 1, 498);
}

void draw(){

  noStroke();
  ell1.update();
  ell1.display();
  
  ell2.update();
  ell2.display();
  
  ell3.update();
  ell3.display();
  
  ell4.update();
  ell4.display();
  
}

void keyPressed(){
  background(pal[0]);
  fill(#860084);
  text("Click and slowly drag the circles to draw. Press any key to clear the screen.", 1, 498);
}

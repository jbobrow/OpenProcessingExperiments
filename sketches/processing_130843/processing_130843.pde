


int monsterX;
int monsterY;

void setup() {
  size(500, 500);
  monsterX = 250;
  monsterY = 500;
  
}
void draw() {
  background(255);
  
  
  ellipse(monsterX, monsterY-50, 80, 60);
  fill(50);
  ellipse(monsterX-29, monsterY-50, 16, 32);   
  ellipse(monsterX+29, monsterY-50, 16, 32);
  ellipse(monsterX, monsterY-30, 10, 10);
  fill(150,0,50); //Kleur lichaam RGB
  ellipse(monsterX, monsterY, 40, 40); //lichaam //X=100 Y=130
  line(monsterX-30, monsterY+10, monsterX-20, monsterY);   //armen links
  line(monsterX+20, monsterY, monsterX+30, monsterY+10); //armen rechts
  line(monsterX-10, monsterY+15, monsterX-20, monsterY+40);   //benen links
  line(monsterX+10, monsterY+15, monsterX+20, monsterY+40); //benen rechts
  line(monsterX-30, monsterY-70, monsterX-70, monsterY-110); //spriet links
  line(monsterX+30, monsterY-70, monsterX+70, monsterY-110);  //spriet rechts

  monsterY = monsterY -1;
  monsterX = mouseX;
}


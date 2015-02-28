
PShape s;
PShape t;

int x = 40;
int y = 250;

int orbs = 0;
int oX = 250;
int oY = 150;


color black = color(0);

void setup() {
  size(500, 300);
  s = loadShape("newbackground.svgz");
  t = loadShape("starfishcharacter.svgz");
  smooth();
}

void draw() {
  background(255);
  shape(s, width/2, height/2);
  collisions(x, y);
  orb();
}

void collisions(int cx, int cy) {
  if (keyPressed) {//UP
    if (key == 'w'){
      if (get(cx + 20, cy - 20) != black  && get(cx - 20, cy - 20) != black) {
        y--;
      }
    }
  }
   if (keyPressed) {//DOWN
    if (key == 's'){
      if (get(cx + 20, cy + 20) != black  && get(cx - 20, cy + 20) != black) {
        y++;
      }
    }
   }
    if (keyPressed) {//LEFT
    if (key == 'a'){
      if (get(cx - 20, cy - 20) != black  && get(cx - 20, cy + 20) != black) {
        x--;
      }
    }
   }
   if (keyPressed) {//RIGHT
    if (key == 'd'){
      if (get(cx + 20, cy - 20) != black  && get(cx + 20, cy + 20) != black) {
        x++;
      }
    }
   }
   shapeMode(CENTER);
   //shape(t,x,y,100,100);
      
}

void orb(){
 fill(255);
text("Orbs =" + orbs, 10, 30); 
float oDist = dist(x,y,oX,oY);
if(oDist < 20){
  orbs = 1;
} else if (oDist > 20 && orbs != 1){
  rectMode(CENTER);
  fill(random(255), random(255), random(255));
  rect(oX,oY,30,30);
}
}  



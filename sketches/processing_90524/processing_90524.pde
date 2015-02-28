
float x,y,xv,yv,d;
int s, skeet, shots, difficulty;
reset();
s=0;
skeet=1;
shots=0;
difficulty=1;


 
void setup() {
  size(800, 800);
  smooth();
  cursor(CROSS);
}
 
void draw() {
frameRate(120);
  background(0,200,0,100);
  noStroke();
  fill(0,0,200,100);
  rect(0,0,800,350);
  textAlign(LEFT, BOTTOM);
  fill(0);
 text("Hover of the skeet and click the mouse!", 10, 20);
 text("Skeet hit:   Skeet launched:    Shots fired:   Difficulty:     Accuracy (Hits/Fires):   Effectiveness (Hits/Launchs):",10,40);
 text(s,30,60);
 text(skeet,110,60);
 text(shots,200,60);
  text(difficulty,260,60);
  text(s/shots*100, 350,60);
  text (s/skeet*100,480,60);
  text("(Press the up and down arrows to change the difficulty. Press L to launch a new sheet.)",10,80);  
noStroke();
fill (100,100,100,d*4-50);
 ellipse (x,y+d/10,d,d/2,d);
fill (50,50,50,d*4-50);
 ellipse (x,y,d,d/2,d);
 if (d/2>dist(x,y,mouseX,mouseY)) {
    stroke(150,50,50);
    noFill();
   rect(mouseX-50,mouseY-50,100,100);
 } 
 if ((mousePressed) && (d/2>dist(x,y,mouseX,mouseY))) {
 explosion();
  }
   if ((mousePressed) && (d/2<dist(x,y,mouseX,mouseY))) {
  fill(200,200,200);
  ellipse (mouseX,mouseY,50,50);
 }
x+=xv;
y+=yv;
d-=.2*difficulty;
yv+=.05;
  if (d<=10) {reset();}
 
  } 

void keyPressed() {
    if ((key == 'l') || (key == 'L')) d=0;
    if (key == CODED) {
       if (keyCode == UP) difficulty++;
       if (keyCode == DOWN) difficulty--;
       difficulty= constrain(difficulty, 1, 5);
     }
}

void reset() {
 skeet++;
     if (.5>random(1)) {x=800;} else {x=0;}
     d=105-(difficulty*5);
     y=random(300)+500;
     xv=random(1,4+difficulty);
     yv=-(random(1,5)+2+difficulty);
     if (x==800) {xv=-xv;}
 }
 
 void explosion() {
    fill(200,200,200);
    ellipse (mouseX,mouseY,50,50);
    for (int i=0; i<2000; i++;) {
    frameRate(1);
       stroke(random(255));
       fill(200,200,200,random(255));
       ellipse(x+random(200)-random(200),y+random(200)-random(200),random(100),random(100));
       }
    d=0; 
    s++;  
    }
void mouseClicked() {
   shots++;
   }

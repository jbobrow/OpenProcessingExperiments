
face myface; //declare face object
PImage cone; //declare ice cream cone image
face [] f; //array of objects
float d; //
boolean[] s;
int score;
PFont t;

void setup (){
  size (500, 500);
  f = new face[20];
  myface = new face(100, 100);
  cone = loadImage ("IceCream.jpeg");
  s= new boolean[20];
  t = loadFont ("Serif-48.vlw");
  score = 0;
 
  for (int i=0; i<20; i++){
f[i] = new face (random (0, 500), random (0, 500));
s[i]= false;
}
}

void draw(){
  background (#FFFFFF);
  textFont (t, 48);
  myface.mousedisplay();
  for (int j=0; j<20; j++){
  f[j].unhappydisplay();
  
d = dist(mouseX, mouseY, f[j].xpos, f[j].ypos);

if (d <= 25 && mousePressed == true){
  s[j]= true;
}
if (s[j]==true){
     f[j].happydisplay();
     f[j].scorekeep();
     score = score+1;
    }
}
text(score, 350, 50);
}


class face{
  
float xpos;
float ypos;
float r;
int score;

  face(float xpos1, float ypos1){
  xpos = xpos1;
  ypos = ypos1;
  r=50;
  }

  void unhappydisplay(){
  fill (#EA1139);
    ellipse (xpos, ypos, 50, 50);
    fill (0);
    ellipse (xpos-10, ypos-10, 5, 5);
    ellipse (xpos+10, ypos-10, 5, 5);
    rect (xpos-14, ypos+10, 30, 5);
  }
  
  void happydisplay(){
    fill (#FAF13A);
    ellipse (xpos, ypos, r, r);
    fill (0);
    ellipse (xpos-10, ypos-10, 5, 5);
    ellipse (xpos+10, ypos-10, 5, 5);
    arc (xpos, ypos, 30, 40, 0, PI);
  }
  
  void mousedisplay(){
  image(cone, mouseX-62, mouseY-62);
  }
  
  void scorekeep(){
  println("Yay!"); //printline Yay!
  }
  
}



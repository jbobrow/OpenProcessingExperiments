
//int[] bob = {50,100,150,200,250,300,350, 400};
String[] pat = {"HoNk","hOnK",":o)"};
PFont p;
int index=0;
float t=0;

void setup() {
  size(800,800,P3D);
  frameRate(60); //Nbre frames/secondes
  p = loadFont("ScalaSans-48.vlw");
}

void draw() {
  t+=0.1;

  //pushMatrix();
    textFont(p);
    fill(162,19,206);
    translate(random(width), random(height));
    rotateZ(t);
    text(pat[index],0,0); //creer le texte du tableau pat, emplacement 50x200
    index++;
 // popMatrix();
  
  
  
  if(index>=pat.length) {
    index=0;
  }
  
  println(index);
  
}



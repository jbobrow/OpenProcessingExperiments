
anim[] animations;
anim animEnCours;

void setup() {
  size(500, 500);
  animations = new anim[0];
  colorMode(HSB);
}

void draw() {
  background(0); 
  noStroke();
  if (mousePressed && animEnCours!=null) { 
    animEnCours.ajoute();
  for(anim a:animations){
    a.dessineTraits();
  }
  } else {
    
  for(anim a:animations){
    a.dessine();
  }
  }
}

class anim {
  int[][] coordonnees;  
  color col;
  int index=0;
  anim() { 
    col = color(random(255), 255, 255);
    coordonnees = new int[0][0];
  }
  void dessine() {
    if (coordonnees.length>0) {
      index++;
      if (index>coordonnees.length-1) {
        index=0;
      } 
    int[] c = coordonnees[index]; 
    fill(col);
    ellipse(c[0], c[1], 10, 10);   
    }
  }
  void dessineTraits(){
        stroke(col);
    noFill();
    beginShape();
    for(int[] coo:coordonnees){
      vertex(coo[0], coo[1]);
    }
    endShape();
    
  }
  void ajoute() {
    int[] c = {
      mouseX, mouseY
    };
    fill(col);
   // ellipse(c[0], c[1], 10, 10);   
    coordonnees = (int[][]) append (coordonnees, c);
    stroke(col);
    noFill();
    beginShape();
    for(int[] coo:coordonnees){
      vertex(coo[0], coo[1]);
    }
    endShape();
  }
}

void mousePressed() {
  animEnCours = new anim();
}

void mouseReleased(){
  if (animEnCours != null) {
    if (animEnCours.coordonnees.length>0) {
      animations = (anim[]) append (animations, animEnCours);
    }
  }
}

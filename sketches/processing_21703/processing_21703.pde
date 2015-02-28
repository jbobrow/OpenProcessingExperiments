

float a,b,c,d,h;
boolean pez=false;
color c2;

void setup() {
  size(400,400);
  frameRate(20);
}


void draw() {
  background(0);


  if(pez) {
    a=a+b;
    b=1;
h=mouseY/2;//taille du seuil
    if (a>h) {//taille des cercles

      a=a*-1;
    }
  }
  for(int i=0;i<width+100;i=i+20) {//ronds en large
    for(int j=0;j<height+100;j=j+20) {//ronds en long

colorMode(HSB);
c2=color(random(200),random(180),random(225), 50+ (height*mouseX)/610) ;//couleurs des cercles
      fill(c2);
      noStroke();
      ellipse(i,j,a,a);
      fill(1);
      smooth();
    }
  }
} 

void mousePressed() {
  pez=!pez;
}






//My idea was to recreate the experience of painting in real life.
//The palette is influenced by the Fauvist art-movement.
//I intented to let the user adjust the size of the brush
//on a smooth transition to resemble the strokes of a paintbrush easily.
color[] palette={#F4F1FF,#C92B00,#000000,#DBA30A,#29579E};
int chroma;
int meh=10;
int mod=0;
void setup() {
  size(800,600);
  background(palette[0]);
}
void draw() {
  textSize(20);
  fill(palette[2]);
  text("PRESS",20,20);
  fill(palette[1]);
  text("R for red",20,40);
  fill(palette[3]);
  text("Y for yellow", 20,60);
  fill(palette[4]);
  text("B for blue",20,80);
  fill(palette[2]);
  text("N for black",20,100);
  text("E for eraser",20,120); 
  text("P to take a screenshot",20,140);
  text("+ to increase stroke value",20,160);
  text("- to decrease stroke value",20,180);
}
void keyPressed() {
  if (key=='+') mod+=1;
  if (key=='-') mod-=1;
  if (key=='p' || key=='P') saveFrame("Artwork.png");
    if (key=='r' || key=='R') chroma=palette[1];
  if (key=='y' || key=='Y') chroma=palette[3];
  if (key=='b' || key=='B') chroma=palette[4];
  if (key=='n' || key=='N') chroma=palette[2];
  if (key=='e' || key=='E') chroma=palette[0];
} 
void mouseDragged() {
  stroke(chroma);
  if(mod > -9){
  strokeWeight(meh+mod);
  }
  point(mouseX,mouseY);
}
  



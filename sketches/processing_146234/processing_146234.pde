
float oldmx = 0;
float oldmy = 0;
float bloopy=0;
float strokeR=240;
float strokeG=240;
float strokeB=240;
float fillR=230;
float fillG=230;
float fillB=230;
float hat,cat,bat,mat,fat,nat,pat,sat;
float gloopy;
float snoopy;

void setup(){
size(800,800);
background(200,200,200);
}

void draw()
{
  hat=random(2);
cat=random(4)-2;
bat=random(6)-3;
mat=random(8)-4;
fat=random(4)-2;
nat=random(6)-3;
pat=random(8)-4;
sat=random(6)-3;
  if (mouseX==oldmx && mouseY==oldmy) {
fillR=fillR-cat;
fillG=fillG-nat;
fillB=fillB-sat;
    fill(fillR,fillG,fillB);
    ellipse(mouseX,mouseY,bloopy+1,bloopy+1);
    bloopy++;
  }
  else {
    bloopy=0;
   strokeG=strokeG-nat;
   strokeB=strokeB-cat;
   strokeR=strokeR-pat;
  } 
  if (bloopy>5) {
    gloopy=gloopy+cat+1;
    snoopy=snoopy+cat+1;
    strokeWeight(bloopy/2);
    line (mouseX-((bloopy/2)-snoopy*2), mouseY-((bloopy/2)-gloopy*2), mouseX+((bloopy/2)+snoopy*2), mouseY+((bloopy/2)+gloopy*2));
  }
  else {
    gloopy=0; snoopy=0;
    strokeWeight(1);
  }
  stroke(strokeR,strokeG,strokeB);
  line(mouseX, mouseY, oldmx, oldmy);
  line(mouseX, mouseY, oldmx+cat, oldmy-mat);
  line(oldmx, oldmy, mouseX+pat, mouseY+bat);
    line(mouseX+bat, mouseY, oldmx+fat, oldmy);
  line(mouseX, mouseY, oldmx+mat, oldmy-nat);
  line(oldmx, oldmy+hat, mouseX+hat, mouseY+hat);
oldmx=mouseX;
oldmy=mouseY;

}



PFont fontA;

  int AB = 100; 
  int ED = AB;
  int BE = 250;
  float v = 90;
 


void setup(){
size (800,800);



  smooth();
  // Load the font. Fonts must be placed within the data 
  // directory of your sketch. A font must first be created
  // using the 'Create Font...' option in the Tools menu.
  fontA = loadFont("fon.vlw");

  // Set the font and its size (in units of pixels)
  textFont(fontA, 32);

  // Only draw once


}

void draw(){

  translate((width/2)-(BE/2),(height/2)-(AB/2));
  noFill();
  stroke(15);
  textSize(10);
  
  background(255);
  



  v = (sin(radians(frameCount))*180 +90 +360) % 360;
  if (mousePressed)   v = (mouseX+90) % 360;
  
  PVector a = new PVector(0,0);
  PVector b = new PVector(0,AB);
  
  PVector e = new PVector(b.x + BE,b.y);
  PVector d = new PVector(e.x + sin(radians(v-90))*AB, e.y - cos(radians(v-90))*AB);
  
  PVector ADmiddle = d.get();
  ADmiddle.div(2);
  
    PVector BEmiddle = new PVector(b.x + BE /2,b.y);

  
  
  
  
  
  
  
  arc(e.x,e.y,25.0, 25.0, radians(180),radians(180+v));
  
line(a.x,a.y,b.x,b.y);
line(b.x,b.y,e.x,e.y);
line(e.x,e.y,d.x,d.y);
line(a.x,a.y,d.x,d.y);

ellipse(ADmiddle.x,ADmiddle.y,10,10);
ellipse(BEmiddle.x,BEmiddle.y,10,10);

fill(0,255,0);
text(v+"*",e.x,e.y);


stroke(50,0,250);


float testscale = d.x / BEmiddle.x;
PVector testV = d.get();
testV.div(testscale);
//ellipse(testV.x,testV.y,10,10);

PVector tmp = testV.get();
tmp.sub(ADmiddle);

float k = tmp.mag();
if (tmp.x>0 ) k *= -1;
float k2 = 0;
float cosine = cos(PVector.angleBetween(b,d));
if(cosine !=0)
k2= k/cosine;

PVector c = testV.get();
c.add(new PVector(0,k2));

ellipse(c.x,c.y,10,10);









int foo= 300;
float bisectangle = PVector.angleBetween(b,d)-radians(90);
PVector bisector = new PVector(foo *  sin(bisectangle), foo * cos(bisectangle));
//  float Cx = BEmiddle.x
//  float Cy =

//PVector c = new PVector(ADMiddle


bisector.add(ADmiddle);
line (ADmiddle.x,ADmiddle.y, bisector.x,bisector.y);
bisector.sub(ADmiddle);
bisector.mult(-1);
bisector.add(ADmiddle);

line (ADmiddle.x,ADmiddle.y, bisector.x,bisector.y);
line(BEmiddle.x,BEmiddle.y-foo,BEmiddle.x,BEmiddle.y+foo);



PVector AC = c.get();
PVector BC = c.get(); BC.sub(b);
PVector DC = c.get(); DC.sub(d);
PVector EC = c.get(); EC.sub(e);

stroke (#F50ABA);
drawV(a,c);
drawV(b,c);
drawV(d,c);
drawV(e,c);
PVector p;
stroke(#FFE8F9);
p = c.get(); p.add(a) ; p.div(2);
PrintAt(AC.mag()+"",p);
p = c.get(); p.add(b) ; p.div(2);
PrintAt(BC.mag()+"",p);
p = c.get(); p.add(d) ; p.div(2);
PrintAt(DC.mag()+"",p);
p = c.get(); p.add(e) ; p.div(2);
PrintAt(EC.mag()+"",p);


fill (200,0,0,100);
beginShape();

vertex(a.x,a.y);
vertex(b.x,b.y);
vertex(c.x,c.y);
vertex(a.x,a.y);




endShape();

beginShape();

vertex(e.x,e.y);
vertex(d.x,d.y);
vertex(c.x,c.y);
vertex(e.x,e.y);

endShape();






}

void drawV(PVector from, PVector to){
  line(from.x,from.y,to.x,to.y);
  
  
}

void PrintAt(String txt, PVector at){
  PVector off = new PVector(10,10); 
  PVector adj = at.get(); adj.add(off);
  drawV(at,adj);
  text(txt,adj.x,adj.y);
  

}




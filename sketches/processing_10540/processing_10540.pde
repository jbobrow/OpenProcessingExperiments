
Vector fishes;
int COUNT=200;

int mx,my;
void setup(){
  size(500,500);
  //smooth();
 stroke(255);

 rectMode(CENTER);
  fishes=new Vector();
  for (int x=0;x< COUNT;x++)
    fishes.add(  new Fishy(random(width),random(height), random(-PI,PI), random(0.6)+2.6)  );
}

void draw(){
    background(0);
  noStroke();
  

  Fishy f;
   for (int x=0;x< COUNT;x++){
     f=(Fishy)fishes.get(x);
     f.draw();
   }
 
   for (int x=0;x< COUNT;x++){
     f=(Fishy)fishes.get(x);
     f.look();
   }
    
}


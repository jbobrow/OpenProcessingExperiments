
int Max = 100;
ArrayList plist = new ArrayList();

PVector pvPos;

void setup(){
  size(400,400,P2D);
   
}

void draw(){
  background(220);
  for(int i = 0; i<plist.size(); i++){
    Pollen pollen = (Pollen) plist.get(i);
    pollen.draw();
    pollen.move(); 
  }

}

void mousePressed(){
  addPollen(plist, pvPos);
}

void addPollen(ArrayList arraylist,PVector pv){
  pv = new PVector(mouseX,mouseY);
  arraylist.add(new Pollen(pv,round(random(2,5) ) ) );
}
  


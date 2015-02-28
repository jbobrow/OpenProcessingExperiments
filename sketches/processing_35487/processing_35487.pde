
//G class//A simple class for packing together all that fancy particles/////////////////////

class Bunch {
 LinkedList<Pencil> bunch; 
 boolean joy=true; 
  
  Bunch (int x,int y,int n){ 
    bunch= new LinkedList<Pencil>();
    for (int i=0;i<n;i++){
      bunch.add(new Pencil(x,y));
    }
  }
  
  void update(){
    for (Pencil currentPencil:bunch){
      currentPencil.update();
    } 
  }
  
  void display(){
    for (int i=0;i<bunch.size();i++){
      Pencil currentPencil=bunch.get(i);
      if (currentPencil.isAlive()) {
        currentPencil.display();
      }else{
        bunch.remove(currentPencil);
      }
    }
    if (bunch.size()<=0) joy=false;  
  }

  boolean isFullofJoy(){
    return joy;
  }
}



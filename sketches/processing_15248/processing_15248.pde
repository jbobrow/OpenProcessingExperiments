
class Engine {
  Supersquid s;
  Supersquid [] ss;
  
  Engine(){
  }
  
  Engine (Supersquid s){
    this.s=s;
    ss = new Supersquid[1];
    ss[0] = s;
  }
  
  Engine(Supersquid[] ss){
    this.ss = ss;
  }
  void start() {
    for (int i=0; i<ss.length; i++){
      ss[i].move();
      ss[i].display();
    }
  }  
}
    


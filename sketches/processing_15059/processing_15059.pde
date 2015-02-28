
class Comida {
  ArrayList comida;
  PVector loc;
  float count;
  float power;
  
  Comida(int num) {
    //comeÃ§a com alguma comida;
    comida = new ArrayList();
    loc = new PVector(0.0,0.0);
    count = 0;
    for(int i = 0; i< num; i++) {
      comida.add(new PVector(random(width),random(height)));
    }
   power = 0.2;
  }
  //funÃ§Ã£o para adicionar comida... importante
  void add(PVector l) {
    comida.add(l.get());
  }

  //mostra a comida;
  
  void setCount(float f){
    count = f;
  }
  
  void run() {
    for(int i = 0; i<comida.size(); i++) {
      loc = (PVector) comida.get(i);
      rectMode(CENTER);
      stroke(0);
      fill(random(0,360),100,100);
      ellipse(loc.x,loc.y,5,5);
    }
    
    
   // println("count " + count);
   // println("comidaSize " + comida.size());
   if(comida.size() >= 3){
    if(random(1) < 0.0005 && travarComida != true) {
      comida.add(new PVector(random(width),random(height)));
      count++;
    }
   }
   if(comida.size() < 3){
     if(random(1) < 0.005 && travarComida != true) {
      comida.add(new PVector(random(width),random(height)));
      count++;
    }
   }

    if(criarComida == true && travarComida != true) {
      comida.add(new PVector(mouseX,mouseY));
      count++;
    }
    if(comida.size() > 10){
      travarComida = true;
    }
    if(comida.size() <= 10){
      travarComida = false;
    }
  }
  //retorna a lista de comida;

  ArrayList getComida() {
    return comida;
  }
  
  float getPower(){
    return power;
  }

  PVector getLoc() {
    return loc.get();
  }
}




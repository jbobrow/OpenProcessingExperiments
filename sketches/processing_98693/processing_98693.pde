
/* 
 Joan Soler-Adillon
 Realitat Virtual || Realidad Virtual - Processing
 Màster en Arts Digitals, UPF
 http://www.joan.cat/
*/

//Creamos un arrayList para guardar los objetos
ArrayList fs = new ArrayList();
ArrayList fs2 = new ArrayList();


void setup(){
  size(800,200);
}

void draw(){
  background(#949594);
  //para cada elemento del arrayList...
  for(int i=0;i<fs.size();i++){
    //extraemos el objeto que contiene
    follower b = (follower) fs.get(i);
    //y lo ejecutamos
    b.run();
  }
  
    for(int j=0;j<fs2.size();j++){
    //extraemos el objeto que contiene
    follower2 c = (follower2) fs2.get(j);
    //y lo ejecutamos
    c.run();
  }

}

//si clicamos...
void mousePressed(){
  //creamos un objeto nuevo
  follower b = new follower();  
  //y lo añadimos al arrayList
  fs.add(b);
  
  follower2 c = new follower2();  
  //y lo añadimos al arrayList
  fs2.add(c);
}

class follower{

  float  velocidad = random(1,45);
  PVector pos1 = new PVector(random(width),random(height));
  PVector pos2 = new PVector(random(width),random(height));
  float sz1 = int(random(5, 55));
  float sz2 = int(random(15, 85));
  color[] miscolores = {#E5FF40,#FFFFFF,#7D008E,#00E281};
  int colorBola = miscolores[(int)random(4)];
  float alfa = random(50,150);
  
  void run(){
    
    //dibujamos
    noStroke();
    fill(colorBola,alfa);
    ellipse(pos1.x,pos1.y,sz1,sz1);
    fill(colorBola,alfa);
    ellipse(pos2.x,pos2.y,sz2,sz2);
    actualizar();
    

}  

 //función para actualizar posiciones
  void actualizar(){
    //calculamos la distáncia entre el mouse y la bola en los 2 ejes
    PVector mouseVec = new PVector(mouseX,mouseY);
    PVector dis1 = PVector.sub(mouseVec, pos1);
    dis1.div(velocidad);
    pos1.add(dis1);

    PVector dis2 = PVector.sub(mouseVec, pos2);
    dis2.div(velocidad);
    pos2.add(dis2);
    
   

}

}
class follower2{

  float  velocidad = random(1,25);
  PVector pos1 = new PVector(random(width),random(height));
  PVector pos2 = new PVector(random(width),random(height));
  float sz1 = int(random(5, 15));
  float sz2 = int(random(10, 25));
  color[] miscolores = {#E5FF40,#FFFFFF,#7D008E,#00E281};
  int colorBola = miscolores[(int)random(4)];
  float alfa = random(50,150);
  
  void run(){
    
    //dibujamos
    noStroke();
    fill(colorBola,alfa);
    ellipse(pos1.x,pos1.y,sz1,sz1);
    fill(colorBola,alfa);
    ellipse(pos2.x,pos2.y,sz2,sz2);
    actualizar();
    

}  

 //función para actualizar posiciones
  void actualizar(){
    //calculamos la distáncia entre el mouse y la bola en los 2 ejes
    PVector mouseVec = new PVector(mouseX,mouseY);
    PVector dis1 = PVector.sub(mouseVec, pos1);
    dis1.div(velocidad);
    pos1.add(dis1);

    PVector dis2 = PVector.sub(mouseVec, pos2);
    dis2.div(velocidad);
    pos2.add(dis2);
    
   

}

}



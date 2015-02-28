

//generamos las cerdas que forman cada trazo
class Cerdas{
  //declaramos variables:
  int myStep;
  float mySz;
  PVector myPos;

//propiedades de cada cerda
  Cerdas (int _st){  
    
    myStep = _st;
    //tinta = random(0,255);
    //mySz = _sz;
    mySz = random(1,15);
    //mi posicion va a ir en relacion a la posicion del mouse
    myPos = new PVector(mouseX,mouseY); 
  }

  void run(){
    updatePosition();
    drawMe();  
  }

  void updatePosition(){
    //creamos un random para cada dirección:
   float randX = random(0,mouseX);
   float randY = random(0,mouseY);
   // float randX = random(0,mouseX/2);
   // float randY = random(0,mouseY/2);
    
    //en la X, si es mayor a 50, la tinta va para la derecha
    if(randX >= 50){
      //como pos es un VECTOR, lo hacemos con pos.x
      myPos.x += myStep;
    } // y si es menor, para la izquierda
    else {
      myPos.x -= myStep;
    }
    //y lo mismo para Y: si es mayor a 50, la tinta va para abajo
    if(randY >= 50){
      //como pos es un VECTOR, lo hacemos con pos.x
      myPos.y += myStep;
    } // y si es menor, para arriba
    else {
      myPos.y -= myStep;
    }
     //declaramos los limites de la tinta
    myPos.x = constrain(myPos.x,0,width);
    myPos.y = constrain(myPos.y,0,height);
  }

  void drawMe(){
    //preparamos color
    noStroke();
    fill(tinta,200,200,20);
    //dibujamos:
    ellipse(myPos.x,myPos.y,mySz,mySz);  
    //fill(0,250,100,20);
   fill(tinta,0,220,10);
   ellipse(myPos.x,myPos.y,mySz/2,mySz/2);
   fill(60,50,tinta,50);
   ellipse(myPos.x,myPos.y,1,1);      
  }
}


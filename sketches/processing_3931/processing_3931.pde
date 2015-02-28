
PImage ritoque;   
Pincel[] p;  //Arreglo de Pinceles
  float vertice = 10;

  float r;
void setup(){  
  ritoque = loadImage ("ritoque_futbol.jpg"); 
  size(ritoque.width, ritoque.height); 
 colorMode(HSB); 
  smooth(); 
 p = new Pincel[1000];   
 for(int i = 0; i < 500; i++){  
    p[i] = new Pincel();  
  }  
}  
 
void draw(){ 
    fill(0,-50);  
  rect(0,0,width, height);   
  for(int i = 0; i < 400; i++){ 
    p[i].pinta();  // inicialización del objeto y su variable.
  } 
  }  
  
  
  
  //Objeto Pincel
class Pincel{  
int x, y;  

  color col;  
  int edad, edadMax;  
   
   Pincel(){  
    x = round(random(width)); 
    y = round(random(height)); 
                      
    col = ritoque.get(x,y)+ 40;  
    edad = 10;  
    edadMax = 10; 
  } 
   
  void pinta(){  
    calc(); // función que calcula 
    // forma y características de mi pincel
    noStroke();  
   fill(ritoque.get(x,y),random (30,150));  
  pushMatrix();
    translate(x,y);
    rotate((noise(0.1)*millis()/290)); // la rotación es menos brusca gracias a la función noise.
      beginShape();
            bezier(50,45,r,2*r,50,r,50,45);
      //bezier(10,9,r,2*r,10,r,10,9);
      endShape();
    popMatrix();
  
  }
  
  //función que hace calculos que determinaran la dirección y vida del pincel.
  void calc(){  
    x += 8;  
    y += random (0.1,8.2); 
  
    x = x % width;  
    y = y % height;  
  
    if (x < 0) x *= -1;  
    if (y < 0) y *= -1;  
  
    edad ++;  
  
     if(edad >= edadMax) col =ritoque.get(x,y)*2;  // si el pincel llega a su vida máxima el color se intensifica
      
  }   
}




//Carlos Borràs
//P4_a
//Random walker que al clicar canvia posició i propietats.

Walker[] wkrs = new Walker[20]; 
void setup() {
  size(500, 500);

for (int i=0; i<wkrs.length;i++) {
    wkrs[i] = new Walker(3, 10);
  }
}

void draw() {
  background(0);
 
for (int i=0; i<wkrs.length;i++) {
    wkrs[i].run();
  }
}


//creació de la classe dels walkers

class Walker {
  //variables:
  int variable2, variable1; 
  float _x, _y;

 
  Walker (int v1, int PI) {
    variable1 = v1;
    variable2 = PI;
    _x = width/2;
    _y = height/2;
  }

  void run() {
    updatePosition();
    draw();
  }

  void updatePosition() {
    
    float randomX = random(100);
    float randomY = random(100);
   
    if (randomX >= 50) {
      _x += variable1;  
    }
    else {
      _x -= variable1;
    }
    
   
    if (randomY >= 50) {
      _y += variable1;
    } 
    else {
      _y -= variable1;
    }
    

    _x = constrain(_x, 0, width);
    _y = constrain(_y, 0, height);
  }

  void draw() {
  noStroke();
    
//DIBUIX
//PEU DRET
fill(179,216,68);
rect(_x+2.5,_y+5,7.5,20,25);

//PEU ESQUERRA
rect(_x-10,_y+5,7.5,20,25);

//COS
fill(100,_x,_y);
rect(_x-12.5,_y-12.5,25,25,0.25,0.25,5,5);

//BRAÇ ESQUERRA
rect(_x+13.75,_y-12.5,7.5,20,25);
//BRAÇ DRETA
rect(_x-21.25,_y-12.5,7.5,20,25);

//CARA
fill(179,216,68);
arc(_x,_y-13.75,25,25,variable2,2*variable2);

//ULL1

fill(0);
arc(_x+5,_y-20,2.5,2.5,variable2,4*variable2);
//ULL2
arc(_x-5,_y-20,2.5,2.5,variable2,4*variable2);  
  

  }
} 




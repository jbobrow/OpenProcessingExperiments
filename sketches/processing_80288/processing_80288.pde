
float y =10.0;
int u = 200;
float direccion = 2.0;
int direccion2 = 1;
boolean b;
float gravity = 0.1;
;

void setup() {

size (700, 300);


}


void draw (){




background (90, 90, 66);

for (int i=0; i < 500; i+=15) {
  for (int j=200; j<500; j+=10) {
    fill (30, 50, 10, 100);
    noStroke();
    ellipse (j, i, 3, 10);
  }
}

for (int k=-100; k<900; k+=100) {
  
fill (0, 30);
beginShape (TRIANGLE_FAN);
vertex (-100, 16);
vertex (k, 10);
vertex (350, y); 

endShape();
}
fill (30, 52, 2, 120);
rect (1, 84, 61, 695);
fill (0, 50);

y=y+direccion;

 stroke (0, 30);
strokeWeight (5);
rect (0, u, 630, 300);


if (y>=200 || y<= 10) {
   direccion = direccion *-1;
  b = true; 
}

if (b==true){   
    
  
u=u+1;

direccion =direccion +gravity;
if (y <100) {
 gravity = gravity*-0.95; 
}
}

}



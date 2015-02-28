
int x;
void setup() {
    size (800,600);
    background(140,255,255);
    smooth ();
    frameRate (25);
   x=0;
}
 void draw()  {
 background(140,255,255);
 if(x > 300){
   background(50,255,255);
 }
 
  x++;
  noStroke ();
  fill (255,255,59);
  ellipse (x,140,80,80);
  stroke(210);
 
 noStroke(); 
 fill (255);
 ellipse (160,60,115,50); // nuvem
 ellipse (260,60,115,50); // nuvem
 ellipse (210,70,105,50); //  nuvem
 ellipse (210,50,105,50); // nuvem

 ellipse (410,90,100,50); // nuvem
 ellipse (510,90,100,40); // nuvem
 ellipse (460,100,90,40); // nuvem
 ellipse (460,80,90,40); // nuvem
  
fill(200);
rect(0,300,800,20); // sacada
rect(300,320,10,250); // sacada
rect(500,320,10,250); // sacada
stroke(255);
fill(0,20);
rect(0,330,800,180); // vidro sacada
noStroke();
fill(150,100,50);
rect(0,520,800,80); // piso sacada
fill(200);
rect(0,520,800,20); // sacada

for (int i = 0; i < 600; i += 15) {
  stroke(100);   
  if (i < 380) {  
    stroke(80);   
  }
  line(i, 600, i+2, 540);
}

fill(200,220,200);
stroke(200,220,200);
rect(0,0,150,600); // parede
rect(0,0,800,50); // parede
rect(650,0,150,600); // parede

stroke(180);
fill(200); 
rect(125,25,550,25); // moldura da sacada
rect(125,50,25,550); // moldura da sacada
rect(650,50,25,550); // moldura da sacada

fill(0,40);
stroke(255);
rect(400,50,250,550); // vidro sacada
stroke(180);
fill(200);
rect(400,50,15,550); //moldura vidro
rect(635,50,15,550); //moldura vidro
rect(400,50,250,15); //moldura vidro

stroke(180);
fill(0,40);
rect(350,50,250,550); // vidro sacada
fill(200);
rect(350,50,15,550); //moldura vidro
rect(585,50,15,550); //moldura vidro
rect(350,50,250,15); //moldura vidro
 }

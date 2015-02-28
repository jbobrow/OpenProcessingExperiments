
int a;
//vectors de posicions i velocitats
float[] i = { random(100,500), random(100,500), random(100,500), random(100,500), random(100,500) };
float[] j = { random(100,500), random(100,500), random(100,500), random(100,500), random(100,500) };
float[] vi={8,-5.5,6.8,2,-2.5};
float[] vj={-3,4,7.5,-3.4,3.5};
void setup() {       //inicialitzacio
size(600, 600);
noStroke();
ellipseMode(CORNERS);
rectMode(CORNERS);

}

void draw() {

 
  for(int b=2*width;b>0;b=b-10){  //bucle per fer el fons del dibuix


  fill(3*b%255,5*b%255,4*b%255);
  pushMatrix();
  translate(width/2,height/2);
    ellipse(0,0,b,b);
    rotate(PI/2);
    ellipse(0,0,b,b);
    rotate(PI/2);
    ellipse(0,0,b,b);
    rotate(PI/2);
    ellipse(0,0,b,b);
   
    popMatrix();
   
  }
  
  

  for(a=0;a<5;a++){  //bucle per dibuixar les boles en moviment

if(i[a]<0||i[a]>width)    //condicionant perquè rebotin
  {
    vi[a]=-vi[a];
  }
 
if(j[a]<0||j[a]>height)
  {
    vj[a]=-vj[a];
  }
  bola(i[a],j[a]);
}

for(a=0;a<5;a++){  //increments de posicio
  i[a]=i[a]+vi[a];
  j[a]=j[a]+vj[a];


}
}

void bola(float x,float y){ //funcio que dibuixa cada bola
  int a=0;
int b=0;

int n=100;
fill(255,0,0);
ellipseMode(CORNERS);
  ellipse(x-(x/n)*18-23,y-(y/n)*18-23, x+(width-x)/n *18+23,y+(height-y)/n*18+23);

  for (int i=18; i>2; i--) {   //bucle que dibuixa els quadrats que fan efecte de profunditat al moure's
fill(255/18*i,0,0);

rect(x-(x/n)*i,y-(y/n)*i, x+(width-x)/n *i,y+(height-y)/n*i);
  }
  
}



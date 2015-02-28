
//Unknown, Incomprehensible, 
//whateíer you choose to call it, call; 
//But leave it vague as airy space, dark in its darkness 
//mystical
//Richard Francis Burton

//100 drunken lines

//Tande Campos, Belo Horizonte, setembro 2013



int[] px=new int[100];  //declare arrays
int[] py= new int[100];
color[] cor = new color[100];


void setup() {
  frameRate(10);
  size(900,450);
  background(0);

  for (int i = 0; i<100; i++) {  
    px[i]=width/2;
    py[i]=height/2;
    cor[i]= color(random(255), random(255), random(255),150);  
  }
  smooth();
}


void draw( ) {
  strokeWeight(.25);
  for (int i = 0; i<100; i++) {
    stroke(cor[i]);
    int npx, npy;
    npx = px[i] + 7*int(random(-3, 3));  // next point
    npy = py[i] + 7*int(random(-3, 3));  
    line(px[i], py[i], npx, npy);

    px[i]=npx;    
    py[i]=npy;
  }
}


void keyPressed() {
  if (key=='s') save("andador_"+int(random(50))+".png");
}

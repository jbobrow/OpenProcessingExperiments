
int num_pilotes = 30;

float [] posicionsX = new float[num_pilotes];
float [] posicionsY = new float[num_pilotes];
float [] velocitatsX = new float[num_pilotes];
float [] velocitatsY = new float[num_pilotes];
int [] sz = new int[num_pilotes];
color[] color_pilota = new int[num_pilotes];

void setup() {
  size(400, 400);

  noStroke();
  for (int i=0; i<num_pilotes; i++)
  {
    posicionsX[i] = width/2;
    posicionsY[i] = height/2;
    velocitatsX[i] = random(1, 5); 
    velocitatsY[i] = random(1, 5);
    sz[i]= int (random(20, 30)); 
    color_pilota[i] = color(int(random(0)), int(random(0, 200)), int(random(200, 255)));
  }
}

void draw() {
  background(0);

  for (int i=0; i < num_pilotes; i++)
  {
    modificar_pos(i);
    comprovar_lim(i);
    dibuixar_personatge(i);
  }
}

void modificar_pos(int _i)
{
  posicionsX[_i]  += velocitatsX[_i] ;
  posicionsY[_i]  += velocitatsY[_i] ;
}

void comprovar_lim(int _i)
{
  if ((posicionsX[_i] < sz[_i]/2)||(posicionsX[_i] > width-sz[_i]/2)) {
    velocitatsX[_i]  = -velocitatsX[_i] ;
  } 
  if ((posicionsY[_i] < sz[_i])||(posicionsY[_i] >height-sz[_i]/2)) {
    velocitatsY[_i]  = -velocitatsY[_i] ;
  }
}

void dibuixar_personatge(int _i)
{
  fill(255);
  stroke(0);
  strokeWeight(0.5);
  ellipse(posicionsX[_i]+15, posicionsY[_i], sz[_i], sz[_i]);
  ellipse(posicionsX[_i], posicionsY[_i], sz[_i], sz[_i]);


  fill(color_pilota[_i]);
  ellipse(posicionsX[_i]+5, posicionsY[_i], sz[_i]-15, sz[_i]-10);
  ellipse(posicionsX[_i]+20, posicionsY[_i], sz[_i]-15, sz[_i]-10);
}


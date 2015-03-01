
//Ana Molés Barrero

int numero_smile = 40; 
int estat;

float [] posicioX = new float [numero_smile]; // arrays de la posició x per cada smile (segons numero_smile)
float [] posicioY = new float [numero_smile]; // poso float i no int perquè vull usar Xs i Ys decimals, sinó saltaria només per punts enters
float [] velocitatX = new float [numero_smile];
float [] velocitatY = new float [numero_smile];
int [] sz = new int [numero_smile]; 


void setup() //poso valors dels arrays i li especifico informació com size
{
  size(800,600);
  
  for (int i=0; i < numero_smile; i++) //compta 50 smiles, perè dic menor de numero_smiles perque el i=50 seria el 51è smile
  { 
    posicioX[i] = width/2;
    posicioY[i] = height/2;
    velocitatX[i] = random(1,8); //cada smile tindrà una velocitat random diferent entre 1 i 8
    velocitatY[i] = random (1,8);
    sz [i] = 74;

    
  }
}


void draw()
{
  background(255);
  for (int i=0; i < numero_smile; i++) // i és cada  smile
  {
    moviment(i);
    limits(i);
    dibuix(i);
  }
}

void moviment(int _i)
{
  posicioX [_i] += velocitatX [_i];
  posicioY [_i] += velocitatY [_i];
}

void limits(int _i)
{
  if ((posicioX [_i] > width-sz[_i]/2) || (posicioX [_i] < sz[_i]/2)) //si el meu smile compleix una d'aquestes
      {
        velocitatX [_i] = -velocitatX[_i];
      }
  
  if ((posicioY [_i] > height-sz[_i]/2) || (posicioY [_i] < sz[_i]/2))
      {
        velocitatY [_i] = -velocitatY [_i];
      }
}
      
void dibuix(int _i)

{
  if (estat == 2)
  {
  fill(random(255),random(255),random(255));
  noStroke();
  ellipse(posicioX [_i] ,posicioY [_i],sz[_i],sz[_i]);
  fill(0);
  ellipse(posicioX [_i]-10,posicioY [_i]-8,6,15);
  ellipse(posicioX [_i]+10,posicioY [_i]-8,6,15);
  stroke(0);
  strokeWeight(3);
  noFill();
  arc(posicioX [_i], posicioY [_i]+5, 40, 32, 0, PI, OPEN);
  }

  else{
  fill(255,228,18);
  noStroke();
  ellipse(posicioX [_i] ,posicioY [_i],sz[_i],sz[_i]);
  fill(0);
  ellipse(posicioX [_i]-10,posicioY [_i]-8,6,15);
  ellipse(posicioX [_i]+10,posicioY [_i]-8,6,15);
  stroke(0);
  strokeWeight(3);
  noFill();
  arc(posicioX [_i], posicioY [_i]+5, 40, 32, 0, PI, OPEN);
  }
  
}

void keyPressed()
{
  if (key == 'a')  estat = 2; 
  else             estat = 1 ; 
}


// Black Flag Noise by David Brandau
// Thanks and shouts to Fabian Morón Zirfas for the help with randomSeed


int seed=0;

void setup ()
{
size(600, 170);
background (255);
noStroke ();
fill (0);

}

void draw ()
{
 
 noiseSeed(seed); 

println(seed);

background(255);
    
float v = 0;
for (int i=0; i < width; i += 28) {
  float n = 15 + noise (v) * 110;
  rect (i, n, 25, 70);
  v = v + 0.15;
}
 
}
void keyPressed ()
{
 
  if (key == ' ') {seed = (int)random(0,1000);
  }
}





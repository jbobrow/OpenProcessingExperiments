
class Goutte
{
  float age;          //dates framerate
  PVector pos;
  float vit;
  float tay;
  float duree;
  
  Goutte(float Age, PVector Pos, float Vit, float Tay, float Duree)
  {
    age = Age;
    pos = Pos;
    vit = Vit;
    tay = Tay;
    duree = Duree;
  }
  Goutte(PVector Pos)
  {
    this(0, Pos, random(20/frameR, 60/frameR), 0, random(1, 5));
    /*
    float Age = 0; //en s.
    float Vit = random(5/frameR, 15/frameR); //en pixels/frame      25frame - 1s     en 1s il gagne 25*...pixels
    float Tay = 0; 
    float Duree = random(1, 5); //en s. frameRate prop.
    
    this(Age, Pos, Vit, Tay, Duree);
    */
  }
  
  void dessine()
  {
    ellipseMode(CENTER);
    noFill();
    stroke(0, map(age, 0, duree, 255, 5));
    //stroke(0);
    
    ellipse(pos.x, pos.y, tay, tay);
    //println(age + ", " + duree);
  }
  
  void actu()
  {
    tay += vit;
    age += 1/frameR;
  }
}

float frameR = 25;
int freq;
ArrayList pluie;

void setup()
{
  size(600, 600);
  frameRate(frameR);
  smooth();
  pluie = new ArrayList();
  
  pluie.add(new Goutte(0, new PVector(400,400), 2, 0, 0.000001));
  freq = 50;
  background(200);
}

void draw()
{
  background(255);
  for (int i = 0; i < pluie.size(); i++)
  {
    ((Goutte)pluie.get(i)).actu();
    ((Goutte)pluie.get(i)).dessine();
    if (((Goutte)pluie.get(i)).age > ((Goutte)pluie.get(i)).duree) {pluie.remove(i);}
  }
  
  if (((int)random(0, 100) * frameR) < freq*frameR)   //50 (freq) de gouttes par seconde, soit une probabilité de 2 gouttes par s en moy OK!
  {
    pluie.add(new Goutte(new PVector((int)random(0, 600), (int)random(0, 600))));
  }
}

void mouseDragged()
{
  pluie.add(new Goutte(new PVector(mouseX, mouseY)));
}

void keyPressed()
{
  if (freq > 5)
  {
    if (keyCode == UP)   {freq += 5;}
    if (keyCode == DOWN) {freq -= 5;}
  }
  if (keyCode == ENTER) {saveFrame();}
}                                               

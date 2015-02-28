
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
int x, deplacementX;

void setup ()
{
  size(200,200);
  x=0;
  deplacementX=5;
  noStroke();
  fill(0,0,0,255);
}

void draw()
{
  if (x<200)
           
 {
  nettoyer();
  deplacer();
  dessiner();
  
  }

else { 
  x=0;
}
}

void nettoyer()
{
background(153,153,153);
}
void deplacer()
{
  x= x + deplacementX;
}

void dessiner()
{
  ellipse(x,100,50,50);
}


                
                

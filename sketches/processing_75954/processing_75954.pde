
int numPokes = 30;
Poke [] pokes = new Poke[numPokes];

void setup() {
 
  size(400, 400);
  background(255);
  for(int i = 0; i < pokes.length; i++)
  {
     pokes[i] = new Poke(); 
  }
  
}

void draw() {
  
  float mx = 300;
  float my = 300;
 

  smooth();
   //float interp = sin(frameCount / 60.);
  float randomness = map(mouseX, 0,width, 0,1);
  randomness = constrain(randomness, 0,1);
  //float interp = sin(frameCount / 60.);
  // float randomness=interp; 
  float interp=randomness;
   
  float A = 0.7;
  float B = 1.0-A;
  mx = A*mx + B*mouseX;
  my = A*my + B*mouseY;
   

   
 // fill(r,50+g,100+b);
 // fill(100*randomness,*randomness,200*randomness);
  //ellipse(mx+randomness*random(-100,100),my+randomness*random(-100,100),20/randomness,20/randomness);
   for(int i = 0; i < pokes.length; i++){
     pokes[i].display(randomness); 
  } 

  

  
}


class Poke {
   
  float xpos, ypos; // the base position
  float xoffset, yoffset;  // some vaue to add or subtact from the base position
  PImage im;
  
  Poke () {
    
      im = loadImage("poke-2.png");
      //xpos = random(width);
      xpos=mouseX;
      //ypos = random(height);
      ypos=mouseY;
      xoffset = random(width)*3;
      yoffset =  random(height)*3;
    
  }
  
  void display(float interp) // interp is some number between -1.0 and 1.0
  {
      float xtemp, ytemp;
      xtemp = xpos + interp * xoffset;  // we add or subtact some offset from the base position
      if(xtemp > width) xtemp = width - (xtemp - width); // if too high, bounce back
      if(xtemp < 0) xtemp = xtemp * -1;  // if too low, bouce back
      
      ytemp = ypos + interp * yoffset;  // we add or subtact some offset from the base position
      if(ytemp > height) ytemp = height - (ytemp - height); // if too high, bounce back
      if(ytemp < 0) ytemp = ytemp * -1;  // if too low, bouce back
      
      image(im, xtemp, ytemp);
  }
  
}


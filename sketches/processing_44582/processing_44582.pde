

float rot;
float skl;

float posX;
float ruidoX = .009;
float varX;
float posY;
float ruidoY = .0095;
float varY;

float aposX;
float aruidoX = .008;
float avarX;
float aposY;
float aruidoY = .0085;
float avarY;

float bposX;
float bruidoX = .007;
float bvarX;
float bposY;
float bruidoY = .0075;
float bvarY;

float cposX;
float cruidoX = .006;
float cvarX;
float cposY;
float cruidoY = .0065;
float cvarY;


// - - - -  - - -  -- - - - - - SETUP - - - - - - - - - - - -


void setup (){
  
  
 size (500,500);
 smooth();
 background (255);
 frameRate (40); 
 
}


// - - - - - - - - -  - - -DRAW - - - - - - - - - - - 


void draw (){
  
  translate (width/2,height/2);
  scale (skl%1);
  skl += 0.001;
  
  rotate (radians (rot%90));
  rot += 0.01;
  
posX = noise(varX)*width;
varX += ruidoX;
posY = noise (varY)*height;
varY += ruidoY;
aposX = noise(avarX)*width;
avarX += aruidoX;
aposY = noise (avarY)*height;
avarY += aruidoY;
bposX = noise(bvarX)*width;
bvarX += bruidoX;
bposY = noise (bvarY)*height;
bvarY += bruidoY;
cposX = noise(cvarX)*width;
cvarX += cruidoX;
cposY = noise (cvarY)*height;
cvarY += cruidoY;
  
  
fill (255,15);
stroke (0,0,0,100);
beginShape (QUADS);
vertex (posX,posY);
vertex (aposX, aposY);
vertex (bposX, bposY);
vertex (cposX, cposY);
endShape ();

fill (255,15);
stroke (0,0,0,100);
beginShape (QUADS);
vertex (-posX,-posY);
vertex (-aposX, -aposY);
vertex (-bposX, -bposY);
vertex (-cposX, -cposY);
endShape ();

fill (255,15);
stroke (0,0,0,100);
beginShape (QUADS);
vertex (-posX, posY);
vertex (-aposX, aposY);
vertex (-bposX, bposY);
vertex (-cposX, cposY);
endShape ();


fill (255,15);
stroke (0,0,0,100);
beginShape (QUADS);
vertex (posX, -posY);
vertex (aposX, -aposY);
vertex (bposX, -bposY);
vertex (cposX, -cposY);
endShape ();




  
}




  

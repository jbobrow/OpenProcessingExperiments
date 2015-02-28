
//hecho por ssbeltran


float rot;
float skl = 0.1;

// variables para Perlin
float posX;
float ruidoX = .0090;
float varX;
float posY;
float ruidoY = .00901;
float varY;

float aposX;
float aruidoX = .00902;
float avarX;
float aposY;
float aruidoY = .00903;
float avarY;

float bposX;
float bruidoX = .00904;
float bvarX;
float bposY;
float bruidoY = .00905;
float bvarY;

float cposX;
float cruidoX = .00906;
float cvarX;
float cposY;
float cruidoY = .00907;
float cvarY;

// variables para ellipse

float eposX;
float eruidoX = .0080;
float evarX;
float eposY;
float eruidoY = .00799;
float evarY;

float eaposX;
float earuidoX = .00798;
float eavarX;
float eaposY;
float earuidoY = .00797;
float eavarY;

float ebposX;
float ebruidoX = .00796;
float ebvarX;
float ebposY;
float ebruidoY = .00795;
float ebvarY;

float ecposX;
float ecruidoX = .00794;
float ecvarX;
float ecposY;
float ecruidoY = .00793;
float ecvarY;


// contador

float contador;

// - - - -  - - -  -- - - - - - SETUP - - - - - - - - - - - -


void setup (){
  
  
 size (800,800);
 smooth();
 background (255);
 frameRate (60); 
 
}


// - - - - - - - - -  - - -DRAW - - - - - - - - - - - 


void draw (){
  
  translate (width/2, height/2);
  scale (skl%0.5);
  skl += 0.001;
  rotate (radians(rot));
  rot += 0.2;
  
  // primero la curva blanca

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
stroke (0);
beginShape ();
curveVertex (posX,posY);
curveVertex (aposX, aposY);
curveVertex (bposX, bposY);
curveVertex (cposX, cposY);
endShape ();

// ahora la ellipse verde

eposX = noise(evarX)*width;
evarX += eruidoX;
eposY = noise (evarY)*height;
evarY += eruidoY;
eaposX = noise(eavarX)*width;
eavarX += earuidoX;
eaposY = noise (eavarY)*height;
eavarY += earuidoY;
ebposX = noise(ebvarX)*width;
ebvarX += ebruidoX;
ebposY = noise (ebvarY)*height;
ebvarY += ebruidoY;
ecposX = noise(ecvarX)*width;
ecvarX += ecruidoX;
ecposY = noise (ecvarY)*height;
ecvarY += ecruidoY;
  
  

fill (0,0,0,0);
stroke (180,255,0, contador%255);
ellipse (-eposX,-eaposX,-ebposX%20,-ecposX%20);


contador ++;



}



  


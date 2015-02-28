
float r; //rood
float g; //groen
float b; //blauw
float a; //is alfa, de transparantheid 
 
float diam; 
float x; 
float y; 
 
int value = 255; 

int zonhori =40;
int zonverti =40;
int zonh =40;
int zonb =40;

//help --reference
 
void setup() { 
  size(400,400); 
  background(0); 
  smooth(); 

   
} 
void draw() { 
   fill (value); 
   noStroke();
  
 //zonnetje
fill(255,255,0);
ellipse(zonhori,zonverti,zonh,zonb);

zonhori =zonhori+5;
zonverti =zonverti+1;
zonh =zonh+2;
zonb =zonb+1;

if (zonhori > 300) {zonhori=300;}
if (zonh > 120) {zonh = 120;}
if (zonb > 120) {zonb = 120;}
if (zonverti > 370) {zonverti = 370;}
  
  stroke(r,g,b,a); 
  strokeWeight(10); 
  line(pmouseX,pmouseY,mouseX,mouseY); 
  //hiermee teken je een lijn van punt naar punt. p=previus
  
  r = random(111,255); 
  g = random(111,255); 
  b = random(111,255); 
  a = random(111,255); 
  diam = random(20); 
  x = random(width); 
  y = random(height); 
  //ellipse confetti 
  //noStroke(); 
  //fill(r,g,b,a); 
  //ellipse(x,y,diam,diam); 
   
} 
void mousePressed() { 
  if (mouseButton == LEFT){ 
  background(255); 
} else if (mouseButton == RIGHT) { 
  rect(200,200,40,40); 
  
 
   
   
   //float is waar j iets in stopt. float l, dan kun je aan l een variabele geven. 
   //learningprocessing.org
   
 
   //bovenaan float step= waar hij begint. 
   //onder void draw 
   
   //step= step+1;
   // voor ander onderdelen step invullen met ander coorditnaten erbij.
   
   
   
   //if(x>100)
   //{speed = -1;
   //}
   //if(x>400|| x <8)
   //{ speed = speed * -1;
   //}
   
} 
} 




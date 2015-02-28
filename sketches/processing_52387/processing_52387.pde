
float r = 100.0;
float angle = 0.0;
float speed = 0.0001;


int time1= 2000;

PImage ad;
PImage vertical;
PImage dada;
PImage head;
PImage canada;
PImage english;
PImage ahem;

void setup() {
  size(600, 300);
  imageMode(CENTER);
  ad= loadImage("ad.jpg");
  dada = loadImage("dada.png");
  vertical= loadImage("vertical.png");
  head = loadImage("head.png");
 canada= loadImage ("canada.png");
 english = loadImage("english.png");
 ahem = loadImage ("ahem.png");
 
}
  
  
  void draw(){
    background(0);
   
   image(ad, 300,150); 
   
   pushMatrix();
   
   image(dada, 300, 200);
 
 
  popMatrix();
   
   image(vertical, 500,10);
   
   
   
   //scale( sin(0.0)+2);
   float q= random(height);
   rotate(q);
   image(head, 400,98);
  
  
  
    pushMatrix();
   
     float d= random(width);
    float f =random (height);
   
   rotate(angle/2);
 
   image(canada, d,f);
   
angle+=0.1;
   
   popMatrix();
   
   
   translate(300,150);
   
   image(english, 300, 400);
   
   
  
   
     image(ahem,100,50);
   
  
  angle+=speed;
   
   float sinval = sin(angle);
  float yoff = sinval /r;
  image(ahem, 200+yoff, 80);
 
 
  translate(width/2+100,height/2);
  scale(yoff/900.0  +  0.5);
  image(ahem,100,50);
  
  
  
  
  
  
    
    float x = random(width);
    float y = random(height);
    float z= random(width/3);
    float a = random(height/3);
    
    image(ad,x,y);
    image(dada,a,y);
    image(head,x,y);
    image(canada,z,y);
     image(ahem, x,y);
    image(english,z,a);
    image(vertical,x,y);
  }



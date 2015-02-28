
PImage g1;
PImage g2;
PImage g3;
PImage pine;
PImage honey;
PImage diatom;
PImage wing;
PImage wing2;
PImage circle;
PImage flowers;
PImage wing3;

PShape wingw;

float r;
float x,y;
float s;



void setup(){
  size(640,480);
  smooth();
  background(255);
  noLoop();
  //frameRate(.5);
  
 g1 = loadImage("gingko1.png");
 g2 = loadImage("gingko2.png");
 g3 = loadImage("gingko3.png");
 pine = loadImage("pine.png");
 honey = loadImage("honeycomb.png");
 diatom = loadImage("diatom.png");
 wing = loadImage("wing.png");
 circle =loadImage("circle.png");
 flowers = loadImage("flowers.png");
 wing3 = loadImage("wing3.png");
 
 wing2 = loadImage("wingwhite.png");
 //wingw = loadShape("wingwhite.svg");
}

void draw(){
  background(255);

//HONEYCOMB RANDOMNESS

  x= random(honey.width/2,width-(honey.width/2));
  y= random(honey.height/2,height-(honey.height/2));
  r = random(0,radians(360));
  s = random(0.5,1.1);
  
//Sm=ome cool random numbers

  float num=random(4);
  float num2=random(4);
  float num3=random(50);
  
//IMAGES RANDOM // g = gingko / p = pine / c = circle / ci = diatom

  float sg1 = random(0.5,1);
  float sg2 = random(0.5,0.75);
  float rg2 =random(0,radians(360));
  float rg3 =random(0,radians(360));
//

  float sp =random(.35,.75);
  float rp =random(0,radians(360));

// 
  
 float sc = random(.3,1);
 float xc = random(honey.width/2,width-(honey.width/2));
 float yc = random(honey.height/2,height-(honey.height/2));
 
 //
 
 float dci = random(150,350);
 float xci = random(diatom.width/2,width-(diatom.width/2));
 float yci = random(diatom.height/2,height-(diatom.height/2));
 
 //flowers randomness
 
 float scf = random(.3,1);
 float xcf = random(0,640);
 float ycf = random(0,480);
 
// wing
 float sw = random (.1,.5);
 float rw =random(0,radians(360));
 

  
  //GINGKO 3
  
  pushMatrix();
  translate(x,y);
  rotate(rg3);
  scale(sg2);
  image(g3,0,0);
  popMatrix();
  
  //GINGKO 2
  
   pushMatrix();
  translate(x,y);
  rotate(rg2);
  scale(sg2);
  image(g2,-20,-20);
  popMatrix();
  
    //GINGKO 1
   pushMatrix();
  translate(x,y);
  rotate(r);
  scale(sg1);
  image(g1,-20,-20);
  
  if (num2 <=2){
    scale(sg1/2);
 rotate(radians(50));
   image(g2,50,0);  }
  popMatrix();
  

 
 //INSECT WING
  pushMatrix();
translate(x,y);
scale(sw);
rotate(rw);
tint(255,150);
image(wing3,0,0);
  popMatrix();



noTint();
  //PINECONE RANDOM
     pushMatrix();
  if (num <=2){
    translate(x,y);
    rotate(rp);
    scale(sp);
    image(pine,0,0);
  }
  
    popMatrix();
    
//PINECONE
     pushMatrix();
    translate(x,y);
    rotate(r);
    scale(sp);
    image(pine, 0,0);
    popMatrix();

//HONEYCOMB
  
  pushMatrix();
  translate(x,y);
  
  scale(s);
  image(honey,-honey.width/2,-honey.height/2);
  popMatrix();
  
  
  
//DIATOM

  pushMatrix();

//image(diatom,0,0);
blend(diatom, 0, 0, diatom.width, diatom.height, 
      (int) xci,(int)yci, (int)(s*diatom.width), (int)(diatom.height*s), OVERLAY);
  popMatrix();
 
//YELLOW CIRCLE
  pushMatrix();

 blend(circle,0,0,circle.width,circle.height,
     (int) xc,(int)yc,(int)(sc*circle.width),(int)(circle.height*sc),MULTIPLY);
   
     popMatrix();
  
  //FLOWERS
  pushMatrix();

 blend(flowers,0,0,circle.width,circle.height,
     (int) xcf,(int)ycf,(int)(scf*circle.width),(int)(circle.height*scf),BURN);
   
     popMatrix();


}


void mousePressed() { 
  redraw(); 
} 



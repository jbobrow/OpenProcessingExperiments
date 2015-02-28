
//city_origami_logo_looping

float x = 80;

float y = 77;


float angle = 0.0;



void setup(){
 
  size (500,500);
  smooth();
  //noLoop();
  
}

void draw(){
  background(255);
  
  for (int i = 35; i<width +40; i +=40){
    int gray = int(random(0,102));
    
    float scalar = random(0.15, 1.0);
    
     
     
    
    city_origami(i, 110, gray, scalar);
  }
}



void city_origami (int x, int y, int g, float s){
   
  
  pushMatrix();
  translate (x,y);
  scale(s);
  fill(g);//set gray
  
  fill (200);//medium grey quads
  quad(179, 243, 208, 258, 208, 290, 153, 260); //quad 1
  quad(180+x, 244+y, 208+x, 260+y, 208+x, 292+y, 153+x, 260+y); //quad 2
  
 
  
  fill(220); //light grey quads
  noStroke();
  quad(206, 133, 261, 165, 208, 196, 152, 165); //quad 1
  quad(206+ x, 133 + y, 261 + x, 165 + y, 208 + x, 196 + y, 153 + x, 165 + y); //quad 2
  
  
  
  fill(150);//dark grey quads
  quad(152, 165, 180, 180, 180, 244, 152, 260); //quad 1
  
   quad(208, 196, 261, 165, 261, 196, 208, 227); //quad 2
  
 
   
  quad(208, 257, 233, 242, 235, 275, 208, 291); //quad 3
  quad(153 +x, 165 +y, 180 +x, 180 +y, 180 +x, 244 +y, 152+x, 260 +y); //quad 4
  quad(208+x, 196+y, 261+x, 165+y, 261+x, 197+y+62, 208+x, 227+y+62); //quad 5
  
  popMatrix();

  }


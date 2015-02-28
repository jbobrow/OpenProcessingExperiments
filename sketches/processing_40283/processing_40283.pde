

//integers

int keyX = 100;
int keyY = 700;
int holeX = 700; 
int holeY = 100;
int redkeyX=401;
int redkeyY=401;
int bluekeyX=402;
int bluekeyY=402;
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;

//setup

void setup(){
  size (800,800);
  noCursor();
  rectMode(CENTER);
  smooth();
  a = loadImage("holeblack.png");
  b = loadImage("key.png");
  c = loadImage("grab.png");
  d = loadImage("grabbing.png");
  e = loadImage("holered.png");
  f = loadImage("keyred.png");
  g = loadImage("keyblue.png");
  h = loadImage("holeblue.png");
}


//draw loop

void draw(){
  background(200);
   rectMode(CORNER);
        stroke(100,60,20);
        fill(188,137,89);
        rect (0,0,20,800);
        rect (0,0,800,20);
        rect (780,0,20,800);
        rect (20,780,800,20);
        
  image (b, keyX,keyY);
  image (a, holeX,holeY);
  //if (mousePressed ==false){
  //image (c, mouseX-8, mouseY-8);
  //}
  //if (mousePressed ==true){
  //image(d, mouseX-8,mouseY-8);
  //}
 
  
  if (mousePressed == true && dist(mouseX,mouseY,keyX,keyY)<20){
    keyX=mouseX-10;
    keyY=mouseY-10;
  }
  
  //the moment the key touches the black keyhole...
  if (dist(keyX, keyY, holeX, holeY)<15){
    for (int holeX = 0; holeX < width; holeX = holeX+50) {
      for (int holeY = 0; holeY < height; holeY = holeY+50) {
        image (e, holeX,holeY);
        image (b, 700,100);
        image (a, 700,100);
        //noStroke();
        //fill(150);
      }
    }
        //composition adjustment
        rectMode(CORNER);
        stroke(100,60,20);
        fill(188,137,89);
        rect (0,0,20,800);
        rect (0,0,800,20);
        rect (780,0,20,800);
        rect (20,780,800,20);
        fill(50);
        noStroke();
        rect(20,20,15,760);
        rect(20,20,760,15);
        stroke(255,255,0);
        point(240,640);
        point(240,690);
        point(240,640);
        point(230,650);
        point(220,680);
        point(210,640);
        point(220,580);
        point(210,567);
        point(215,560);
        point(214,590);
        point(190,570);
        point(194,580);
        point(197,591);
        
        //redkey arrives on table...
        noStroke();
        fill(113,71,31);
        quad(408,373,443,408,408,443,373,408);
        image (f, redkeyX, redkeyY);
        
        
        
  
  
        //grabbing red key
        if (mousePressed == true && dist(mouseX,mouseY,redkeyX,redkeyY)<20){
          redkeyX=mouseX-10;
          redkeyY=mouseY-10;
        }
          
        //blue key appears
        
       if (dist(redkeyX, redkeyY, 200,600)<15){
         image(g, bluekeyX,bluekeyY);
         redkeyX=200;
         redkeyY=600;
         image(h, 400,400);
          }
          
          //grabbing blue key
        if (mousePressed == true && dist(mouseX,mouseY,bluekeyX,bluekeyY)<20){
          bluekeyX=mouseX-10;
          bluekeyY=mouseY-10;
        }
        //having trouble with last keyhole, why does this affect the first?
        if (dist(bluekeyX, bluekeyY, 403,403)<15){
          //fill(255,255,0);
          //rect(0,0,800,800);
        }
  }
            //repeat hand functions so that they are on top, probably a cleaner way to do this...
        if (mousePressed ==false){
          image (c, mouseX-8, mouseY-8);
  }
  if (mousePressed ==true){
    image(d, mouseX-8,mouseY-8);
  }
          
         
  }
    
        




 

  
  





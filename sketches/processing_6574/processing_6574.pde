
int numDots = 1000; 
int[][]screenInfo;


MovingDots[]dots = new MovingDots[numDots]; 

MovingDots2[]middleDots = new MovingDots2[numDots/2]; 

int currentDot= 0; 
PFont font, font2;

void setup(){ 
  size (750,125,P3D); 
  smooth();
  screenInfo = new int[width][1];
  for(int i = 0; i < width; i++){ 
    screenInfo[i][0] = 50;
  }

  for (int i = 0; i< numDots; i++){ 
    dots[i] = new MovingDots(); 
  } 
  for (int i = 0; i< numDots/2; i++){ 
    middleDots[i] = new MovingDots2(); 
  } 
  font2 = loadFont("ScriptS_IV25-30.vlw");
  font = loadFont("SegoeScript-70.vlw");
} 

void draw(){ 
  background(10); 

  for (int i = 0; i< currentDot; i++){ 
    dots[i].display(); 

  } 
  for (int i = 0; i< currentDot/2; i++){ 
    middleDots[i].display();

  } 


  if(currentDot< numDots-1){ 
    currentDot++; 
  } 

  pushMatrix();
  pushStyle();
  fill(255);
  translate(200,100,20);
  textFont(font,50);
  text("Schumanator",0,0);
  
  textFont(font2);
  text("t h e",-60,-25);
  
  popStyle();
  popMatrix();


} 

void mousePressed(){ 

  
} 

class MovingDots{ 
  int age = 0;
  float y; 
  int x =  int (random(width)); 
  int z = int (random(-50,100));
  float xnoise =1; 
  boolean alive = true;


  void display(){ 
    if(age > 500){
      y = 0;
      age = 0;
    }
    age++;
    if(alive == true){
      if(y > height - 30){
        alive = false;
      }
      x*=xnoise; 
      y+=random(-0.05,1.5); 
      fill(255,100); 
      noStroke();
    }
    pushMatrix();
    translate(x,y,z);
    ellipse(0,0,3,3); 
    popMatrix();
  } 
} 

class MovingDots2{ 
  int age = 0;
  float y; 
  int x =  int (random(width)); 
  int z = int (random(-50,100));
  float xnoise =1; 
  boolean alive = true;


  void display(){ 
    age++;
    //    if(y > screenInfo[x][0] - 3){
    //      screenInfo[x][0]-= 3;
    //      alive = false;
    //      println(screenInfo[x][0]);
    //    }
    if(age > 200){
      y = 0;
      age = 0;
    }
    x*=xnoise; 
    y+=random(-0.05,1.5); 
    fill(255,100); 
    noStroke();

    pushMatrix();
    translate(x,y,z);
    ellipse(0,0,3,3); 
    popMatrix();
  } 
} 









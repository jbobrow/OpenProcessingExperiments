
int anzahl =10;
int anzahl2 = 11;
Stein[][] typ1 = new Stein[anzahl2][anzahl];
int obj_x = 100; 
int obj_y = 0;
int obj_z = 100;
int kante = 30;

void setup() 
{ 
  size(600, 400, P3D); 
  colorMode(RGB, 1); 
  for(int j=0; j<anzahl2; j++){
    for(int i= 0; i<anzahl; i++){
      typ1[j][i] = new Stein((int)random(kante, 3*kante), (int)random(20, kante*2), (int)random(kante, 3*kante));
    }
  }
  fill(0.9);
} 
 
void draw() 
{ 
  
  pushMatrix();
  background(0.3);

  pointLight(0.8, 1, 1, 0,0,1000);


  rotateY(0.7);
  camera((mouseX*4-width), (3*mouseY-2*height), (height*1.5), (width), (height/2.0), 0, 0, 1, 0);
  boden();
  for(int j =0; j<anzahl2; j++){
    obj_x = 100+ 100*j;
    obj_y=0;
    obj_z= 100+ (j*200)%300;
    typ1[j][0].display(obj_x, obj_y,obj_z);
    for(int i =1; i< anzahl;){
      if(typ1[j][i-1].unten){
        obj_y += typ1[j][i-1].hoch; 
        typ1[j][i].display(obj_x, obj_y, obj_z);
        i++;
      }
      else break;
    }
  }
  //noLoop();
  popMatrix();
} 

class Stein{
  int  lang, breit, hoch, y, v;
  color d;
  float rot;
  boolean unten;
  Stein(int a, int b, int c){
     lang = a;
     hoch = b;
     breit = c;
     y= -300;
     reset();
  }
  
  void display(int x, int bla, int z){
   
    pushMatrix();
    translate(x, y, z);
    rotateY(rot);
    fill(d);
    box(lang,hoch,breit); 
    popMatrix();
    if(y<(height-hoch/2-bla)){
      y=y+v;
    }else{
      y=(int)(height-hoch/2-bla);
      unten= true;
    }
    
  }
  void dimensions(int a, int b, int c){
     lang = a;
     breit = b;
     hoch = c;
  }
  void reset(){
    y=-300;
    unten=false;
    rot= random (0.8);
    d = color(random(1), random(1), random(1));
    v= (int)random(4,6);
  }
}

void boden(){
  pushMatrix();
  translate(0,height, -200);
  rotateX(PI/2);
  noStroke();
  fill(0.5);
  rect(0, 0, 2*width, 3*height);
  popMatrix();
}
void mousePressed(){
 for(int j=0; j<anzahl2; j++){
   for(int i=0; i<anzahl; i++){
   typ1[j][i].dimensions((int)random(kante, 3*kante), (int)random(20, kante*2), (int)random(kante, 3*kante));  
   typ1[j][i].reset();
   }
 }
}


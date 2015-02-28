
//kyle murphy 
//math art and programming, spring 2012. taught by nick lally at CCA
//''old guys'', programming sketch, 2012



import processing.opengl.*;
Recto[] rectos;
Recty[] rectys;
Recta[] rectas;
float inc = 0;
float inca = 0;
float incb = 0;


void setup(){
  size(1000,1000,OPENGL);
  //smooth();
  //frameRate(7);
  rectos = new Recto[66];
  for(int i = 0; i < rectos.length; i++){
     rectos[i] = new Recto(i,i,i); 
     inc += .01;
  }
  rectys = new Recty[666];
  for(int j = 0; j < rectys.length; j++){
    rectys[j] = new Recty(noise(inca)*width,noise(inca)*height,noise(inca)*width);
    inca += .001;
  }
  rectas = new Recta[66];
  for(int k = 0; k < rectas.length; k ++){
     rectas[k] = new Recta(k,k,k);
     incb +=.01;
  }   
}

void draw(){
  background(25);
  //lights();
  //directionalLight(66,66,66,1500,0,-400);
  directionalLight(196,196,196,0,-1,0);
  pushMatrix();
    translate(500,350,0);
    rotateY(map(millis()/60,0,width,0,PI*2));
    rotateX(map(millis()/60,0,height,0,PI*2)); 
     for(int i = 0; i < rectos.length; i++){
  rectos[i].move();
  rectos[i].display();
  }
    for(int j = 0; j < rectys.length; j++){
      rectys[j].move();
      rectys[j].display();
  }
    for(int k = 0; k < rectas.length; k++){
      rectas[k].move();
      rectas[k].display();
    }
    
  popMatrix();


  
}

class Recto {
  float x,y,z,angle,dangle;  //dangle variable is no longer relevent, I just like the way it sounds
  //float q = 0.0;
  Recto(float _x,float _y, float _z){
    x = _x;
    y = _y;
    z = _z;
    //angle = map(sin(dangle),-1,1,1,666); 
    //angle = map(second(),0,60,13,666);  //couldnt get this or previous line of code to generate non random angle returns
    //angle = random(13-166);  //this is the random angle return i was using for most of the testingof the code.
    //q = q + .01;
    //float r = noise(q); //166;
   // angle = map(r,0,1,13,166);  //still only one r.
    //angle = r*166;  //does this need to be when i call the array? nl- yes it does. and now i will try.
    angle = noise(inc)*166;  //then lally did a noise demo and I used noise. cool!
    //angle = map(dangle,0,166,-66,166);
  }

  void move(){
    //q += q + .01;
    x = sin(radians(angle/11.13));  //11.13 would be a variable affected by minim in a world where I understood and used libraries other then rudimentary opengl
    y = cos(radians(angle/11.13));
    z = tan(radians(angle/11.13));
  }
  void display(){
    noStroke();
    fill(255,254,242);
    float q = 0.0;
    pushMatrix();
      //translate(x,500,y);
      rotateY(z);
      rotateX(z);
      box(150);
    popMatrix();
   // q = q + .01;
    //float r = noise(q); //166;
    //angle = map(r,0,1,13,166);
    angle++;  //have this affected by minim
    
    
  }
}

class Recty {
  float x,y,z,angle;
  Recty(float _x,float _y, float _z){
    x = _x;
    y = _y;
    z = _z;
    angle = noise(inca)*360;
  }

  void move(){
    x = cos(radians(angle/1.5)) * noise(inca)*100 + width/2; //multiplier and divider affected by minim
    y = sin(radians(angle/1.5)) * noise(inca)*100 + height/2;
    z = cos(radians(angle/1.5)) * noise(inca)*100; //+ width/2; 
  }
  void display(){
    pushMatrix();
      translate(x,500,y);
      rotateY(z);
      rotateX(z);
      box(500);
    popMatrix();
    noStroke();
    angle++;
  }
}

class Recta {
  float x,y,z,wangle,donkeydick;
  Recta (float _x, float _y, float _z){
    x = _x;
    y = _y;
    z = _z;
    wangle = noise(incb)*360; 
  }
  
  void move(){
    x = cos(radians(wangle)) / 2;
    y = cos(radians(wangle)) / 2;
    z = cos(radians(wangle)); //* 20;
  }
  void display(){
    pushMatrix();
      translate(x,500,y);
      rotateY(z+666*millis());
      rotateX(z+666*millis());
      box(26);
    popMatrix();
    noStroke();
    //wangle +=2;
    //dangle = 180;
    //dangle += donkeydick;// + 150;  //donkeydick gives strength and robust vigor to pace of program in secret
    //donkeydick ++;
  }
}



 
Spaceship s;
Target t;
City [] city;
int citysize = 15;
int citysize2 = 40;
int cityspace = 100;
int terminate = 300;
int click, laserindex;
int ls = 8;
int aliens = 4;
Laser[] lasers;
Abductor[] ab;
float[] alientimer;

float targetx,targety;

void setup(){
  size(960, 540, P3D); 
  background(0);
 
  
  
  s = new Spaceship();
  t = new Target();
  city = new City[citysize];
  for(int i =0;i <citysize;i++){
    city[i] = new City(terminate + i*(-(cityspace+20)),i);
  }
  lasers = new Laser[ls];
  laserindex = 0;
  click = 0;
  
  ab = new Abductor[aliens];
  alientimer = new float[aliens];
  for(int i = 0;i < aliens;i++){
    alientimer[i] = random(300);
  }
  
  

}

  
 

void draw(){
 background(0);
 for(int i = 0;i < aliens;i++){
   if(alientimer[i]>0){
   alientimer[i]--;
   if(alientimer[i]>0&&alientimer[i]<=1 ){
     ab[i] = new Abductor(i);
   }
   }
 }
 if(mousePressed){
 if(click == 0){
     lasers[laserindex] = new Laser(s.x,s.y,targetx,targety);
     laserindex++;
     if(laserindex >= ls){
       laserindex = 0;
     }
     click = 15;
   }
 }
 
 pushMatrix();

  fill(60);
   beginShape();
   
   int ye = height-40;
   vertex(-1000,ye,terminate);
   vertex(-1000,ye,-1700);
   vertex(2000,ye,-1700);
   vertex(2000,ye,terminate);
    endShape(CLOSE);
    popMatrix();
  t.update();
  s.update();
   for(int i =0;i <citysize;i++){
    city[i].update();
  }
  
  if(click > 0){
    click--;
  }
  for(int i =0;i< ls;i++){
    if(lasers[i]!=null){
      lasers[i].update();
    }
  }
  for(int i = 0; i < aliens;i++){
    if(ab[i]!= null){
  ab[i].update();
    }
  }
}

class Laser{
  int timer;
  float sx, sy, tx, ty, x, y;
  Laser(float startx, float starty, float targetx, float targety){
    sx = startx;
    sy = starty;
    tx = targetx;
    ty = targety;
    timer = 0;
    x = 0;
    y = 0;
  }
  void update(){
    render();
  }
  
  void render(){
    if(timer < 80){
        pushMatrix();
        translate(sx,sy,0);
        float anglex = -atan2(500,sx-tx)-radians(270);
        float angley = atan2(500,sy-ty)-radians(90);
        rotateX (angley);
        rotateY (anglex);
        translate(0,0,-timer*20);
        x = modelX(0,0,0);  
        y = modelY(0,0,0);
        fill(0,255,0);
        box(10);
        timer++;
        popMatrix();
 }
    
  }
}

class City {
  int z, inde;
  float[] xs, ys, zs;
  City (int start,int index){
    z = start;
    inde = index;
    xs = new float[citysize2];
    ys = new float[citysize2];
    zs = new float[citysize2];
    for(int i = 0;i < citysize2; i++){
      xs[i] = random(10,cityspace);
      ys[i] = random(10,50);
      zs[i] = random(10,cityspace);
    }
  }
  
  void update(){
    z+= 2;
    if(z > terminate){
      city[inde] = new City(citysize*(-(cityspace+20))+terminate,inde);
    }
    render();
  }
  
  void render(){
    noStroke();
    pushMatrix();
    int fillnum = 255 - (terminate-z)*255/(terminate+citysize*(cityspace+20) + 20);
    if(fillnum >255){
      fillnum = 255;
    }
    fill((fillnum));
    translate(-1000,height-50,z); 
    for(int i = 0; i <  citysize2; i++){
      box(xs[i],ys[i],zs[i]);
      translate(xs[i]+20,0,0);
    }
    popMatrix();
  }
  
}

class Target{
  float x,y;

  
  Target(){
    x=width/2;
    y=width/2;
  }
  
  void update(){
    x = mouseX;
    y = mouseY;
    targetx = screenX(x,y,248);
    targety = screenY(x,y,248);
    render();
  }
  
  void render(){
    pushMatrix();
    fill(255,255,0);
    translate(targetx,targety,-500);
    box(30);
    popMatrix();
  }
}

class Abductor{
  
  float rot, x ,y,z; 
  float ty, vx, ax;
  int hp, inde;
  int splode;
  Abductor(int index){
    rot = 0;
    inde = index;
    x = random(width);

    y = -1000;
    vx = random(-10,10);
    z = -1600+random(30);
    ty = random(100,height-200);
    vx += ax;
    splode = 0;
    hp = 3;
  }
  
  void update(){
    if(splode <= 0){
    rot+=1;
    z+=6;
    x+= vx;
    if(x < 0 || x > width){
      vx = -vx;
    }
    if(y< ty){
      y += 12;
    }
    }
    for(int i = 0; i < ls;i++){
      if(lasers[i] != null && sqrt(sq(lasers[i].x-x)+sq(lasers[i].y-y))<35){
        hp--;
        lasers[i] = null;
        if(hp <= 0){
          splode = 1;
        }
      }
    }
     if(z >= 500){
       ab[inde] = new Abductor(inde);
       
     }
    render();
  }
  
  void render(){
    if(z < 500 && splode == 0){
     noStroke();
    fill(255,0,0);
    pushMatrix();
    translate(x,y,z);
    beginShape();
    for(int i = 0; i < 6;i++){
      vertex(cos(i*PI/3)*50, 0, sin(i*PI/3)*50);
    }
    rotateY(radians(rot));
    endShape(CLOSE);
    for(int i = 0; i < 6;i++){
      beginShape();
      vertex(cos(i*PI/3)*50, 0, sin(i*PI/3)*50);
      vertex(cos((i+1)*PI/3)*50, 0, sin((i+1)*PI/3)*50);
      vertex(0,-30,0);
      endShape(CLOSE);
    }
    rotateY(-2*radians(rot));
    
    fill(30,255,150);
    translate(0,10,0);
    beginShape();
     for(int i = 0; i < 6;i++){
      vertex(cos(i*PI/3)*80, 0, sin(i*PI/3)*80);
    }
    endShape();
    
     for(int i = 0; i < 6;i++){
      beginShape();
      vertex(cos(i*PI/3)*80, 0, sin(i*PI/3)*80);
      vertex(cos((i+1)*PI/3)*80, 0, sin((i+1)*PI/3)*80);
      vertex(0,-20,0);
      endShape(CLOSE);
    }
    
     for(int i = 0; i < 6;i++){
      beginShape();
      vertex(cos(i*PI/3)*50, 30, sin(i*PI/3)*50);
      vertex(cos(i*PI/3)*50, -30, sin(i*PI/3)*50);
      vertex(cos(i*PI/3)*60, 0, sin(i*PI/3)*60);
     
      endShape(CLOSE);
    }
    popMatrix();
    } 
   if(splode > 0 && splode < 20){
     pushMatrix();
     translate(x,y,z);
     for(int i = 0; i < 12;i++){
          beginShape();
          fill(random(256),0,0);
          vertex(random(-50,50), random(-50,50), random(-50,50));
          vertex(random(-50,50), random(-50,50), random(-50,50));
          vertex(random(-50,50), random(-50,50), random(-50,50));
          endShape(CLOSE);
     }
     splode++;
     popMatrix();
     if(splode >= 20){
       z = 500;
     }
    
   } 
  }
}

class Spaceship{
  int x, y; //position
  float anglex, angley, anglez; //angle rotated
  
  Spaceship(){
    x= width/2;
    y= height/2;
    anglex = 0;
    angley = 0;
  }
  
  void update() {
    
    anglex = -atan2(500,x-targetx)-radians(270);
    angley = atan2(500,y-targety)-radians(90);
    if((abs(targetx-x)>3||abs(targety-y)>3)){
      x+= cos(atan2(targety-y,targetx-x))*5;
      if(!( sin(atan2(targety-y,targetx-x)) > 0 && y > height - 150)){
        y+= sin(atan2(targety-y,targetx-x))*5;
      }
    }
    anglez = radians(targetx-x)/8;
    

    render();
    
  }
  
  void render() {
    
    lights();
    noStroke();
    pushMatrix();
    translate(x,y); 
    rotateY(anglex);
    rotateX(angley);
    rotateZ(anglez);
 
    
    fill(255,255,255); 
   
    
    
    beginShape();
    vertex(20,20,0);
    vertex(-20,20,0);
    vertex(0,20,-80);
    endShape(CLOSE);
    
    //////////////
 //cockpit to upper wing
   beginShape();
    vertex(0,0,0);
     vertex(20,0,-10);
   vertex(30,10,-20);
    endShape(CLOSE);
    
    //cockpit to front cockpit
   beginShape();
        vertex(0,10,-50);
     vertex(20,0,-10);
   vertex(30,10,-20);
    endShape(CLOSE);
    
     //side to lowerwing
   beginShape();
        vertex(0,10,-50);
     vertex(20,20,0);
   vertex(30,10,-20);
    endShape(CLOSE);
    
       //side to nose
   beginShape();
        vertex(0,10,-50);
     vertex(20,20,0);
   vertex(0,20,-80);
    endShape(CLOSE);
    
//lower wing
     beginShape();
    vertex(20,20,0);
    vertex(60,40,20);
    vertex(30,10,-20);
    endShape(CLOSE);
    
//link to booster
     beginShape();
    vertex(0,0,0);
    vertex(20,20,0);
    vertex(30,10,-20);
    endShape(CLOSE);
    
    //upperwing
     beginShape();
    vertex(0,0,0);
    vertex(60,-10,20);
    vertex(30,10,-20);
    endShape(CLOSE);
    
    ///////
    
    
      beginShape();
    vertex(0,0,0);
    vertex(-20,20,0);
    vertex(-30,10,-20);
    endShape(CLOSE);
    
    beginShape();
    vertex(-20,20,0);
    vertex(-60,40,20);
    vertex(-30,10,-20);
    endShape(CLOSE);
    
      beginShape();
    vertex(0,0,0);
    vertex(-60,-10,20);
    vertex(-30,10,-20);
    endShape(CLOSE);
    
      beginShape();
        vertex(0,10,-50);
     vertex(-20,0,-10);
   vertex(-30,10,-20);
    endShape(CLOSE);
    
     //side to lowerwing
   beginShape();
        vertex(0,10,-50);
     vertex(-20,20,0);
   vertex(-30,10,-20);
    endShape(CLOSE);
    
       //side to nose
   beginShape();
        vertex(0,10,-50);
     vertex(-20,20,0);
   vertex(0,20,-80);
    endShape(CLOSE);
    
    fill(255,0,0);
    
    //shape1
    beginShape();
    vertex(0,0,0);
    vertex(20,20,0);
    vertex(-20,20,0);
    endShape(CLOSE);
    
    fill(0,255,255);
    //back cockpit
     beginShape();
    vertex(0,0,0);
    vertex(0,-5,-20);
    vertex(20,0,-10);
    endShape(CLOSE);
      //front cockpit
   beginShape();
    vertex(0,10,-50);
    vertex(0,-5,-20);
    vertex(20,0,-10);
    endShape(CLOSE);
    
    /////
    
      beginShape();
    vertex(0,0,0);
    vertex(0,-5,-20);
    vertex(-20,0,-10);
    endShape(CLOSE);
      
   beginShape();
    vertex(0,10,-50);
    vertex(0,-5,-20);
    vertex(-20,0,-10);
    endShape(CLOSE);
    
   
    
    
    
   
    popMatrix();
    
  }
  
}




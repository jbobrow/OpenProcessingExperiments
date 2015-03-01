
Fish[] salmon = new Fish[7];

void setup(){
  //size of sketch, initial bgcolor
  size(800,800);
  background(75,170,215);
  
  for(int i = 0; i < salmon.length; i++){
  salmon[i] = new Fish(random(width),random(height),25,100); 
  }

    
}

void draw(){
  //draw background
  background(75,170,215);

 // for(float j = 0; j <= height; j+=10){
 //   float k = map(j,height,0,.25,1);
 //   stroke(75*k,170*k,215*k);
 //   strokeWeight(11);
 //   line(0,j,width,j);
 // }

 
   for(int i = 0; i < salmon.length; i++){
  salmon[i].update(mouseX,mouseY);  //math
  salmon[i].display();  //visual
   }
  
  
  
  
}




class Fish{
  
  int fishSize;
  float tRot;
  float ftRot; 
  float finPos = 0;
  float ffinPos = 0;
  int strokeTime = 9999;
  int swimming = 0;
  float speed;
  
  float tailSpeed = 1;
  
  float shade;
  
  float xx;
  float yy;
  float fxx;
  float fyy;
  
  int dirX = 1;
  float angler = 0;
  float fangler = 0;
  
  int counter = 0;
  
  int ranStop;
  
  Fish(float x, float y, float s1, float s2){
  xx = x;
  yy = y;
  fxx = xx;
  fyy = yy;
  shade = random(.5,1.5);
  fishSize = int(random(s1,s2));
  speed = map(fishSize,25,100,.005,.01);
  ranStop = int(random(25,200));
  }
  
  void update(float x, float y){
    
    if(mousePressed){
      xx = mouseX;
      yy = mouseY;
    }else{
  counter++;
  
  if(counter >= ranStop){
    xx = random(width);
    yy = random(height);
    ranStop = int(random(100,500));
    counter = 0;
  }
    }
  
     tailSpeed = map(abs(xx-fxx),0,width,.01,.25);  
  //  println(tailSpeed);
    
   if(abs(xx-fxx)>fishSize){
   swimming = 1;
  }else{
   swimming = 0;
  }
  
  fxx += (xx - fxx) * speed;
  fyy += (yy - fyy) * speed/4;
  
  fangler += (angler - fangler) * .1;
  
  if(fxx < xx){
    if(dirX == 1){
      fangler = 0;
    }
    
    dirX = -1;
    angler = map(yy-fyy,0,height,0,60);
  }
  if(fxx > xx){
    if(dirX == -1){
      fangler = 0;
    }
    
    dirX = 1;
    angler = map(yy-fyy,0,height,0,-60);
  }
  
  }
  
  void display(){
    fish(fxx,fyy,fishSize,dirX,fangler,swimming,shade);
  }
  
  void fish(float x,float y,float w,int d,float r,int sw,float c){
//x = x pos
//y = y pos
//w = width
//d = direction
//r = rotation
//sw = swimming on/off
//c = color    

if(swimming == 1){
    strokeTime++;
     if(strokeTime >= 5){
       tRot = 35;
     }
     if(strokeTime >= 10){
       tRot = -35;
       strokeTime = 0;
     }
     finPos = 45;
     
}else{
  tRot = 0;
  finPos = -15;
}

ftRot += (tRot - ftRot) * tailSpeed;

ffinPos += (finPos - ffinPos) * .1;

  
  pushMatrix();
  translate(x,y); 
  rotate(radians(r)); 
  fill(0);
  stroke(0);
  strokeWeight(7);
  fishBody(0,0,w);
  fishTail(0+(w/2.1),0,w,ftRot, d);
  fishFin(0-(w/5),0,w,ffinPos, 1, d);
  fishFin(0-(w/5),0,w,ffinPos, -1, d);
  fishFin(0+(w/15),0-(w/13),w*.9,ffinPos, -1, d);
  noStroke();
  fill(230,160*c,200);
  fishBody(0,0,w);   
  fishTail(0+(w/2.1),0,w,ftRot, d); 
  fishFin(0-(w/5),0,w,ffinPos, 1, d);
  fishFin(0-(w/5),0,w,ffinPos, -1, d);
  fishFin(0+(w/15),0-(w/13),w*.9,ffinPos, -1, d);
  fill(0);
  ellipse((0-w/3)*d,0-w/40,w/9,w/9);
  fill(255);
  ellipse((0-w/3)*d,0-w/40,w/45,w/45);
  popMatrix();
     
   
     
   
}

void fishBody(float x, float y, float w){
  
  pushMatrix();
   translate(x,y);  
   arc(0,0,w,w/2,radians(0),radians(180));
   arc(0,1,w,w/3,radians(180),radians(360));
  popMatrix();
  
}

void fishTail(float x, float y, float w, float r, float d){
  
  float size = w/8;
  
  pushMatrix(); 
  scale(d,1);  
  translate(x,y+(size/5));
  rotate(radians(r)); 
  beginShape();
  vertex(0,0);
  vertex(size/2,-size);
  vertex(size,-size*1.5);  
  vertex(size*2,-size*2);
  vertex(size*2,-size*1.5);
  vertex(size*1.75,-size);
  vertex(size,0);
  vertex(size*1.75,size);
  vertex(size*2,size*1.5);
  vertex(size*2,size*2);
  vertex(size,size*1.5);
  vertex(size/2,size);
  vertex(0,0);
  endShape(); 
  popMatrix();
  
}

void fishFin(float x, float y, float w, float r, int s, int d){
  
  float size = w/5;
  
  pushMatrix();  
  scale(d,1);
  translate(x,y+(size/5)); 
  scale(1,s);
  rotate(radians(r/4)); 
  beginShape();
  vertex(0,0);
  vertex(size/2,-size);
  vertex(size,-size*1.5);  
  vertex(size*2,-size*2);
  vertex(size*2,-size*1.5);
  vertex(size*1.75,-size);
  vertex(0,0);
  endShape(); 
  popMatrix();
  
} 
  
}


/**
Coded by Kof @ 
Tue Sep 17 20:18:51 CEST 2013



   ,dPYb,                  ,dPYb,
   IP'`Yb                  IP'`Yb
   I8  8I                  I8  8I
   I8  8bgg,               I8  8'
   I8 dP" "8    ,ggggg,    I8 dP
   I8d8bggP"   dP"  "Y8ggg I8dP
   I8P' "Yb,  i8'    ,8I   I8P
  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
  88P      Y8P"Y8888P"    PI8"8888
                           I8 `8,
                           I8  `8,
                           I8   8I
                           I8   8I
                           I8, ,8'
                            "Y8P'
                            

*/

/////////////////////////////////////////////////////

// BACKGROUND COLORS
color C1 = color(0,12,35);
color C2 = color(12,12,25);
color C3 = color(13,13,25);
color C4 = color(11,1,25);

// CREATURE BEHAVIOUR
float FREQUENCY_X = 20.0;
float AMPLITUDE_X = 80.0;

float FREQUENCY_Y = 40.0;
float AMPLITUDE_Y = 25.0;

// CREATURE SHAPE
int LENGTH = 150;
float DENSITY = 32.0;
float RADIUS = 100.0;
float FOLLOW_SPEED = 1.5;
float DIVERSITY = 15.0;

// POSTPRODUCTION
float SHAKE = 2.5;

PImage logo;
ArrayList dustFrames;
PGraphics frame;

Creature creature;
ArrayList plankton;

/////////////////////////////////////////////////////

void setup(){
  size(512,384,P2D);

  creature = new Creature(LENGTH);
  plankton = new ArrayList();
  
  
  
  logo = loadImage("ng.png");

  noSmooth();

  mouseX=width/2;
  mouseY=height/2;
  background(0);

  generateDustFramesToPlasureAnEye(9,5000,150);

  generateMask();
}

/////////////////////////////////////////////////////

void drawMask(){
  image(frame,-20+random(-2,2),-20+random(-2,2));
}

/////////////////////////////////////////////////////

void generateMask(){

  frame = createGraphics(width+20,height+20,JAVA2D);
  frame.beginDraw();
  frame.stroke(0,125);
  frame.strokeWeight(10);
  frame.noFill();
  frame.rect(10,10,frame.width-10,frame.height-10);
  frame.filter(BLUR,30);
  frame.endDraw();
}

/////////////////////////////////////////////////////

void generateDustFramesToPlasureAnEye(int num,int dens,int al){
  dustFrames = new ArrayList();

  for(int i = 0 ; i < num;i++){
    dustFrames.add(createGraphics(width,height,JAVA2D));
  }

  for(int i = 0 ; i < dustFrames.size();i++){
    PGraphics tmp = (PGraphics)dustFrames.get(i);
    tmp.beginDraw();
    tmp.stroke(0,al);
    for(int ii = 0; ii < dens;ii++)
      tmp.point(random(width),random(height));
    tmp.endDraw();
  }
}

/////////////////////////////////////////////////////

void renderDustFrameToPlasureAnEye(){
  PGraphics tmp = (PGraphics)dustFrames.get(frameCount%dustFrames.size());
  image(tmp,random(-5,5),random(-5,5));

}

/////////////////////////////////////////////////////

void draw(){
  
  pushMatrix();
  translate((noise(frameCount,0)-0.5)*SHAKE,(noise(0,frameCount)-0.5)*SHAKE);

  creature.generate();
  creature.follow();
  creature.draw();

  FREQUENCY_X = 20.0-(cos(frameCount/100.0)+1.0)*3.0;
  AMPLITUDE_X = 80.0+(cos(frameCount/100.0)+1.0)*70.0;

  //drawPlankton();

  fade(C1,5.9);
  fade(C2,-5.14);
  
  renderDustFrameToPlasureAnEye();
  drawMask();
  
  popMatrix();
  image(logo,0,0);
  
}

void drawPlankton(){
 
  for(int i = 0 ; i < plankton.size();i++){
   Plankton p = (Plankton)plankton.get(i);
   p.draw(); 
  }
 
 if(frameCount%10==0)
  plankton.add(new Plankton()); 
}

/////////////////////////////////////////////////////

void fade(color c, float speed){
  noStroke();

  pushMatrix();

  translate(width/2,height/2);
  rotate(frameCount*speed);
  scale(1.8);
  translate(-width/2,-height/2);


  beginShape();

  fill(c,247/2);
  vertex(0,0);
  fill(c,247/2);
  vertex(width,0);

  fill(c,120/2);
  vertex(width,height);
  fill(c,120/2);
  vertex(0,height);

  endShape(CLOSE);

  popMatrix();


}


// unfinished
class Plankton{
  PVector pos;
  
  Plankton(){
    if(mouseY > height/2)
       pos = new PVector(random(width),height+40); 
       else
       pos = new PVector(random(width),-40);
  }
  
  void draw(){
    fill(255,12);
    rect(pos.x,pos.y,30,30);
    
    PVector p = (PVector)creature.pos.get(creature.pos.size()-1);
    pos.x += (p.x-pos.x)/10.0;
    pos.y += (p.y-pos.y)/10.0;
  }
  
}

/////////////////////////////////////////////////////

class Creature{
  ArrayList layers;
  ArrayList points;
  ArrayList pos;

  int num;

  Creature(int _num){

    num = _num;
    pos = new ArrayList();
    for(int i = 0 ; i < num;i++){
      pos.add(new PVector(width/2,height/2));

    }
    generate();
  }

  void generate(){


    layers = new ArrayList();

    for(int i = 0 ; i < num;i++){
      points = new ArrayList();

      for(float f = 0 ; f < TWO_PI ; f += TWO_PI / DENSITY){
        float r = ((sin(i/(num/5.0)*PI-frameCount/10.0)+1.5)/2.0)*RADIUS*map(i,0,num,0,1)*map(i,0,num,1,0)*4.0;
        points.add(new PVector(
              cos(f)*r*noise(i/DIVERSITY,f,(frameCount+i/DIVERSITY)/100.0),
              sin(f)*r*noise(i/DIVERSITY,f,(frameCount+i/DIVERSITY)/100.0)
              )
            );
      }
      layers.add(points);
    }
  }

  void follow(){

    for(int i = 1 ; i < pos.size();i++){
      PVector current = (PVector)pos.get(i);
      PVector previous = (PVector)pos.get(i-1);

      current.x += (previous.x - current.x) / FOLLOW_SPEED;
      current.y += (previous.y - current.y) / FOLLOW_SPEED;
      current.y += norm(current.y,height,0);
      current.x += norm(current.x,0,width)-0.5;
    }

    PVector first = (PVector)pos.get(0);
    first.x += ((mouseX+cos(frameCount/FREQUENCY_X)*AMPLITUDE_X)-first.x)/(FOLLOW_SPEED*20.0);
    first.y += ((mouseY+sin(frameCount/FREQUENCY_Y)*AMPLITUDE_Y)-first.y)/(FOLLOW_SPEED*20.0);
  }

  void draw(){
    for(int i = layers.size()-1; i >= 0;i--){
      ArrayList pnts = (ArrayList)layers.get(i);
      PVector p = (PVector)pos.get(i);

      pushMatrix();
      translate(p.x,p.y);
      rotate(PI);

      PVector a = new PVector(0,0);
      PVector b = new PVector(0,0);
      color c = color(0);

      beginShape();
      for(int ii = 0 ; ii < pnts.size()-1;ii++){
        PVector tmp = (PVector)pnts.get(ii);

        fill(lerpColor(color(#010203),color(0),map(i,0,layers.size(),0,1)));


        if( ii == pnts.size()/2){
          a = new PVector(tmp.x,tmp.y);
        }

        if( ii == 0){
          b = new PVector(tmp.x,tmp.y);
        }

        stroke(lerpColor(color(0),color(#746F4B),0.5*(sin(atan2(tmp.y,tmp.x))+1.0)*map(i,0,layers.size(),1.0,0.2) ));
        vertex(tmp.x,tmp.y);
      }
      endShape(CLOSE);  

      if(i%10==0){
        noStroke();
        fill(0,1);


        translate(a.x,a.y);
        rect(0,0,b.x-a.x,-600);
        beginShape();
        endShape(CLOSE);
        
      }
      popMatrix();

    }
  }
}


// ... there are other worlds, they wish to speak to you ))


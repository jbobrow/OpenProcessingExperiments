
//import processing.pdf.*;

ArrayList particles = new ArrayList();

boolean addNew = false;

float spawnAngle = PI/2;

void setup(){

  background(255);
  size(800,600);

  smooth();
  noStroke();
  fill(0);
  colorMode(HSB);
  //strokeWeight(1);

}


void draw(){
  
  spawnAngle = constrain(spawnAngle,PI/4,PI/2);
  
  for( int g = 0; g<1; g++){

    for(int i=particles.size()-1; i>=0; i--){
      Particle p = (Particle)particles.get(i);
      if(p.done == false){
        p.update();
      }
      else{
        particles.remove(i);
      }
    }

  }



  println(particles.size());

}

void keyPressed(){
  switch(key){
  case 'c':

    background(255); 
    break;
  //case 's':
    //saveFrame("Crystals####.png");
    //break;
  }
  switch(keyCode){
    case UP:
      spawnAngle += PI/180;
      break;
    case DOWN:
      spawnAngle -= PI/180;
      break;
  }

}

void mousePressed(){

  //for(int y=0; y<10; y++){
  float u=mouseX;//random(width);
  float v=mouseY;//random(height);
  for(int i =0; i<1; i+=1){
    particles.add(new Particle(u,v ,random(TWO_PI)));//radians(ang)));
  }
  //}



}


class Particle {

  float x,y,xv,yv, x2,y2;
  float a;// = random(PI);
  boolean done = false;
  float timer = 0, stopTime = random(30);
  int sproutCount = 0;
  color lines = color( random(255), 255,255);

  Particle(float x, float y, float a){
    this.x = this.x2 = x;
    this.y = this.y2 = y;
    this.a = a;
  }

  void update(){


    //this.a += .01*(round(random(1))*2-1);//random(-PI/5,PI/5); 

    this.xv = 1*cos(this.a);
    this.yv = 1*sin(this.a);

    if(this.timer > this.stopTime){
      for(int h=0; h<(random(10,10)); h++){
        particles.add( new Particle( this.x, this.y, this.a + spawnAngle*(round(random(1))*2-1) ));
        this.sproutCount++;  
      }
      //if(this.sproutCount>5){
      //  this.done = true;
      //}

      this.timer=0;
      this.stopTime=random(200);

    }
    else{

      this.timer++;
    }

    if(!done){
      this.x+=this.xv;
      this.y+=this.yv;
    }

    //float br = brightness( get(int(x+xv), int(y+yv)) );

    float minColor = 16;
    int hereX = round(this.x + this.xv);//constrain(  int(this.x+this.xv*0 + (this.y+this.yv*0)*width), 0, (width-1)*(height-1)  );
    int hereY = round(this.y + this.yv);
    if( red(get(hereX,hereY))<minColor || green(get(hereX,hereY))<minColor || blue(get(hereX,hereY))<minColor ){
      this.done = true;
    }


   
    //stroke(0);//random(128,255));
    //point(this.x,this.y);//,this.x-this.xv,this.y-this.yv);/,this.x2,this.y2);//,this.x+this.xv,this.y+this.yv);   
   
    rect(this.x,this.y,1.9,1.9);//

    //line( this.x2, this.y2, this.x, this.y);


  }

}










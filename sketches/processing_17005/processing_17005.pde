
bidule[] bidules;
float[] interesting={0,0};

void setup(){
  size(500,500);
  bidules = new bidule[0];
  for(int a=0;a<500;a++){
    new bidule();
  }
  smooth();
  fill(0,100);noStroke();
  background(255);
  colorMode(HSB, 100,100,100,100);
}

void draw(){
  fill(100,30);
  rect(0,0,width,height);
  for(int a=0;a<bidules.length;a++){
    bidules[a].dessine();
  }
}

class bidule{
  float x, y, an, v;boolean loner=false;
  int sens=1;float c=random(100);
  bidule asuivre;
  bidule(){
    x=random(width);y=random(height);
    an = random(TWO_PI);v=random(0.3,1.2);
    bidules = (bidule[]) append(bidules, this);
  }
  void dessine(){
    c+=0.1;c%=100;
    fill(c,100,100,40);
    sens=-sens;
    an+=random(-0.02, 0.5)*sens;
     if(dist(interesting[0],interesting[1],x,y)<60 && random(3)<1){
         an = PI+atan2(interesting[1]-y, interesting[0]-x); 
      }
    
    x+=cos(an)*v;y+=sin(an)*v;
    if(random(100)<1 || asuivre==null){
      asuivre = bidules[floor(random(bidules.length))];
      loner=false;
    }
    if(random(100)<1){loner=true;}
    if(!loner){
    float an2 = atan2(asuivre.y-y, asuivre.x-x);
    an=(an+an2)/2;
    }  
    if(v>1.2)v*=0.97;
    if(x<0){x=0;an+=random(-0.2,0.9);}
    if(y<0){y=0;an+=random(-0.2,0.9);}
    if(x>width){x=width;an+=random(-0.2,0.9);}
    if(y>height){y=height;an+=random(-0.2,0.9);}
    
    for(int a=0;a<bidules.length;a++){
    bidule b= bidules[a];
    if(b!=this){
      float d=dist(b.x,b.y,x,y);
      if(d<6){
        x=b.x+((x-b.x)/d)*6;
        y=b.y+((y-b.y)/d)*6;
        an=an-PI+random(-0.4,0.4);
        b.an+=random(-0.2,0.2);
        v=random(2,2.5);
      }
    }
    
  }
    ellipse(x,y,4,4);
  }
}

void mouseMoved(){
  interesting[0]=mouseX;interesting[1]=mouseY;
} 


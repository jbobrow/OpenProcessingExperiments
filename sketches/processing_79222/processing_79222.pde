
float x, y, angle, c;
variateur v1,v2;

void setup(){
  size(500,500);
  x = 250;y = 250;
  angle = random(TWO_PI); smooth(); 
  noFill();stroke(0,51);
  colorMode(HSB);c=random(255);
  background(0);  v1=new variateur(1,6, 79); v2=new variateur(1,6, 79);
  
}

void draw(){ 
  c+=random(0.1,0.5);
  if(c>255){c-=255;}
  stroke(c,200,255, 51);
  angle+=random(-0.1,0.1);
  x=constrain(x+cos(angle)*1.5, 0, width);
  y=constrain(y+sin(angle)*1.5, 0, height);
  if((random(100)<2)||x==0||y==0||x==width||y==height){
    angle+=random(-1,1);
  }
  float t1 = v1.avance();
  float t2 = v2.avance();
  float an = atan2(y-height/2, x-width/2);
  float p1x=width/2+(x-width/2)*0.3, p1y=height/2+(y-height/2)*0.3,p2x=width/2+(x-width/2)*0.6 , p2y=height/2+(y-height/2)*0.6;
  beginShape();
  curveVertex(width/2, height/2);
  curveVertex(width/2, height/2);
  curveVertex(p1x+cos(an+PI/2)*t1,p1y+sin(an+PI/2)*t1);
  curveVertex(p2x+cos(an-PI/2)*t2,p2y+sin(an-PI/2)*t2);
  curveVertex(x, y);
  curveVertex(x, y);
  
  endShape();
}

class variateur{
  float etat, mini, maxi, pas, ecart,v;
  variateur(float _min, float _max, float _pas){
    ecart=(_max-_min)/2;
    mini=_min+ecart;
    etat = random(-1,1);
    v=random(0.01,0.02);
  }
  float avance(){
    etat+=v;
    return (mini+cos(etat)*ecart);
  }
}

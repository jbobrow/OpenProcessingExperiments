
class object {
  float x, y, s, opacity, speed, direction;
  float r,g,b;
  boolean shot;
  object(float xpos, float ypos, float SIZE, float opa, boolean SHOT, float R, float G, float B) {
    x=xpos;
    y=ypos;
    opacity=opa;
    s=SIZE;
    speed=3;
    direction=1;
    shot=SHOT;
    r=R;
    g=G;
    b=B;
  }//setup end

  void update() {
noStroke();
fill(r,g,b,opacity);
    ellipse(x, y, s, s);
    if(shot==false){
    x+=speed*direction;
    if(x>width-s/2){
     direction*=-1;
     y+=s*1.5;
    }
    if(x<0-s/2){
     direction*=-1;
     y+=s*1.5;
    }
    }
if(bulletX>x-s/2 && bulletX<x+s/2 && bulletY<y+s/2 && bulletY>y-s/2) shot=true;
if(shot==true){
if(s<800) s+=random(10,30);
opacity-=.5;
if(s>800){
x=-400;
y=-400;
}
}

  }//update end
}//class end



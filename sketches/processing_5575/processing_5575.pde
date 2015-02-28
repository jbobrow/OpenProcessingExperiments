
tier jaeger;
tier beute;


float xtempoj;
float ytempoj;
float xtempob;
float ytempob;
void setup() {
  size (600,600);
  xtempoj=4+random(-2,2);
  ytempoj=4+random(-2,2);
  xtempob=random(-2,2);
  ytempob=random(-2,2);
  beute=new tier(false,random(580),random(580),xtempob,ytempob);
  jaeger=new tier(true,random(580),random(580),xtempoj,ytempoj);
}

void draw() {


  fill(0);

  jaeger.move();

  jaeger.display();
  beute.move();
  beute.display();


}
class tier{
  boolean jagen;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float farbe;

  tier(boolean tjagen,float txpos,float typos,float txspeed, float tyspeed){
    jagen=tjagen;
    xpos=txpos;
    ypos=typos;
    xspeed=txspeed;
    yspeed=tyspeed;
    farbe=20*(abs(xspeed)+abs(yspeed));
  }
  void display(){
    stroke(0);
    fill(100+5*xspeed+ypos/5,farbe+xpos/5,100+5*yspeed);
    ellipse(xpos,ypos,20,20);

  }
  void move(){
    xpos=xpos+xspeed;
    ypos=ypos+yspeed;

    if(xpos<10){
      xpos=10;
      xspeed=-xspeed;
    }
    if(xpos>width-10){
      xpos=width-10;
      xspeed=-xspeed;
    }
    if (ypos<10){
      ypos=10;
      yspeed=-yspeed;
    }
    if (ypos>height-10){
      ypos=height-10;
      yspeed=-yspeed;
    }
    if(abs(xspeed)>4||abs(yspeed)>4){ 
      xspeed=xspeed/(1+0.001*abs(xspeed));
      yspeed=yspeed/(1+0.001*abs(yspeed));
      // println(xspeed);
    }
    if(abs(xspeed)>6||abs(yspeed)>6){ 
      xspeed=xspeed*0.5;
      yspeed=yspeed*0.5;
      // println(xspeed);
    }

    if(jagen=true){
      xspeed=xspeed+  0.001*(beute.xpos-xpos)/(5+abs(beute.xpos-xpos))*(5+abs(beute.xpos-xpos));
      yspeed=yspeed+  0.001*(beute.ypos-ypos)/(5+abs(beute.ypos-ypos))*(5+abs(beute.ypos-ypos));
    }

  }
}



















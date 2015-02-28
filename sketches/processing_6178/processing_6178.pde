
class Kreise {//----------------------------------klassendef
  int x, y ,r;
  boolean start;

  Kreise(int zeilex,int spaltey,int radius,boolean start_) {//
    int x=zeilex;
    int y=spaltey;
    int r=radius;
    boolean start=start_;
   

  }

  void update() {//--------------------------------kreise.update

      if(r>5*height||r>5*width){
      start=false;
    }

    if(start==true){
      r=r+1;
      if(count<(num-1)){
        if((r==x)){//reflection at the right border - starting a new wave-object with new center(-x,y)=(-r,y) and the same radius
          
          count=count+1;
          kreise[count].start=true;
          kreise[count].x=-r;
          kreise[count].y=y;
          kreise[count].r=r;
        

        }
        if(r==width-x){//reflection at the left border
          count=count+1;
          kreise[count].start=true;
          kreise[count].x=width+r;
          kreise[count].y=y;
          kreise[count].r=r;
         

        }
        if((r==y)){//reflection at the top border
          count=count+1;
          kreise[count].start=true;
          kreise[count].x=x;
          kreise[count].y=-r;
          kreise[count].r=r;
        

        }
        if((r==height-y) ){//reflection at the bottom border
          count=count+1;
          kreise[count].start=true;
          kreise[count].x=x;
          kreise[count].y=height+r;// not height + y, because this fits for all waves with different centers
          kreise[count].r=r;
        

        }
      }
    }
  }


  void zeichne() {//------------------------------zeichne 
    if(start==true){
    
       stroke(120+10*constrain(2-r*0.003,0,1),   120,    220-80*constrain(r*0.0005,0,1));// 
        ellipse(x,y,r,r);
   
    }
  }
}

int num=800;//-----------------globale variablen
int count=0;
Kreise[] kreise;

void setup() //---------------------------------------------------setup
{
  size(400, 400);
  colorMode(HSB);
  background(120,120,140);
 
  stroke(120,120,140);
  strokeWeight(2);
  ellipseMode(RADIUS);
  noFill();
  smooth();
  kreise = new Kreise[num];
  for (int i = 0; i < num; i++) {
    kreise[i] = new Kreise(0,0,0,false);
  }
}


void draw() //---------------------------------------------draw
{
  background(120,120,140);
 
  for (int i = 0; i < num; i++) {
    kreise[i].update();
    kreise[i].zeichne();

  }
}
void mouseReleased(){//-------------------------------mouseReleased
  if(count<num-5){// we only start a new wave by mouseclick,  if there is free space for 4 reflections
  //otherwise restart
    count=count+1;
    kreise[count].x=mouseX;
    kreise[count].y=mouseY;
    kreise[count].r=2;
    kreise[count].start=true;
  }
  else{
    reset();
  }
}

void reset(){//--------------------------------------reset
  for (int i = 0; i < num; i++) {

    kreise[i].x=0;              
    kreise[i].y=0;
    kreise[i].r=0;
    kreise[i].start=false;
     }
  count=0;
}


















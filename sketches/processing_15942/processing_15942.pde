
Drawlet d;
int diamcount = 0;
void setup() {
  size(250, 250);
  background(0);
  noStroke();
  smooth();
  ellipseMode(CENTER);
  d = new Drawlet();
}

void draw() {
    if (mousePressed){
        diamcount++;
    }else{
        d.display();
    }
}
void mouseReleased(){
 d.here(mouseX,mouseY,round(diamcount/3));
 diamcount = 0;
}

class Drawlet{
    float x = 0;
    float y = 0;
    int diam = 3;
    color c;
    boolean hasStarted = false;
    Drawlet(){
    }
    void display(){
        if(hasStarted){
            fill(c);
            ellipse(x,y,diam,diam);
            x += random(2*diam)-diam;
            y += random(2*diam)-diam;
        }
    }
    void here(float _x,float _y,int _diam){
        c = color(100 + random(55),100 + random(55),100 + random(55));
        x = _x;
        y = _y;
        diam = _diam;
        hasStarted = true;
    }
}

                
                                                


Sun s;
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);
  ellipseMode(CENTER);
  smooth();
  noStroke();
  s = new Sun(width, height);
}

void draw() {
fill(255,1);
rect(0,0,width,height);
s.display();
}

class Sun{
        float planetAmount = 20;
        float x;
        float y;
        Planet[] pArray = new Planet[planetAmount];
        Sun(float width, float height){
            x = width/2;
            y = height/2;
            for (int i = 0; i < pArray.length; i++){ 
                pArray[i] = new Planet(10,((i+1)*10), 1);
            }
        }
        void display(){
            fill(150);
            ellipse(x,y,10,10);
            for (int i = 0; i < pArray.length; i++){ 
                pArray[i].display(x,y);
            }
        }
        
}

class Planet{
        float x;
        float y;
        float size;
        float rad;
        float speed;
        float startAngle = ceil(random(360));
        color C = color(random(100) + 50,random(100) + 50, random(100) + 50);
        float angle = ceil(random(360));
        Planet(_size, _rad, _speed){
            size = _size;
            rad = _rad;
            speed = _speed;
        }
        void display(float sunX, float sunY){
            fill(C);
            ellipse(x,y,size,size);
            float radian = angle * (PI / 180);
            x = sunX + rad * cos(radian);
            y = sunY + rad * sin(radian);
            angle %= 360;
            if (angle == startAngle){
                C = color(random(100)+150, random(100)+150, random(100)+150);
            }
            angle += speed;
        }
        
}

                
                                                                                                

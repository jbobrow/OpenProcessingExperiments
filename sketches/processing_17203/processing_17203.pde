
Sun s;
color C = color(0);
void setup() {
  size(920,600);
  background(255);
  ellipseMode(CENTER);
  smooth();
  noStroke();
  s = new Sun(width, height);
}

void draw() {
  fill(C);
  rect(0,0,width,height);
  s.display();
}
void mousePressed(){
  C = color(50,225);
}
void mouseReleased(){
  C = color(0);
}

class Moon{
    float x;
    float y;
    float size;
    float rad;
    float speed;
    color C = color(255);
    float angle = ceil(random(360));
    Moon(float _size, float _rad, float _speed){
        size = _size;
        rad = _rad;
        speed = _speed;
    }
    void display(float planetX, float planetY){
        fill(C);
        ellipse(x,y,size,size);
        float radian = angle * (PI / 180);
        x = planetX + rad * cos(radian);
        y = planetY + rad * sin(radian);
        angle %= 360;
        angle += speed;
    }
}

class Planet{
    float x;
    float y;
    float size;
    float rad;
    float speed;
    int moonAmount = ceil(random(4)) -1;
    color C = color(200 + random(55),200 + random(55),200 + random(55));
    float angle = ceil(random(360));
    Moon[] m = new Moon[moonAmount];
    Planet(float _size, float _rad, float _speed){
        size = _size;
        rad = _rad;
        speed = _speed;
        for (int i = 0; i < m.length; i++){
          m[i] = new Moon(5, 20, random(2)-1);
        }
    }
    void display(float sunX, float sunY){
        fill(C);
        ellipse(x,y,size,size);
        float radian = angle * (PI / 180);
        x = sunX + rad * cos(radian);
        y = sunY + rad * sin(radian);
        angle %= 360;
        angle += speed;
        for (int i = 0; i < m.length; i++){
          m[i].display(x,y);
        }
    }  
}

class Sun{
    int planetAmount = 8;
    float x;
    float y;
    Planet[] pArray = new Planet[planetAmount];
    Sun(float width, float height){
        x = width/2;
        y = height/2;
        for (int i = 0; i < pArray.length; i++){ 
            pArray[i] = new Planet(random(10) + 10,((i+1)* width/15), random(4) - 2);
        }
    }
    void display(){
        fill(255,255,200);
        ellipse(x,y,50,50);
        for (int i = 0; i < pArray.length; i++){ 
            pArray[i].display(x,y);
        }
    }
}


Ball b;
Ball b2;
float g;
float f;
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  noStroke();
  b = new Ball(width/2, height/2, 20, color(255,255,200));
  b2 = new Ball(width/2, height/4, 30, color(255,200,200));
  g = 0.01;
  f = 0.998;
}

void draw() {  //draw function loops 
    fill(0,0,20,20);
    rect(0,0,width,height);
    b.display();
    b2.display();
}
void mousePressed(){
    if(dist(mouseX, mouseY, b.x,b.y) < b.rad){
        b.snapMouse = true;
    }
    if(dist(mouseX, mouseY, b2.x,b2.y) < b2.rad){
        b2.snapMouse = true;
    }
}
void mouseReleased(){
    if(b.snapMouse){
        b.setAcc(mouseX - pmouseX,mouseY - pmouseY);
        b.snapMouse = false;
    }
    if(b2.snapMouse){
        b2.setAcc(mouseX - pmouseX,mouseY - pmouseY);
        b2.snapMouse = false;
    }
}
void keyPressed(){
    b.setAcc(0,0);
    b2.setAcc(0,0);
}

class Ball{
    float x;
    float y;
    float rad;
    color c;
    boolean snapMouse;
    float xAcc = 0.5;
    float yAcc = -1;
    
    Ball(float _x, float _y, float _rad, color _c){
    x = _x;
    y = _y;
    rad = _rad;
    c = _c;
    snapMouse = false;
    }
    void display(){
        if(snapMouse){
            x = mouseX;
            y = mouseY;
        }
        fill(c);
        ellipse(x,y,rad,rad);
        maths();
    }
    void maths(){
        if(y > height){
            y = height;
            yAcc *= -1;
        }
        if(y < 0){
           y = 0;
            yAcc *= -1;
        }
        if(x >= width){
            x = width;
            xAcc *= -1;
        }
        if(x < 0){
            x = 0;
            xAcc *= -1;
        }
        xAcc *= f;
        yAcc *= f;
        y += g;
        x += xAcc;
        y += yAcc;
    }
    void setAcc(float _xAcc, float _yAcc){
        xAcc = _xAcc;
        yAcc = _yAcc;
    }
}

                
                                                                                

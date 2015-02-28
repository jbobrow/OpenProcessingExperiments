
Pendulum pend;
float m = 1;
float k = .1;
float g = .1;

void setup() {  //setup function called initially, only once
  size(640, 480);
  background(255);  //set background white
  colorMode(HSB, 360, 100, 100);   //set colors to Hue, Saturation, Brightness mode
  pend= new Pendulum(new PVector(width/2, height/2), new PVector(50,0));
}

void draw() {  //draw function loops 
    background(360);
    pend.render();
    pend.update();
}


class Pendulum{
    PVector center, position, velocity, acceleration;
    boolean selected=false;
    float radius = 10;
    
    public Pendulum(PVector center_){
        center = center_;
        position = new PVector(center.x, center.y);
        velocity = new PVector();
        acceleration = new PVector();
    }
    
    
    public Pendulum(PVector center_, PVector pos){
        center = center_;
        position = new PVector(center.x + pos.x, center.y + pos.y);
        velocity = new PVector();
    }

    void render(){
        fill(0, 100, 100);
        stroke(0);
        line(center.x, center.y, position.x, position.y);
        ellipse(center.x, center.y, 10, 10);
        ellipse(position.x, position.y, 2*radius, 2*radius);
        
    }
    
    void update(){
        if(!selected){
            PVector gravity = new PVector(0,m*g);
            PVector rope = new PVector(position.x - center.x, position.y-center.y);
            float radius = mag(rope);
            rope.normalize();
            PVector rotatedRope = rotate(rope);
            float dotProd = rotatedRope.dot(gravity);
            PVector gravityPerp = PVector.mult(rotatedRope,dotProd);
            dotProd = rope.dot(gravity);
            PVector gravityPara = PVector.mult(rope,dotProd);
            
            dotProd = rotatedRope.dot(velocity);
            PVector vt = PVector.mult(rotatedRope, dotProd);
            float ac = m*vt.dot(vt)/radius;
            
            /*text(ac,50,50);
            text(mag(gravityPara),50,100);*/
            //ac += mag(gravityPara);
            //text(ac,50,150);
            rope.mult(-ac);
            textSize(32);
            
            //System.out.println(ac);
            
            strokeWeight(2);
            
            //g||
            stroke(255,100,100);
            line(position.x, position.y, position.x+gravityPara .x*100, position.y+gravityPara .y*100);
            
            //gp
            stroke(120,100,100);
            line(position.x, position.y, position.x+gravityPerp.x*100, position.y+gravityPerp.y*100);
            
            //T
            stroke(55,100,100);
            line(position.x, position.y, position.x+rope.x*100, position.y+rope.y*100);
            
            strokeWeight(1);
            
            PVector acceleration = PVector.add(rope, gravityPerp);
            acceleration.div(m);
            //line(position.x, position.y, position.x+acceleration.x*100000, position.y+acceleration.y*100000);
           
            
            velocity.add(acceleration);
           
            stroke(200);
            //line(position.x, position.y, position.x+velocity.x*100000, position.y+velocity.y*100000);
            //ine(position.x, position.y, position.x+rope.x*100000, position.y+rope.y*100000);
            
            stroke(0);
        } else {
            velocity = PVector.sub(new PVector(mouseX, mouseY), position);
            velocity.mult(.5);
        }
         position.add(velocity);
    }
    
 }  
 
 PVector rotate(PVector v){
     return new PVector(-v.y, v.x);
 }
 
 PVector multiply(PVector v, float s){
     return new PVector(v.x*s,v.y*s);
 }
 
 PVector subtract(PVector a, PVector b){
     return new PVector(a.x-b.x, a.y-b.y);
 }
 float mag(PVector a){
     return sqrt(a.dot(a));
 }
 
 PVector adds(PVector a, PVector b, PVector c){
     return new PVector(a.x+b.x+c.x, a.y+b.y+c.y);
 }

 

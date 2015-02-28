
myFont = createFont("fantasy", 32);
Enemy deny=new Enemy();
Erou pilu=new Erou();
ArrayList gloante=new ArrayList();
int max=20;


boolean keyUp=false, keyDown=false, keyLeft=false, keyRight=false;

void setup() {
  size(640, 480);
  background(0, 0, 0);
}

void draw(){
    background(0);
    deny.update();
    deny.draw();
    pilu.update();
    pilu.draw();
    

    for (int i = gloante.size()-1; i > 0; i--) { 
        // An ArrayList doesn't know what it is storing,
        // so we have to cast the object coming out.
        Glont glont = (Glont) gloante.get(i);
        glont.update();
        float d =  PVector.dist(deny.loc, glont.loc);
        if ( d < ( deny.size + glont.size) ) 
        {
            gloante.remove(i);
            deny.health-=glont.size/4;
        }
        
        if(glont.loc.x>width || glont.loc.x<0 || glont.loc.y>height || glont.loc.y<0)
        {
        gloante.remove(i);
        }
        
        glont.draw();
  } 
    
}



void keyPressed()
{
    if(keyCode==UP)
        keyUp=true;
    else if(keyCode==DOWN)
        keyDown=true;
    else if(keyCode==LEFT)
        keyLeft=true;
    else if(keyCode==RIGHT)
        keyRight=true;
}

void keyReleased()
{
    if(keyCode==UP)
        keyUp=false;
    else if(keyCode==DOWN)
        keyDown=false;
    else if(keyCode==LEFT)
        keyLeft=false;
    else if(keyCode==RIGHT)
        keyRight=false;
} 

class Erou{
    PVector loc;
    PVector velocity;
    PVector acceleration;
    float topSpeed=3;
    float health=80;
    float fontSize=32;
    float size=50;
    float lastFire=0;
    float rate=100; 
    
    Erou(){
        loc = new PVector(size, size);
        velocity = new PVector(0,0);
  
        acceleration = new PVector(0, 0);
    }
    
    void update() {
        size=health+20/4;
        fontSize=10+ceil(health/3);
        topSpeed=7-ceil(health/20);
        
        decY=true;
        decX=true;
        if (keyUp) {
            velocity.y-=0.15;
            decY=false;
        }
        if(keyDown) {
            velocity.y+=0.15;
            decY=false;
        }
        
        if(keyLeft) {
            velocity.x-=0.15;
            decX=false;
        }
        if(keyRight) {
            velocity.x+=0.15;
            decX=false;
        }
        
        if(decY){
            if(velocity.y>0.1)
                velocity.y-=0.05;
            else if(velocity.y<0.1)
                velocity.y+=0.05;
            else
                velocity.y=0;
        }
        
        if(decX){
            if(velocity.x>0.1)
                velocity.x-=0.05;
            else if(velocity.x<0.1)
                velocity.x+=0.05;
            else
                velocity.x=0;
        }
        
        if(loc.x<0)
        loc.x=width;
        if(loc.x>width)
        loc.x=0;
        if(loc.y<0)
        loc.y=height;
        if(loc.y>height)
        loc.y=0;
      
        velocity.limit(topSpeed);
        loc.add(velocity);
        
        if(mousePressed && millis()-lastFire>rate){
            lastFire=millis();
            PVector mouse=new PVector(mouseX, mouseY);
            deltax = mouse.x - loc.x;
            deltay = mouse.y - loc.y;
            angle = atan2(deltay,deltax);
            gloante.add(new Glont(pilu.loc, angle));
        }
    }
    
    void draw() {
        smooth();
        noStroke();
        fill(255, 255, 255);
        ellipse(loc.x, loc.y, size, size);
        fill(200, 200, 200);
        ellipse(loc.x, loc.y, size/1.3, size/1.3);
        textFont(myFont, fontSize);
        fill(50, 50, 50);
        text("Pilu", loc.x-fontSize, loc.y+fontSize/2);
        
        fill(255, 255, 255);
        textFont(myFont, 18);
        text("Viata pilu: "+health, width-110, height-5);
    }
}

class Glont{
    PVector loc;
    float addx;
     float addy;
    float angle;
    PVector speed=5;
    PVector size=random(3,8);
    int colors;
    
    Glont(PVector x, float a){
        loc=x.get();
        angle=a;
        colors={random(255), random(255), random(255)};
    }
    
    void update() { 
        addx=(speed * cos(angle));
        addy=(speed * sin(angle));
        loc.x += addx;
        loc.y += addy;
    }
    
    void draw() {
        smooth();
        noStroke();
        fill(colors[0], colors[1], colors[2]);
        ellipse(loc.x, loc.y, size, size);
        ellipse(loc.x-addx*2, loc.y-addy*2, size/1.5, size/1.5);
        ellipse(loc.x-addx*3, loc.y-addy*3, size/2, size/2);
    }
}

class Enemy{ 
    PVector loc;
    PVector nextLoc;
    float topSpeed=1;
    float health=80;
    float size;
    float fontSize;
    float textSize=20+health/10;
    
    Enemy(){
        loc = new PVector(600, 400);
        nextLoc = new PVector(600, 400);
    }
    
    
    void update() { 
        float d=loc.dist(nextLoc);
        size=health+20/4;
        fontSize=10+ceil(health/3);
        topSpeed=5-ceil(health/20);
        
        if(d>topSpeed)
        {
            float xdif=abs(loc.x-nextLoc.x);
            float ydif=abs(loc.y-nextLoc.y);
            float ratiox=xdif/d;
            float ratioy=ydif/d;
            if(loc.x > nextLoc.x)
                loc.x -= topSpeed*ratiox;
            else
                loc.x += topSpeed*ratiox;
            if(loc.y > nextLoc.y)
                loc.y-= topSpeed*ratioy;
            else
                loc.y+=topSpeed*ratioy;
        }
        
        else
        {
            nextLoc = new PVector(random(width),random(height));
        }
    }
    
    void draw() {
        smooth();
        noStroke();
        fill(255, 255, 255);
        ellipseMode(RADIUS);
        ellipse(loc.x, loc.y, size, size);
        textFont(myFont, fontSize);
        fill(50, 50, 50);
        text("Deny", loc.x-fontSize, loc.y+fontSize/2);
        
        fill(255, 255, 255);
        textFont(myFont, 18);
        text("Viata Deny: "+health, 5, height-5);
    }
} 

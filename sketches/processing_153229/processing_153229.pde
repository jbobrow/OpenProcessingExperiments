
class Beast {
    
    int ID;
    int xPos;
    int yPos;
    PVector velocity;
    float rotation;
    float rotSpeed;
    int radius;
    color c;
    
    //inputs
    
    
    //genetic
    ArrayList<int> input;
   
    
    
    Beast(int x, int y, int r){
        ID = beasts.size();
        xPos = x;
        yPos = y;
        velocity = new PVector(0,0);
        velocity.x = 0;
        velocity.y = 0;
        rate = 0;
        rotation = 0.0;
        rotSpeed = 0.1;
        speed = 0.0001;
        radius = r;
        c = beastColor;
        eyesight = 50;
        //Neural Net
        input = new ArrayList<int>;
        
    }
    
   void accelerate(int amt) {
       velocity.x = velocity.x + (cos(rotation) + speed) * amt;
       velocity.y = velocity.y + (sin(rotation) + speed) * amt;
       rate = dist(0,0,velocity.x,velocity.y);
   }
    
    void updatePosition(){
        
            result = 0; //will do a switch on result later;
                
                newXPos = xPos + velocity.x;
                newYPos = yPos + velocity.y;
            
            if (newXPos < 0 + radius){result = 1;}         // result = 1 means collided with wall
            if (newYPos < 0 + radius){result = 2;}        // result = 1 means collided with wall
            if (newXPos > width - radius){result = 1;}     // result = 1 means collided with wall   
            if (newYPos > height - radius){result = 2;}    // result = 1 means collided with wall
            
            //collision with other bots.
            for (p = 0; p < beasts.size();p++){
                if (ID != p && dist(xPos, yPos, beasts.get(p).xPos, beasts.get(p).yPos) < (radius/1.5 + beasts.get(p).radius/1.5)) {result = 3; break;}                    //result = 2 means collided with beast
            
            }
            
            switch(result) {
                case 0:
                    xPos = newXPos;
                    yPos = newYPos;
                break;
                case 1:
                    velocity.x = -velocity.x;
                    xPos = xPos + velocity.x;
                     
                break;
                case 2:
                    
                     velocity.y = -velocity.y;
                     yPos = yPos + velocity.y;
                break;
                
                case 3:
                ddd = dist(beasts.get(p).xPos, beasts.get(p).yPos, xPos, yPos);
                    dx = beasts.get(p).xPos - xPos;
                    dy = beasts.get(p).yPos - yPos;
                    vx1 = velocity.x;
                    vy1 = velocity.y;
                    vx2 = beasts.get(p).velocity.x;
                    vy2 = beasts.get(p).velocity.y;
                    
                    mag1 = sqrt((vx1 * vx1)+(vy1*vy1));
                    mag2 = sqrt((vx2 * vx2)+(vy2*vy2));
              
                    beasts.get(p).velocity.x =  (mag1*dx/ddd)*soft;
                    beasts.get(p).velocity.y =  (mag1*dy/ddd)*soft;
                    velocity.x = -(mag2*dx/ddd)*soft;
                    velocity.y = -(mag2*dy/ddd)*soft;
                    
                    xPos = xPos + velocity.x;
                    yPos = yPos + velocity.y;
                    beasts.get(p).xPos = beasts.get(p).xPos + beasts.get(p).velocity.x;
                    beasts.get(p).yPos = beasts.get(p).yPos + beasts.get(p).velocity.y;
                break;
            }
        
        xPos = constrain(xPos, 1+radius, width-radius-1);
        yPos = constrain(yPos, 1+ radius, height-radius-1);
    }
    
    void display() {
        setColor(c);
        fill(bgColor);
        ellipse(xPos, yPos, radius, radius);
        line(xPos, yPos, xPos + cos(rotation) * radius/2, yPos + sin(rotation)*radius/2);  
    }
    
    int castRay() {
        stroke(rayColor);
        line(xPos, yPos, xPos + cos(rotation) * eyesight, yPos + sin(rotation)*eyesight);
        whatSaw = -1;
        for(e = 0; e < eyesight; e++){
            if (xPos + cos(rotation) * e < 0 || xPos + cos(rotation) * e > 800) {whatSaw = 1;}
            if (yPos + sin(rotation) * e < 0 || yPos + sin(rotation) * e > 800) {whatSaw = 1;}
            //point(xPos + sin(rotation) * e,yPos + cos(rotation) * e);
        }
        return whatSaw;
    }
    
    void rotateLeft() {
        rotation = rotation + rotSpeed;
    }

    void rotateRight() {
        rotation = rotation - rotSpeed;
    }
}

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$___Vars___$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
strokeWeight(1);
smooth();

ArrayList<Beast> beasts;
Beast a;

width = 800;
height = 800;
size(width, height);

PFont font;
font = loadFont("FFScala.ttf");
textFont(font, 15);
background(222,222,256);

color whiteColor = color(256,256,256);
color blackColor = color(0,0,0);
color bgColor = color(222,222,256);
color beastColor = color(0,0,0);
color rayColor = color(256,0,0,50);

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$___Vars___$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

velMAX = 0.2;
soft = 0.5;

void setup() {  
     beasts = new ArrayList<Beast>();
     Beast a = new Beast(200,100,10);
     beasts.add(a);
     beastSetup(100);
     
}

void draw() {
    background(222,222,256);
    info();
    for(n = 0;n < beasts.size();n++){
        beasts.get(n).display();
        beasts.get(n).accelerate(0.1);
        
        beasts.get(n).updatePosition();
        beasts.get(n).rotateLeft();
        if (beasts.get(n).castRay() == 1){beasts.get(n).accelerate(-.2);}
    }
    
}
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$___Setup___$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


void beastSetup(int amt) {
    
    
    for (int b = 0; b < amt; b++) {
        rX = random(width);
        rY = random(height);
        rR = random(5)+5;
        
        beasts.add(new Beast(rX, rY, rR));
    } 
        

}



//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$___Funcs___$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


void info() {
    setColor(whiteColor);
    stroke(blackColor);
    rect(0, 0, 100, 800);
    setColor(blackColor);
    text("info:", 5,20);
    text(beasts.size(), 5, 40);
    text(beasts.get(0).castRay(), 5, 60);
    
    text(beasts.get(0).velocity.x, 5, 100);
    text(beasts.get(0).velocity.y, 5, 120);
    

}


void setColor(color c) {
    fill(c);
    stroke(c); 
}

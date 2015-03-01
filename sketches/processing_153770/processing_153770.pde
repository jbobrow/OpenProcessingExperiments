
class Food {
    int xPos;
    int yPos;
    color c;
    int radius;
    
    Food(int x, int y) {
        xPos = x;
        yPos = y;
        c = foodColor;
        radius = 5;
    
    }

    void tick() {
        setColor(c);
        ellipse(xPos, yPos, radius, radius);
        
    }


}


class Beast {
    int ID;
    boolean isAlive;
    int energy;
    int xPos;
    int yPos;
    PVector velocity;
    float rotation;
    float rotSpeed;
    int radius;
    int redB;
    int greenB;
    int blueB;
    color c;
    
    //inputs
    
    
    //genetic
    ArrayList<int> input;
    ArrayList<int> whatDo;
   
    
    
    Beast(int x, int y, int r){
        ID = beasts.size();
        isAlive = true;
        energy = 1000;
        xPos = x;
        yPos = y;
        velocity = new PVector(0,0);
        velocity.x = 0;
        velocity.y = 0;
        rate = 0;
        rotation = 0.0;
        rotSpeed = random(10)/50;
        speed = -0.01; //needs to be negative for some reason ???;
        //redB = random(256);
        //greenB = random(256);
        //blueB = random(256);
        c = color(0,0,0);
        
        radius = r;
        eyesight = 50;

        //genes
        input = new ArrayList<int>;
        input.add(random(reflex)-restraint);
        input.add(random(reflex)-restraint);
        input.add(random(reflex)-restraint);
        input.add(random(reflex)-restraint);
        input.add(random(reflex)-restraint);
        
        whatDo = new ArrayList<int>;
        whatDo.add(int(random(2)));
        whatDo.add(int(random(2)));
        whatDo.add(int(random(2)));
        whatDo.add(int(random(2)));
        whatDo.add(int(random(2)));
        
                
    }
    
    void tick () {
        display();
        energy = energy -1;
        if (energy < 1) {isAlive = false;}
        
        updatePosition();
        
        if (isAlive){
            ray = castRay();
            if (ray == 0){  //empty Space
                        if (whatDo.get(0) == 0) {accelerate(input.get(0))};
                        if (whatDo.get(0) == 1) {rotateRight(input.get(0))};
                        if (whatDo.get(0) == 2) {rotateLeft(input.get(0))};
            }   
            if (ray == 1){
                        if (whatDo.get(1) == 0) {accelerate(input.get(1))};
                        if (whatDo.get(1) == 1) {rotateRight(input.get(1))};
                        if (whatDo.get(1) == 2) {rotateLeft(input.get(1))};
            }   //wall
            if (ray == 2){
                        if (whatDo.get(2) == 0) {accelerate(input.get(2))};
                        if (whatDo.get(2) == 1) {rotateRight(input.get(2))};
                        if (whatDo.get(2) == 2) {rotateLeft(input.get(2))};
                }    //alive Beast
            if (ray == 3){
                        if (whatDo.get(3) == 0) {accelerate(input.get(3))};
                        if (whatDo.get(3) == 1) {rotateRight(input.get(3))};
                        if (whatDo.get(3) == 2) {rotateLeft(input.get(3))};
                }    //dead Beast
            if (ray == 4){
                        if (whatDo.get(4) == 0) {accelerate(input.get(4))};
                        if (whatDo.get(4) == 1) {rotateRight(input.get(4))};
                        if (whatDo.get(4) == 2) {rotateLeft(input.get(4))};
                }    //food
        }
      
        
    }
        
   
    
   void accelerate(float amt) {
       velocity.x = velocity.x - ((cos(rotation) * speed) * amt);
       velocity.y = velocity.y - ((sin(rotation) * speed) * amt);
       
       

   }
   
   
    
    void updatePosition(){
        
        
        
            result = 0; //will do a switch on result later;
                
                newXPos = xPos + velocity.x;
                newYPos = yPos + velocity.y;
                
            
            if (newXPos < 0 + radius){result = 1;}         // result = 1 means collided with x wall
            if (newYPos < 0 + radius){result = 2;}        // result = 2 means collided with y wall
            if (newXPos > width - radius){result = 1;}     // result = 1 means collided with x wall   
            if (newYPos > height - radius){result = 2;}    // result = 2 means collided with y wall
         
            //collision with other bots.
            for (p = 0; p < beasts.size();p++){
                if (ID != p && dist(xPos, yPos, beasts.get(p).xPos, beasts.get(p).yPos) < (radius/1.5 + beasts.get(p).radius/1.5)) {result = 3; break;}                    //result = 2 means collided with beast
            
            }
            
            for (q = 0; q < foods.size();q++){
                if (dist(xPos, yPos, foods.get(q).xPos, foods.get(q).yPos) <  5+(foods.get(q).radius)) {result = 4; break;}                    //result = 4 means collided with food
            
            }
            
            switch(result) {
                case 0:
                    xPos = newXPos;
                    yPos = newYPos;
                break;
                case 1:
                    velocity.x = -velocity.x*soft;
                    xPos = xPos + velocity.x;
                    yPos = newYPos;
                    energy = energy - abs(velocity.x) * 50;

                break;
                case 2:
                     velocity.y = -velocity.y*soft;
                     yPos = yPos + velocity.y;
                     xPos = newXPos;
                     energy = energy - abs(velocity.y) * 50;

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
                
                case 4:
                    xPos = newXPos;
                    yPos = newYPos;
                    velocity.x = velocity.x /2;
                    velocity.y = velocity.x /2;
                    if (isAlive) {energy = energy + foods.get(q).radius * 100;foods.remove(q);}
                    
                break;
            }
        
        xPos = constrain(xPos, 1+radius, width-radius-1);
        yPos = constrain(yPos, 1+ radius, height-radius-1);
        
    }
    
    void display() {
        setColor(c);
        if (isAlive) {fill(beastColor);} else {setColor(deadColor);}
        ellipse(xPos, yPos, radius, radius);
        line(xPos, yPos, xPos + cos(rotation) * radius/2, yPos + sin(rotation)*radius/2); 
        setColor(rayColor);
        line(xPos, yPos, xPos + cos(rotation) * eyesight, yPos + sin(rotation)*eyesight);
        if (energy > 0) {textFont(font, 10);} else (textFont(font, 1);}
        setColor(redColor);
        text(int(energy), xPos+radius, yPos);
        setColor(blackColor);
        text(int(radius), xPos+radius, yPos+10);  
    }
    
    int castRay() {
        stroke(rayColor);
        whatSaw = 0;
        for(e = 0; e < eyesight; e++){
            
            if (xPos + cos(rotation) * e < 0 || xPos + cos(rotation) * e > 800) {whatSaw = 1; break;}
            if (yPos + sin(rotation) * e < 0 || yPos + sin(rotation) * e > 800) {whatSaw = 1; break;}
            
            for (b = 0; b < beasts.size(); b++){
                if (dist (xPos + cos(rotation) * e, yPos + sin(rotation) * e, beasts.get(b).xPos, beasts.get(b).yPos) < (radius/2 + beasts.get(b).radius/2) && b !=ID) {
                if (beasts.get(b).isAlive) {whatSaw = 2;} else {whatSaw = 3;} break;}
            }
            
            for (f = 0; f < foods.size(); f++){
                if (dist (xPos + cos(rotation) * e, yPos + sin(rotation) * e, foods.get(f).xPos, foods.get(f).yPos) < ( foods.get(f).radius/2)) {whatSaw = 4; break;}
            }
            
            
           
            
            //point(xPos + sin(rotation) * e,yPos + cos(rotation) * e);
        }
        
        
        
        
        
        return whatSaw;
    }
    
    void rotateLeft(float amt) {
        rotation = rotation - rotSpeed*amt;
        
    }

    void rotateRight(float amt) {
        rotation = rotation + rotSpeed*amt;
        

    }
}

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$___Vars___$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
strokeWeight(1);
smooth();


ArrayList<Beast> beasts;
Beast b;

ArrayList<Food> foods;
Beast f;

width = 800;
height = 800;
size(width, height);

PFont font;
font = loadFont("FFScala.ttf");
textFont(font, 15);
background(222,222,256);

color whiteColor = color(256,256,256);
color blackColor = color(0,0,0);
color deadColor = color(0,0,0,20);
color bgColor = color(250,256,256);
color beastColor = color(0,0,100);
color rayColor = color(256,0,0,50);
color foodColor = color (0, 256,0,50);
color redColor = color (256, 0,0);
color cutoffColor = color (256,0,0,10);

reflex = 20;
restraint = 10;
counter = 0;
xCounter = 1;
cutoff = 1000;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$___Vars___$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

velMAX = 2;
soft = 0.5;

void setup() {  
     beasts = new ArrayList<Beast>();
     //Beast b = new Beast(200,100,10);
     //beasts.add(b);
     beastAdd(30);
     
     foods = new ArrayList<Food>();
     //Food f = new Food(100,100);
     //foods.add(f);
     foodAdd(0);
     
     
}

void draw() {
    background(bgColor);
    //info();
    displayCutoff();
    
    
    for(n = 0;n < beasts.size();n++){
        beasts.get(n).tick();
        if (beasts.get(n).energy < -100) {resetBeast(n);}
    }
    for(n = 0;n < foods.size();n++){
        foods.get(n).tick();
    }
   
   if (foods.size() < 30) {foodAdd(1);}
   
  
   
}
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$___Setup___$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


void beastAdd(int amt) {
    
    
    for (int b = 0; b < amt; b++) {
        rX = random(width);
        rY = random(height);
        rR = random(20)+5;
        
        beasts.add(new Beast(rX, rY, rR));
    } 
        

}

void foodAdd(int amt) {
    
    
    for (int f = 0; f < amt; f++) {
        rX = random(width);
        rY = random(height);
        
        foods.add(new Food(rX, rY));
    } 
        

}



//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$___Funcs___$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

void displayCutoff() {
    textFont(font, 200);
    setColor(cutoffColor);
    text(cutoff, 190, height /2 - 40);


}

void info() {
    textFont(font, 15);
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



void resetBeast (int n) {
        maxEnergy = 0;
        index = 0;
        
        for (i = 0; i < beasts.size(); i++){
            if (beasts.get(i).energy > maxEnergy) {index = i; maxEnergy = beasts.get(i).energy;}
            
                //i = int(random(beasts.size()));
                //if (beasts.get(i).isAlive) {found = 1; }
          }
        i = index;
        if (maxEnergy < cutoff) {
        
        beasts.get(n).isAlive = true;
        beasts.get(n).energy = 1000;
        beasts.get(n).xPos = random(800);
        beasts.get(n).yPos = random(800);
        
        beasts.get(n).velocity.x = 0;
        beasts.get(n).velocity.y = 0;
        
        beasts.get(n).rotation = 0.0;
        beasts.get(n).rotSpeed = random(10)/50;
        beasts.get(n).speed = -0.01; //needs to be negative for some reason ???;
        
        //beasts.get(n).redB = random(256);
        //beasts.get(n).greenB = random(256);
        //beasts.get(n).blueB = random(256);
        beasts.get(n).c = color(0,0,0);
        
        beasts.get(n).radius = random(20) + 5;
        beasts.get(n).eyesight = 50;
        
        beasts.get(n).input.clear();
        beasts.get(n).input.add(random(reflex)-restraint);
        beasts.get(n).input.add(random(reflex)-restraint);
        beasts.get(n).input.add(random(reflex)-restraint);
        beasts.get(n).input.add(random(reflex)-restraint);
        beasts.get(n).input.add(random(reflex)-restraint);
       
        beasts.get(n).whatDo.clear();
        beasts.get(n).whatDo.add(int(random(3)));
        beasts.get(n).whatDo.add(int(random(3)));
        beasts.get(n).whatDo.add(int(random(3)));
        beasts.get(n).whatDo.add(int(random(3)));
        beasts.get(n).whatDo.add(int(random(3)));
        
        
        
        } else {
    
        //fill(blackColor);
        //rect(0,0,800,800);
        beasts.get(n).isAlive = true;
        beasts.get(n).energy = 1000;
        beasts.get(n).xPos = random(800);
        beasts.get(n).yPos = random(800);
        beasts.get(n).velocity.x = 0;
        beasts.get(n).velocity.y = 0;
        
        beasts.get(n).rotation = 0.0;
        beasts.get(n).rotSpeed = beasts.get(i).rotSpeed;
        beasts.get(n).speed = beasts.get(i).speed; 
        beasts.get(n).radius = beasts.get(i).radius;
        //beasts.get(n).redB = 0;
        //beasts.get(n).greenB = 0;
        //beasts.get(n).blueB =0;
        beasts.get(n).color = color(0,0,0);
        beasts.get(n).eyesight = beasts.get(i).eyesight;
        
        beasts.get(n).input = beasts.get(i).input;
        beasts.get(n).whatDo = beasts.get(i).whatDo;

        }

}


void keyPressed() {


  if (key == CODED) {

    if (keyCode == UP) {

      cutoff = cutoff + 100;

    } else if (keyCode == DOWN) {

      cutoff = cutoff - 100;

    } 

  } else {}


}

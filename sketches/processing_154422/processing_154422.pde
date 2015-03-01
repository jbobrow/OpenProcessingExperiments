


class Flower {
    boolean isAlive;
    int ID;
    int age;
    int maxAge;
    int counter;
    int rate;
     
    int xPos;
    int yPos;
    int stigmaSize;
    int petalSize;
    int petalSize;
    int petalSymmetry;
    int multiplier;
     
    int rStigma;
    int gStigma;
    int bStigma;
    color cStigma;
     
    int rPetal;
    int gPetal;
    int bPetal;
    color cPetal;
 
    ArrayList<int> info;
 
    Flower(int x, int y) {
        isAlive = true;
        ID = makeID();
        age = 0
        sizeMax = 5;
        counter = 0;
        xPos = x;
        yPos = y;
        
        info = new ArrayList<int>;
        
        maxAge = int(random(100)+20);
        info.add(maxAge);                             //0     
     
        rate = 10 * int(random(5) +1);
        info.add(rate);                               //1
                     
        stigmaSize = int(random(5)) ;
        info.add(stigmaSize);                         //2
        
        petalSize = int(random(10));
        info.add(petalSize);                          //3
        
        petalSymmetry = int(random(4) + 3);
        info.add(petalSymmetry);                      //4
        
        multiplier = int(random(2)  +2);    
        info.add(multiplier);                         //5
         
        rStigma = int(random(256));
        info.add(rStigma);                            //6
            
        gStigma = int(random(256));
        info.add(gStigma);                            //7
        
        bStigma = int(random(256));
        info.add(bStigma);                            //8 
        
        rPetal = int(random(256));
        info.add(rPetal);                             //9
        
        gPetal = int(random(256));
        info.add(gPetal);                             //10
        
        bPetal = int(random(256));
        info.add(bPetal);                             //10
 
        cStigma = color(rStigma, gStigma, bStigma);
        cPetal = color(rPetal, gPetal, bPetal,100);
        
        
        
       
        
         
         
    }
     
    int makeID() {
        globalID++;
        return globalID;
    }
    
   
    void display() {
        for(s = 0; s < TWO_PI-.01; s = s + (TWO_PI / petalSymmetry))
            {
                strokeWeight(1);
                setColor(hiveColor);
                line(xPos, yPos, xPos+constrain(age, 0, sizeMax) *cos(s),yPos+constrain(age, 0, sizeMax)*sin(s));
                strokeWeight(petalSize/10);
                setColor(cPetal);
                strokeWeight(1);
                stroke(outlineColor);
                ellipse(xPos+constrain(age, 0, sizeMax)*cos(s),yPos+constrain(age, 0, sizeMax)*sin(s), petalSize+constrain(age, 0, sizeMax)*multiplier, petalSize+constrain(age, 0, sizeMax)*multiplier);
            }
         
        for(s = 0; s < TWO_PI-.01; s = s + (TWO_PI / petalSymmetry))
            {
                strokeWeight(1);
                setColor(cStigma);
                ellipse (xPos+constrain(age, 0, sizeMax)*cos(s)/2, yPos+constrain(age, 0, sizeMax)*sin(s)/2, stigmaSize * constrain(age, 0, sizeMax)/20, stigmaSize * constrain(age, 0, sizeMax)/20);
           }
            
         ellipse (xPos, yPos, stigmaSize*multiplier * constrain(age, 0, sizeMax)/20, stigmaSize*multiplier * constrain(age, 0, sizeMax)/20);
   
    }
     
    void tick() {
     
        display();
        counter ++;
        if (counter % rate == 0 ) {age = age + 1;}
         
        if (age > maxAge) {isAlive = false;}
     
    }
 
}
 
 
 
 
class Bee {
 
    int xPos;
    int yPos;
    PVector velocity;
    int state;
    int bestDistID;
    boolean isPollen;
    int counter;
         
    Bee(int x, int y) {
        xPos = x;
        yPos = y;
        velocity = new PVector(0,0);
        state = 0;
        bestDistID = 999999;
        isPollen = false;
        counter = 0;
     
    }
     
    void findNearestID () {
        bestDist = 10000;
        bestDistID = 999999;
        for(int i = 0; i < flowers.size(); i++){
           newDist = dist(xPos, yPos, flowers.get(i).xPos, flowers.get(i).yPos);
            if (newDist < bestDist) {
                bestDist = newDist;
                bestDistID = flowers.get(i).ID;
            }        
        }
     
    }
     
    int IDLookup() {
        for(int i = 0; i < flowers.size(); i++){
            if (flowers.get(i).ID == bestDistID) {
                return(i);
            }        
        }
        return 999999;
    }
     
    void display() {
        setColor(beeColor);
        stroke(beeStrokeColor);
        ellipse(xPos, yPos, 6, 5);
        line(xPos, yPos - 4, xPos, yPos +2);
        if (state == 1) {setColor(highlightColor); noFill();  ellipse(xPos, yPos, 50, 50);}
        if(IDLookup() < flowers.size() && mouseFlower < flowers.size() && bestDistID < flowers.size()) {
         
        line(xPos, yPos, flowers.get(IDLookup()).xPos, flowers.get(IDLookup()).yPos)
         
        };
         
    }
 
     
    void look() {
     
        findNearestID();
        if (bestDistID < flowers.size() && mouseFlower < flowers.size()) {
                    if (compareColors(flowers.get(mouseFlower).cPetal, flowers.get(bestDistID).cPetal)) {
                     state = 1;}
        } else {state = 0;bestDistID = 999999;}
                     
    }
                     
 
    void findAction() {
     
        switch(state) {
            case 0: //moving randomly
             
                velocity.x = velocity.x + random(2) - 1;
                velocity.y = velocity.y + random(2) - 1;
                look();
                 
            break;
            case 1:                                         //move toward flower it likes
                
                index = IDLookup();
                if (index < flowers.size()) {
                    xTarget = flowers.get(index).xPos;
                    yTarget = flowers.get(index).yPos;
                    if (xPos > xTarget) {accelerate(-1,0);}
                    if (xPos < xTarget) {accelerate(1,0);}
                    if (yPos > yTarget) {accelerate(0,-1);}
                    if (yPos < yTarget) {accelerate(0,1);}
                } else {state = 0;}
 
               
                if (dist(xPos, yPos, xTarget, yTarget) < 10) {
                    
                    xPos = xTarget + random(4)-2;
                    yPos = yTarget + random(4)-2;
                    velocity.x = 0;
                    velocity.y = 0;
                  
                    
                    counter++;
                    if (counter > 100){
                
                        counter = 0;
                        state = 2;
                
                    }
                }
                 
                 
                 
            break;
            case 2:                                        //inside hive
                xTarget = width/2;
                yTarget = height/2;
                if (xPos > xTarget) {accelerate(-1,0);}
                if (xPos < xTarget) {accelerate(1,0);}
                if (yPos > yTarget) {accelerate(0,-1);}
                if (yPos < yTarget) {accelerate(0,1);}
                
                if (dist(xPos, yPos, xTarget, yTarget) < 10) {
                     counter++;
                    if (counter > 30){
                        
                       
                        counter = 0;
                        state = 0;
                        
                    }
                }
                 
            break;
            case 3:
             
            break;
         
         
        }
     
    }
 
    void tick() {
     
        findAction();
         
         
        
        newXPos = xPos + velocity.x;
        newYPos = yPos + velocity.y;
        if (newXPos > width || newXPos < 0) { velocity.x = -velocity.x / 10;}
        if (newYPos > height || newYPos < 0) { velocity.y = -velocity.y / 10;}
        if (velocity.x < -5 || velocity.x > 5) { velocity.x = velocity.x / 2;}
        if (velocity.y < -5 || velocity.y > 5) { velocity.y = velocity.y / 2;}
 
        xPos = xPos + velocity.x;
        yPos = yPos + velocity.y;
  
    }
     
     
    void accelerate(int dx, int dy) {
        velocity.x = velocity.x + dx;
        velocity.y = velocity.y + dy;
    }
     
    boolean compareColors(color c1, color c2) {
        sum1 = red(c1) + green(c1) + blue(c1);
        sum2 = red(c2) + green(c2) + blue(c2);
 
        if (abs(sum1 - sum2)  < 10) {
            return true;
        } else {
            return false;
         
        }
         
    }
 
}
 
 
class Hive {
    int xPos;
    int yPos;
    int beePop;
    int size;
     
    Hive(int x, int y) {
        xPos = x;
        yPos = y;
        beePop = 20;
        size = 50;
    }
     
    void display(){
        strokeWeight(1);
        setColor(hiveColor);
         
        beginShape();
        for (v = 0; v < TWO_PI; v= v + TWO_PI /6){
            vertex(xPos + cos(v)*size, yPos + sin(v)*size);
        }
        endShape(CLOSE);
        }
 
 
    void tick() {
         
        if (bees.size() < beePop){bees.add(new Bee(xPos + random(9), yPos));}
         
    }
}
 
 
width = 900;
height = 900;
 
 
//----------------------------------==== ArrayLists<*>
 
ArrayList<Flower> flowers;
ArrayList<Bee> bees;
 
 
 
//----------------------------------==== Font Stuff
PFont font;
font = loadFont("FFScala.ttf");
textFont(font, 15);
 
//----------------------------------==== Color Stuff
background(200,256,200);color bgColor = color (230,256,230);
color whiteColor = color(256,256,256);
color blackColor = color(0,0,0);
color hiveColor = color(20,20,20,50);
color beeColor = color(256,256,0);
color beeStrokeColor = color(20,20,20,120);
color highlightColor = color (256, 20, 20,100);
 
color outlineColor = color(0,0,0,50);
 
//----------------------------------==== Other
 
Hive hive = new Hive(width/2, height/2);
flowerCount = 100;
 
int globalID = 0;
 
int mouseFlower =999999;
int mouseRed=-1;
int mouseGreen=-1;
int mouseBlue=-1;
 
 
 
void setup() {
     
    size(width, height);
     
    flowers = new ArrayList<Flower>();
 
    
    
    bees = new ArrayList<Bee>();
    bees.add(new Bee(width/2, height/2));
 
 
}
 
 
void draw() {
     background(230,256,230); 
      //info();
      highlight();
     
     
    if (flowerCount > flowers.size()) {addFlowers(flowerCount-flowers.size());}
    for (i = 0; i < flowers.size(); i++) {
     
        flowers.get(i).tick();
        if (!flowers.get(i).isAlive){
            if (i < mouseFlower) {mouseFlower--;}
            if (flowers.size() > 2) {
             
                    if (mouseFlower != i) {flowers.remove(i);}
                     
                }
        }
    }
     
    for (i = 0; i < bees.size(); i++) {
        bees.get(i).tick();
        bees.get(i).display();
    }
  
     
    hive.tick();
    hive.display();
      
           
}
 
//______________________________________________________________---------===== Setup Functions
 
void addFlowers(int amount){
    
    
    for (i = 0; i <  amount; i++) {
        x = random(width);
        y = random(height);
        
        while (dist(x,y,width/2,height/2) < 200){
        
                x = random(width);
                y = random(height);
            }
            flowers.add(new Flower(x,y));
        
        }
        
        
   
}
 
 
//______________________________________________________________---------===== Functions
 
void info() {
    textFont(font, 15);
    setColor(whiteColor);
    stroke(blackColor);
    rect(0, 0, 100, 800);
    setColor(blackColor);
    text("info:", 5,20);
    text(flowers.size(), 5, 60);
 
    text(mouseFlower, 5, 80);
 
 
    text(flowers.get(37).ID, 5, 160);
}
 
void setColor(color c) {
    fill(c);
    stroke(c);
}
 
//______________________________________________________________---------===== User Functions
 
 
 
void mousePressed () {
     
    bestDist = 10000;
     
    for (i = 0; i < flowers.size(); i ++ ){
        newDist = dist(mouseX, mouseY, flowers.get(i).xPos, flowers.get(i).yPos);
        
        if (newDist < bestDist) {
            bestDist = newDist;
            mouseFlower = i;
        }
     
     
    }
  
     if (dist(mouseX, mouseY, width/2, height/2) < bestDist) { mouseFlower = 999999;}
     for(int b = 0;b< bees.size(); b++) {
         bees.get(b).state = 0;
     }
     
     copy(mouseFlower);
     
}
 
void highlight () {
      if (mouseFlower < flowers.size()) {
              setColor(highlightColor);
              noFill();
              strokeWeight(5);
              ellipse(flowers.get(mouseFlower).xPos, flowers.get(mouseFlower).yPos, 50,50);
           
           
      }
       
}

 void copy(int index) {
 
    Flower newFlower = new Flower(flowers.get(index).xPos + random(100)-50,flowers.get(index).yPos + random(100)-50);
    newFlower.isAlive = true;
    newFlower.ID = globalID;
        globalID++;
    newFlower.age = 0; 
    newFlower.maxAge = flowers.get(index).maxAge;
    newFlower.sizeMax = 5;
    newFlower.rate = flowers.get(index).rate;
    newFlower.counter = 0;
    newFlower.stigmaSize = flowers.get(index).stigmaSize;
    newFlower.petalSize = flowers.get(index).petalSize;
    newFlower.petalSymmetry = flowers.get(index).petalSymmetry;
    newFlower.multiplier = flowers.get(index).multiplier;
    newFlower.rStigma = flowers.get(index).rStigma;
    newFlower.gStigma = flowers.get(index).gStigma;
    newFlower.bStigma = flowers.get(index).bStigma;
    newFlower.cStigma = color(flowers.get(index).rStigma, flowers.get(index).gStigma, flowers.get(index).bStigma);
    newFlower.rPetal = flowers.get(index).rPetal;
    newFlower.gPetal = flowers.get(index).gPetal;
    newFlower.bPetal = flowers.get(index).bPetal;
    newFlower.cPetal = color(flowers.get(index).rPetal, flowers.get(index).gPetal, flowers.get(index).bPetal,90);

    flowers.add(newFlower);

    }
     

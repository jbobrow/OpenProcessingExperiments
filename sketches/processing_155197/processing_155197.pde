
class Segment {
    PVector pos;
    float masterRotation;
    int order;
    float leftRotation;
    float rightRotation;
    
    Segment(PVector positionVector, int o){
        pos = positionVector;
        masterRotation = 0.0;
        order = o;
        leftRotation = 0.0;
        rightRotation = 0.0;
    }

    void display() {
        ellipse(pos.x,pos,y, 5,5);
        
        
    }

}

class Shrimp {
    PVector pos;
    PVector vel;
    float rotation;
    int zLayer;
    int size;
    int segs;
    ArrayList<Segment> segments;
    
    Shrimp (float x, float y, int s, int segments) {
        pos = new PVector(x, y);
        vel = new PVector(0, 0);
        rotation = 0.0;
        zLayer = 0;
        size = s;
        segs = segments;
        segments = new ArrayList<Segment>;
        for(g = 0; g < segments; g++){
            segments.add(new Segment(pos, g));
        }
    }
        
    void tick(){
    
        rotation = rotation + random(.1)-random(.1);
        pos.x = constrain(pos.x + cos(rotation)*random(1),0,width);
        pos.y = constrain(pos.y + sin(rotation)*random(1),0,height);
    }        
        
    void display() {
        setColor(shrimpColor);
        stroke(outlineColor);
        ellipse(pos.x, pos.y, size, size);
        
        for(s=0;s<segs;s++){
            segments.get(s).display();
            
            
        }  
        ellipse(pos.x-cos(rotation+PI/2)*size, pos.y-sin(rotation+PI/2)*size, 5, 5); 
        ellipse(pos.x+cos(rotation+PI/2)*size, pos.y+sin(rotation+PI/2)*size, 5, 5); 
        setColor(blackColor);
        ellipse(pos.x-cos(rotation+PI/2)*size, pos.y-sin(rotation+PI/2)*size, 2, 2); 
        ellipse(pos.x+cos(rotation+PI/2)*size, pos.y+sin(rotation+PI/2)*size, 2, 2);      
     
    }
    
}

PFont font;
font = loadFont("FFScala.ttf");
textFont(font, 15);

background(230, 230, 256);
color bgColor = color (230, 230, 256);
color whiteColor = color(256, 256, 256);
color blackColor = color(0, 0, 0);
color shrimpColor = color(256, 200, 200);
color outlineColor = color(0, 0, 0, 20);

width = 800;
height = 500;
size(width, height);

ArrayList<Shrimp> shrimp;
  
numShrimp = 10;
//

void setup() {
    shrimps = new ArrayList<Shrimp>;  
    

    for (i = 0; i < numShrimp; i ++) {
        rX = random(width);
        rY = random(height);
        rSize = 5;
        rSegs = int(random(10))+5;
        shrimps.add(new Shrimp(rX, rY, rSize, rSegs));
    }

}

void draw() {
    background(230, 230, 256);
    
    for (i = 0; i < shrimps.size(); i ++) {
        shrimps.get(i).tick();
        shrimps.get(i).display();
    }

   

}

void setColor(color c) {
    fill(c);
    stroke(c);
}

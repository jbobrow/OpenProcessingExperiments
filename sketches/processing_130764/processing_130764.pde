
//import java.util.Vector;

Vector<RootSystem> rSystems;

void setup() {
    size(800,600);
    background(255);
    rSystems = new Vector<RootSystem>();
    RootSystem rs = new RootSystem(random(width), random(height));
    RootSystem rs2 = new RootSystem(random(width), random(height));
    RootSystem rs3 = new RootSystem(random(width), random(height));
    rSystems.add(rs);
    rSystems.add(rs2);
    rSystems.add(rs3);
}

void draw() {
    for (int i=0; i<rSystems.size(); i++) {
        rSystems.elementAt(i).go();
    }
}

void mouseReleased() {
    rSystems.clear();
    RootSystem rs = new RootSystem(mouseX,mouseY);
    rSystems.add(rs);
}
class Root {
    /**
    Stores information about the root heads, the leading tips of each branch.
    */
    float x,y,thickness;
    int direction;//0 is right, 1 is down, 2 is left, 3 is up
    
    void drawObject() {
        float px = this.x;
        float py = this.y;
        float speed = (51-thickness)/50;
        if (this.direction == 0) {
            this.x += speed;
        } else if (this.direction == 1) {
            this.y += speed;
        } else if (this.direction == 2) {
            this.x -= speed;
        } else if (this.direction == 3) {
            this.y -= speed;
        }
        stroke(0);
        fill(0);
        strokeCap(SQUARE);
        strokeWeight(this.thickness);
        line(px,py,x,y);
        //rect(px,py,this.x-px,this.y-py);
        
    }
    
    void changeDirection() {
        //will turn left or right
        if ((this.direction == 0) || (this.direction == 2)) {
            while (true) {
                int t = int(random(4));
                if ((t!=0) && (t!=2)) {
                  this.direction = t;
                  return;
                }  
            }
        } else {
            while (true) {
                int t = int(random(4));
                if ((t!=1) && (t!=3)) {
                  this.direction = t;
                  return;
                }  
            }
        }
    }
    
    Root duplicate() {
        Root newR = new Root();
        newR.x = this.x;
        newR.y = this.y;
        newR.thickness = this.thickness;
        newR.direction = this.direction;
        return newR;
    }
}
class RootSystem {
    /**
    A branching root system using only right angles.
    
    Conservation of thickness: Every time a root branches, the sum of the thickness of the child branches is equal to the thickness of the parent branch.
    Timed splitting: Branches do not split every frame.  Decisions to split occur at a fixed interval.
    Direction: Roots can change direction without splitting.
    Speed: The thicker the root, the slower it will move.
    */
    
    float percentSplit = .2;//roots split this percentage of the time
    float percentChangeDirection = .2;//roots will change direction
    int splitFrames = 20;//decide whether or not to split every x number of frames
    int directionFrames = 5;//decide whether or not to change every x number of frames
    float minThickness = .2;
    Vector<Root> roots;
    private int frameCounter;
    
    RootSystem() {
        this.roots = new Vector<Root>();
        Root r = new Root();
        r.x = random(width);
        r.y = random(height);
        r.thickness = 50;
        r.direction = int(random(4));
        this.roots.add(r);
    }
    
    RootSystem(float x, float y) {
        this.roots = new Vector<Root>();
        Root r = new Root();
        r.x = x;
        r.y = y;
        r.thickness = 50;
        r.direction = int(random(4));
        this.roots.add(r);
    }
    
    void go() {
        frameCounter++;
        
        if (frameCounter % directionFrames == 0) {
            changeDirection();
        }
        if (frameCounter % splitFrames == 0) {
            splitRoots();
        }
        
        drawRoots();
        removeRoots();
    }
    
    private void changeDirection() {
        //Do we change direction?
        int numRoots = roots.size();
        for (int i=0; i<numRoots; i++) {
            if (random(1) < percentChangeDirection) {
                roots.elementAt(i).changeDirection();
            }
        }
    }
    
    private void splitRoots() {
        //Do we split the roots?
        int numRoots = roots.size();
        for (int i=0; i<numRoots; i++) {
            if (random(1) < percentSplit) {
                Root parent = roots.elementAt(i);
                Root child = parent.duplicate();
                child.changeDirection();
                float amountSplit = random(1);
                parent.thickness *= amountSplit;
                child.thickness *= (1-amountSplit);
                this.roots.add(child);
            }
        }
    }
    
    private void drawRoots() {
        int numRoots = roots.size();
        for (int i=0; i<numRoots; i++) {
            roots.elementAt(i).drawObject();
        }
    }
    
    private void removeRoots() {
        //Remove roots that are too small
        int numRoots = this.roots.size();
        Vector<Root> toRemove = new Vector<Root>();
        for (int i=0; i<numRoots; i++) {
            Root r = this.roots.elementAt(i);
            if (r.thickness < minThickness) {
                toRemove.add(r);
                fill(255,0,0);
            }
        }
        this.roots.removeAll(toRemove);
    }
}
class Vector<Element> {
    /**
    A very basic Vector class b/c Processing's JavaScript mode doesn't like the java.util.Vector class.
    */
    
    private Object[] array;
    
    Vector() {
        array = new Object[0];
    }
    
    void add(Element e) {
        int newLength = array.length+1;
        Object[] newArray = new Object[newLength];
        for (int i=0; i<array.length; i++) {
            newArray[i] = array[i];
        }
        newArray[newLength-1] = e;
        array = newArray;
    }
    
    Element elementAt(int index) {
        return (Element) array[index];
    }
    
    int size() {
        return array.length;
    }
    
    void removeAll(Vector<Element> v) {
        for (int t=0; t<v.size(); t++) {
            for (int i=0; i<this.size(); i++) {
                if (array[i] == v.elementAt(t)) {
                    array[i] = null;
                }
            }
        }
        condense();
    }
    
    void remove(Element e) {
        for (int i=0; i<this.size(); i++) {
            if (array[i] == e) {
                array[i] = null;
            }
        }
        condense();
    }
    
    private void condense() {
        int numElements = 0;
        for (int i=0; i<array.length; i++) {
            if (array[i] != null) {
                numElements++;
            }
        }
        Object[] newArray = new Object[numElements];
        int nCounter = 0;
        for (int i=0; i<array.length; i++) {
            if (array[i] != null) {
                newArray[nCounter] = array[i];
                nCounter++;
            }
        }
        array = newArray;
    }
}



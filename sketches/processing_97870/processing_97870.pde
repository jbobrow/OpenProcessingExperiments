
Bubble[] bubbles = [];
int initialIncidence = 10;
int alphaText = 0;

void setup() {
  //size(window.innerWidth, window.InnerHeight);
  size(420,420);
  frameRate(16);
}

void draw() {
    background(173, 216, 230);

    boolean stillRunning = false;
    for(int i = 0; i < bubbles.length; i++){
        bubbles[i].update();
        bubbles[i].display();
        if(bubbles[i].isRunning()) stillRunning = true;
    }
    if(!stillRunning) {
        if (alphaText < 255) alphaText += 16;
        fill(255, alphaText);
        textSize(36);
        text("click me", width / 3, height / 2);
        bubbles = [];
    }
}

void mousePressed(){
    if(bubbles.length == 0) {
        bubbles = new Bubble[initialIncidence];
        for(int i = 0; i < bubbles.length; i++) bubbles[i] = new Bubble(initialIncidence);
    }
    alphaText = 0;
}

class Bubble {

    // basic setting
    PVector _point = new PVector(random(width), random(height));
    float _initialRadius = random(112);
    float _radius = this._initialRadius;
    float[] _color = [random(256),random(256),random(256)];
    float _strokeWeight = this._radius / 48;
    PVector _velocity = new PVector((random(1) - 0.5) * 2, (random(1) - 0.5) * 2);
    int _alpha = 0;

    // about children
    int _incidence = 10;
    float _eruptionTime = round(random(72));
    Bubble[] _children = [];

    // update control
    int _updatedCount = 0;
    boolean _running = true;

    Bubble(){
        super();
    }
    Bubble(int incidence){
        this();
        this._incidence = incidence;
    }

    boolean isRunning(){
        return this._running;
    }

    void update(){
        if(!isRunning()) return;

        // update shape, color, etc.
        this._radius = this._radius - (pow(this._updatedCount, 2) / this._initialRadius);
        this._alpha = pow(this._updatedCount, 3);
        if(this._alpha > 255) this._alpha = 255;

        // breeding time?
        if(this._updatedCount == this._eruptionTime){
            int nextIncidence = ceil(random(this._incidence));
            this._children = new Bubble[nextIncidence];
            for(int i = 0; i < this._children.length; i++) this._children[i] = new Bubble(nextIncidence);
        }

        // update children
        for(int i = 0; i < this._children.length; i++) this._children[i].update();

        // end of life
        if(this._radius < 1){
            boolean stillRunning = false;
            for(int i = 0; i < this._children.length; i++){
                if(this._children[i].isRunning()) stillRunning = true;
            }
            if(!stillRunning){
                this._children = [];
                this._running = false;
            }
        }

        ++this._updatedCount;
    }

    void display(){
        if(!isRunning()) return;

        this._point.add(this._velocity);

        strokeWeight(this._strokeWeight);
        stroke(255);
        fill(this._color[0],this._color[1],this._color[2],this._alpha);
        ellipse(this._point.x, this._point.y, this._radius, this._radius);
        for(int i = 0; i < this._children.length; i++) this._children[i].display();
    }
}

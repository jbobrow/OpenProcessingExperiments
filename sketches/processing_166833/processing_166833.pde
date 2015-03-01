
int sidesDrawn = 3;
int polygonSides = 3;
DEBUG=false;

double polygonInnerRadians = radians((polygonSides-2) * 180 / polygonSides);
double theta = -3.7958733059970178;

double[] dragStart = new double[] {0, 0, theta, sidesDrawn, polygonSides};

void mousePressed() {
    dragStart = new double[] {mouseX, mouseY, theta, sidesDrawn, polygonSides};
}
void mouseDragged() {
    double deltaX = mouseX - dragStart[0];
    double deltaY = mouseY - dragStart[1];
        
    if (mouseButton == LEFT) {
        theta = dragStart[2] + (deltaX/width + 25 * (deltaY/height));
        theta = theta % (2*PI);
    }
}

void keyPressed() {
    if (keyCode > '0' && keyCode < '9') {
        polygonSides = keyCode - '0';
    }
    
    console.info(keyCode);
    
    if (key == '-') {
        sidesDrawn--;
    }
    
    if (key == '=' || key == '+') {
        sidesDrawn++;
    }
}

void triangle(x, y, r) {
    beginShape();
    for (int i=0; i<=sidesDrawn; i++) { vertex(
        x + r * cos((i / polygonSides) * 2*PI),
        y + r * sin((i / polygonSides) * 2*PI)
    );
    }
    
    
    endShape();
}

double cot(r) { return 1 / tan(r) }

void lineMXB(m, b) {
    line(
        -width,
        -m*width + b,
        width,
        m*width + b
    );
}

int solveRPrime(r, theta){
    a = tan(theta);
    c = 0;
    
    b = tan(polygonInnerRadians/2);
    d = -r*tan(polygonInnerRadians/2);
    
    x = (d - c) / (a - b);
    y = a * x + b;
    
    if (DEBUG) {
        stroke(.6,1,1);
        lineMXB(a,c);
    
        stroke(.2,1,1);
        lineMXB(b,d);
    
        ellipse(x,y,5,5);
    }
        
    return sqrt(x*x + y*y);
}

void setup() {  //setup function called initially, only once
  size(1000, 1000);
    
  font = loadFont("FFScala.ttf"); 

  textFont(font); 
}


void draw() {
    colorMode(RGB,255,255,255);
    background(255);
    
    sidesDrawn = min(sidesDrawn, polygonSides);
    
    fill(0);
    textMode(LEFT, CENTER);
    text("sidesDrawn="+sidesDrawn+"; sidesTotal="+polygonSides+"; theta=" + theta, 50, 50);
    noFill();
    
    
    framePeriod = 600;
    
    double sawT = (frameCount%framePeriod)/framePeriod;
    double t = (cos(sawT * 2 * PI)*.5+.5);
    double t2 = (cos(sawT * 20 * PI)*.5+.5);
    
  
    double maxR = width/4;//width / 2 * t;
    double R = maxR;
    
    pushMatrix();
    colorMode(HSB,1,1,1);
    translate(width/2,height/2);
    rotate(sawT * 2 * PI);
    try {
        double rMul = solveRPrime(1, theta);
        if (! DEBUG) {
            for (int c=200; c-->0 && R > 1 && R < width; R = solveRPrime(R, theta)) {
                stroke(abs((t + R/maxR)%1),1,1);
                strokeWeight(1+t*3);
                //fill((t + R/maxR)%1,1,.6);
                rotate(theta);
                triangle(0,0,R);
            }
        } else {
            stroke(0,1,1);
            triangle(0,0,R);
      
            R=solveRPrime(R, theta);
            stroke(.3,1,1);
            rotate(theta);
            triangle(0,0,R);
        }
      
   } catch (e) {}
      popMatrix();
}

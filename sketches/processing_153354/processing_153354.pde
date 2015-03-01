
PFont leagueGothicSmall;
PFont leagueGothicLarge;

PVector center;

float firstRotation, secondRotation, thirdRotation, fourthRotation, fifthRotation;
PVector firstCenter, secondCenter, thirdCenter, fourthCenter, fifthCenter;

color activeColor;
int lockSelected;
float lockRadius;

float lastMouseX;

NamedValue[] values;

String comboString;
String password;

boolean locked;

void setup(){
    size(800,400,P2D);

    leagueGothicSmall = createFont("Arial",26,true); // normally LeagueGothic-Regular.otf
    leagueGothicLarge = createFont("Arial",50,true);

    center = new PVector(width/2,height/2);

    lockRadius = 60;
    lockSelected = 0;

    activeColor = #FF99BB;

    firstRotation = 0;
    secondRotation = 0;
    thirdRotation = 0;
    fourthRotation = 0;
    fifthRotation = 0;

    firstCenter = new PVector(100,200); 
    secondCenter = new PVector(250,300);
    thirdCenter = new PVector(400,200);
    fourthCenter = new PVector(550,300);
    fifthCenter = new PVector(700,200);

    values = new NamedValue[]{
        new NamedValue("0",0),
        new NamedValue("1",0),
        new NamedValue("2",0),
        new NamedValue("3",0),
        new NamedValue("4",0),
        new NamedValue("5",0),
        new NamedValue("6",0),
        new NamedValue("7",0),
        new NamedValue("8",0),
        new NamedValue("9",0)
    };

    comboString = "00000";
    password = "12345";

    locked = true;

}

void draw(){
    background(#000000);

    fill(255);                        
    textFont(leagueGothicSmall,26);  
    textAlign(LEFT);              
    text("LockBox!",10,30); 

    fill(255);
    rect(10,60,100,30);
    fill(0);
    text("reset", 10, 84);

    updateLockRotation();
    drawLocks();

    textFont(leagueGothicLarge,50);
    updateLockReadoutString();
    fill(255);                        
    textAlign(CENTER);              
    text(comboString,width/2,50); 

    if (!locked){
        textAlign(RIGHT);              
        text("UNLOCKED",width-10,50); 
    }

    drawIndicatorTriangles();

    lastMouseX = mouseX;
}

void drawIndicatorTriangles() {

    int xOffset = -10;   // in Java mode, use 15
    int yOffset = -90;   // ... -80
    int triangleRot = 0; // ... 20

    fill(255,33,33);
    pushMatrix();
    translate(firstCenter.x + xOffset, firstCenter.y + yOffset);
    rotate(radians(triangleRot));
    triangle(0,0, 20,0, 10,17.32);
    popMatrix();

    pushMatrix();
    translate(secondCenter.x + xOffset, secondCenter.y + yOffset);
    rotate(radians(triangleRot));
    triangle(0,0, 20,0, 10,17.32);
    popMatrix();

    pushMatrix();
    translate(thirdCenter.x + xOffset, thirdCenter.y + yOffset);
    rotate(radians(triangleRot));
    triangle(0,0, 20,0, 10,17.32);
    popMatrix();

    pushMatrix();
    translate(fourthCenter.x + xOffset, fourthCenter.y + yOffset);
    rotate(radians(triangleRot));
    triangle(0,0, 20,0, 10,17.32);
    popMatrix();

    pushMatrix();
    translate(fifthCenter.x + xOffset, fifthCenter.y + yOffset);
    rotate(radians(triangleRot));
    triangle(0,0, 20,0, 10,17.32);
    popMatrix();
}

void updateLockReadoutString(){
    float targetRot = 0;
    boolean needsUpdate = true;
    switch (lockSelected) {
        case 1: targetRot = firstRotation; break;
        case 2: targetRot = secondRotation; break;    
        case 3: targetRot = thirdRotation; break;    
        case 4: targetRot = fourthRotation; break;    
        case 5: targetRot = fifthRotation; break;    
        default: needsUpdate = false;        
    }

    if (needsUpdate){
        int angleDeg = 360 / values.length;
        int flatTargetRot = round(targetRot);

        if (flatTargetRot < 0){
            flatTargetRot = 360 + flatTargetRot; // garunteed to be < 360
        }
        
        int closestToTop = flatTargetRot / angleDeg;
        if (closestToTop != 0){
            closestToTop = values.length - closestToTop;
        }
        comboString = comboString.substring(0,lockSelected-1) + values[round(closestToTop) % values.length].name + comboString.substring(lockSelected);

        if (comboString.equals(password)){
            locked = false;
        }
        else {
            locked = true;
        }
    }
}

void mousePressed() {
    PVector mousePoint = new PVector(mouseX,mouseY);
    if (circleContainsPoint(firstCenter,lockRadius, mousePoint)) {
        lockSelected = 1;
    }
    else if (circleContainsPoint(secondCenter,lockRadius, mousePoint)) {
        lockSelected = 2;
    }
    else if (circleContainsPoint(thirdCenter,lockRadius, mousePoint)) {
        lockSelected = 3;
    }
    else if (circleContainsPoint(fourthCenter,lockRadius, mousePoint)) {
        lockSelected = 4;
    }
    else if (circleContainsPoint(fifthCenter,lockRadius, mousePoint)) {
        lockSelected = 5;
    }
    else if (rectContainsPoint(10,60,100,30,mousePoint)){
        firstRotation = 0;
        secondRotation = 0;
        thirdRotation = 0;
        fourthRotation = 0;
        fifthRotation = 0;
        comboString = "00000";
        locked = true;
    }
}

void mouseReleased() {
    lockSelected = 0;
}

void drawLocks() {
    noStroke();

    if (lockSelected == 1) fill(activeColor);
    else fill(255);
    spiderGraph(values,1,lockRadius,firstRotation,firstCenter);

    if (lockSelected == 2) fill(activeColor);
    else fill(255);
    spiderGraph(values,1,lockRadius,secondRotation,secondCenter);

    if (lockSelected == 3) fill(activeColor);
    else fill(255);
    spiderGraph(values,1,lockRadius,thirdRotation,thirdCenter);

    if (lockSelected == 4) fill(activeColor);
    else fill(255);
    spiderGraph(values,1,lockRadius,fourthRotation,fourthCenter);

    if (lockSelected == 5) fill(activeColor);
    else fill(255);
    spiderGraph(values,1,lockRadius,fifthRotation,fifthCenter);
}


void updateLockRotation(){
    float rotSlowdown = .5;
    switch (lockSelected) {
        case 1: firstRotation  += (mouseX - lastMouseX)/rotSlowdown; firstRotation  %= 360; break;
        case 2: secondRotation += (mouseX - lastMouseX)/rotSlowdown; secondRotation %= 360; break;    
        case 3: thirdRotation  += (mouseX - lastMouseX)/rotSlowdown; thirdRotation  %= 360; break;    
        case 4: fourthRotation += (mouseX - lastMouseX)/rotSlowdown; fourthRotation %= 360; break;    
        case 5: fifthRotation  += (mouseX - lastMouseX)/rotSlowdown; fifthRotation  %= 360; break;    
        default: break;        
    }
}

void spiderGraph(NamedValue[] values, float maxValue, float radius, float rotationInDegrees, PVector origin) {
    if (values.length < 3){
        return;
    }

    float interiorAngle = radians(360/values.length);     
    float rotationAngle = radians(rotationInDegrees);

    PVector center = new PVector(0, 0);
    PVector edgePoint = new PVector(center.x, center.y-radius);

    pushMatrix();
    translate(origin.x, origin.y);
    rotate(rotationAngle);

    // under layer
    polygon(center,radius,values.length);

    // value layer
    fill(255);
    edgePoint = new PVector(center.x, center.y-radius);
    beginShape();
    for (int i = 0; i < values.length; i++) {
        vertex(edgePoint.x * (values[i].value / maxValue), edgePoint.y * (values[i].value / maxValue));    
        edgePoint = rotatePointAroundPoint(edgePoint,center,interiorAngle);
    }
    endShape(CLOSE);

    // text layer
    edgePoint = new PVector(center.x, center.y-radius);
    textAlign(CENTER);
    for (int i = 0; i < values.length; i++) {
        PVector textPoint = new PVector(edgePoint.x * 1.1, edgePoint.y * 1.1);  
        pushMatrix();
        translate(textPoint.x,textPoint.y); 
        rotate(i * interiorAngle);
        text(values[i].name,0,0);
        popMatrix();
        edgePoint = rotatePointAroundPoint(edgePoint,center,interiorAngle);
    }

    popMatrix();
}

void polygon(PVector origin, float radius, int sides) {
  float angle = radians(360/sides);
    PVector edgePoint = new PVector(origin.x, origin.y-radius);
    beginShape();
    for (int i = 0; i < sides; i++) {
        vertex(edgePoint.x, edgePoint.y);    
        edgePoint = rotatePointAroundPoint(edgePoint,origin,angle);
    }
    endShape(CLOSE);
}

PVector rotatePointAroundPoint(PVector p, PVector center, float angle){
    float rotatedX = cos(angle) * (p.x - center.x) - sin(angle) * (p.y - center.y) + center.x;
    float rotatedY = sin(angle) * (p.x - center.x) + cos(angle) * (p.y - center.y) + center.y;
    return new PVector(rotatedX,rotatedY);
}

PVector rotatePointAroundPointDeg(PVector p, PVector center, float angleDegrees){
    float rads = radians(angleDegrees);
    return rotatePointAroundPoint(p,center,rads);
}

boolean rectContainsPoint(int rX, int rY, int rWidth, int rHeight, PVector p)  {
  return (p.x >= rX && p.y <= rX+rWidth && p.y >= rY && p.y <= rY+rHeight);
}

boolean circleContainsPoint(PVector circleCenter, float radius, PVector p) {
  return dist(circleCenter.x, circleCenter.y, p.x, p.y) < radius;
}

public class NamedValue {
    String name;
    float value;
    public NamedValue (String name, float value) {
        this.name = name;
        this.value = value;
    }
}





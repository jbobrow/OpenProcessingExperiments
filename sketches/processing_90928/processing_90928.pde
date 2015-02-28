
float angnoise, radiusnoise, angle, radius, strokeCol, xnoise, ynoise;        
int strokeChange;

void setup() {
    size(500, 300); 
    smooth();                
    frameRate(30);            
    background(255);    
    noFill();  
    angle = -PI/2;                
    strokeCol = 254;        
    strokeChange = -1;
    angnoise = random(10);        
    radiusnoise = random(10);    
    xnoise = random(10);        
    ynoise = random(10);
}

float customNoise(float value) {                               
   float retValue = pow(sin(value), 3);
   return retValue; 
}

void spiral(){
    int centX = 250;
    int centY = 150;
    float x, y;
    for (int i = 0; i<100; i++) {
        float lastx = -999;
        float lasty = -999;
        float radiusNoise = random(10);
        float radius = 10;
        stroke(random(20), random(50), random(70), 20);
        int startangle = int(random(360));                                  
        int endangle =  1440 + int(random(1440));                           
        int anglestep =  5 + int(random(3));
        for (float ang = startangle; ang <= endangle; ang += anglestep) {                  
            radiusNoise += 0.01;
            radius += 0.5;
            float thisRadius = radius + (noise(radiusNoise) * 200) - 100;
            
            float rad = radians(ang);                                  
            x = centX + (thisRadius * cos(rad));
            y = centY + (thisRadius * sin(rad));
            if (lastx > -999) {
                line(x,y,lastx,lasty);
            }
            lastx = x;
            lasty = y;  
        }
    }
}

void circle_custom_noise(){
    float radius = 100;
    int centX = 250;
    int centY = 150;
    stroke(0, 30);
    noFill();
    ellipse(centX,centY,radius*2,radius*2);
    stroke(20, 50, 70);
    strokeWeight(1);
    float x, y;  
    float noiseval = random(10);                                
    float radVariance, thisRadius, rad;
    beginShape(); 
    fill(20, 50, 70, 50);
    for (float ang = 0; ang <= 360; ang += 1) {
        noiseval += 0.1;
        radVariance = 30 * customNoise(noiseval);
        thisRadius = radius + radVariance;
        rad = radians(ang); 
        x = centX + (thisRadius * cos(rad));
        y = centY + (thisRadius * sin(rad));
        curveVertex(x,y);
    }
    endShape();
}


void wave_clock(){  
    angnoise += 0.0001;                
    radiusnoise += 0.005;
    xnoise += 0.005;                        
    ynoise += 0.005;

    radius = (noise(radiusnoise) * 550) +1;
    angle += (noise(angnoise) * 6) - 3;
    
    if (angle > 360) { angle -= 360; }       
    if (angle < 0) { angle += 360; }
    
    float centerX = width/2 + (noise(xnoise) * 100) - 50;    
    float centerY = height/2 + (noise(ynoise) * 100) - 50;


    float rad = radians(angle);
    float x1 = centerX + (radius * cos(rad));  
    float y1 = centerY + (radius * sin(rad)); 
    
    float opprad = rad + PI; 
    float x2 = centerX + (radius * cos(opprad));
    float y2 = centerY + (radius * sin(opprad));
    
    strokeCol += strokeChange;            
    if (strokeCol > 254) { strokeChange = -1; }    
    if (strokeCol < 0) { strokeChange = 1; }    
    
    stroke(strokeCol, 60);
    strokeWeight(1);    
    line(x1, y1, x2, y2);
}

void draw() {
    wave_clock();
}

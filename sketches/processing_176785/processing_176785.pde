
int num = 50;
float friction = 1;
float [] xspeed;
float [] yspeed;
float R = random(0, 255);
float Rchange = random(0.1,0.4);
float G = random(0, 100);
float Gchange = random(0.1,0.4);
float B = random(0, 255);
float Bchange = random(0.1,0.4);
PVector [] dots;

void setup(){
    size (400, 400);
    dots = new PVector [num];
    xspeed = new float[num];
    yspeed = new float[num];
    setDots(dots);
}

void setDots(PVector [] d){
    
     for (int i=0; i < d.length; i++){
        xspeed[i] = random(-1, 1);
        yspeed[i] = random(-1, 1);
        PVector pos = new PVector (random(100,width - 100), random(100,height - 100));
        d[i] = pos;
     } 
}

void draw(){
    smooth();
    background(0);
    drawValue();
    drawConnection();
}

void drawValue(){    
    for (int i = 0; i < dots.length; i++){
        if(dots[i].x >=width - 50 || dots[i].x <= 50){
           if(xspeed[i] >= 0.3){
             xspeed[i] *= friction;
           }
           float dx = width/2 - dots[i].x;
           float dy = height/2 - dots[i].y;
           float ax = dx * 0.001;
           float ay = dy * 0.001;
           xspeed [i] += ax * random(0.3,0.6);
           yspeed [i] += ay * random(0.3,0.6);
        }
        
        if(dots[i].y >=height-50 || dots[i].y <= 50){
            if(yspeed[i] >= 0.3){
               yspeed[i] *= friction;
            }
             float dx = width/2 - dots[i].x;
             float dy = height/2 - dots[i].y;
             float ax = dx * 0.001;
             float ay = dy * 0.001;
             xspeed [i] += ax * random(0.3,0.6);
             yspeed [i] += ay * random(0.3,0.6);   

        }
        
        dots[i].x += xspeed[i];
        dots[i].y += yspeed[i];
        addDots(dots[i].x, dots[i].y);
    }
}

void addDots(float dx, float dy){
     pushMatrix();
     fill (0,100);
     ellipse (dx, dy, 3, 3);
     popMatrix();    
}

void drawConnection(){
     R += Rchange;
     if(R > 254 || R < 2) Rchange *= -1;
     G += Gchange;
     if(G > 254 || G < 2) Gchange *= -1;
     B += Bchange;
     if(B > 254 || B < 2) Bchange *= -1;
     
     for (int i = 0; i < dots.length; i++){
         float x1 = dots[i].x;
         float y1 = dots[i].y;
         for(int j=0; j<dots.length; j++){
            float x2 = dots[j].x;
            float y2 = dots[j].y;
            float distance = dist(x1, y1, x2, y2);
            if(distance < 100){
              float m = map(distance, 50, 100, 100, 0);
              stroke(R, G, B, m);
              line(x1, y1, x2, y2);
            }  
         }
     }
}


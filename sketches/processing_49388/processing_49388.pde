
    float [] ind = {.5,.5};

    void setup(){
    size (300,100);
    show();
    }
    
    void draw(){
    }
    void show(){
    color a = color(random(255),random(255),random(255));
    color b = color(random(255),random(255),random(255));
    float r1 = red(a);
    float g1 = green(a);
    float b1 = blue(a);
    float r2 = red(b);
    float g2 = green(b);
    float b2 = blue(b);
    color c =  color((r1*ind[0]+r2*ind[1]),(g1*ind[0]+g2*ind[1]),(b1*ind[0]+b2*ind[1]));
    background(c);
    noStroke();
    fill(a);
    rect(0,0,100,100);
    fill(b);
    rect(100,0,100,100);
    }
    
    void mousePressed(){
     show(); 
    }

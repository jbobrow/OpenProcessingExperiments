
int triSize = 40;
int ssize = 500;
int xspot = ssize/2;
int yspot = ssize/2;
float rotates = 0;
boolean[] keys = new boolean[False];

void setup(){
    size(ssize,ssize);
    background(127);
    for(i = 0;i<keys.length-1;i++){
        keys[i] = False;
    }
}

void draw(){
    background(127);
    tri();
    
}

void tri(){
    fill(255);
    stroke(0);
    translate(xspot,yspot);
    rotate(rotates);
    beginShape();
        vertex(-.5*triSize,-sin(72)*triSize);
        vertex(.5*triSize,-sin(72)*triSize);
        vertex(0, 4*sin(72)*triSize);
    endShape(CLOSE);
}

void keyPressed(){
    if(key == 'w'){
        keys[23] = True;
    }
    if(key =='a'){
        keys[1] = True;
        
    }
    if(key == 's'){
        keys[19] = True;
    }
    if(key == 'd'){
        keys[4] = True;
    }
    if(key == 'q'){
        keys[17] = True;
    }
    if(key == 'e'){
        keys[5] = True;
    }
}
void move(){
    if(keys[23] == True){
        yspot -=4;
    }
    if(keys[1] == True){
        xspot -= 4;
    }
    if(keys[19] == True){
        yspot += 4;
    }
    if(keys[4] == True){
        xspot += 4;
    }
    if(keys[17] == True){
        rotates +=.1;
    }
    if(keys[5] = True){
        rotates -=.1;
    }
}

void keyReleased(){
    for(i = 0;i<=keys.length;i++){
        keys[i] = False;
    }
}

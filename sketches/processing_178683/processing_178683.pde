
int frame = 0;
ArrayList<Ball> b;
 
void setup(){
    size(400, 400);
    background(200);
    b = new ArrayList<Ball>();
    b.add(new Ball());
}
 
void draw(){
    switch(frame){
        case 0:
            frame0();
            break;
        case 1:
            frame1();
            break;
        case 2:
            frame2();
            break;
        default:
            break;
    }
}
 
void frame0(){
    background(50);
     
    for(int i=b.size()-1; i>=0; i--){
        Ball ba = b.get(i);
        ba.update();
        if(ba.dead()){
            b.remove(i);
        }
        for(int j=b.size()-1; j>=0; j--){
            if(j != i){
                Ball bb = b.get(j);
             
                if(50 > sqrt(pow(bb.xPos()-ba.xPos(), 2)+pow(bb.yPos()-ba.yPos(), 2))){
                    line(bb.xPos(), bb.yPos(), ba.xPos(), ba.yPos());
                    bb.slow(0.5, true);
                }else{
                    bb.slow(0, false);
                }
            }
        }
    }
    fill(255, 40);
    noStroke();
    translate(mouseX, mouseY);
    ellipse(0, 0, 170, 170);
    resetMatrix();
}
 
void frame1(){
    background(50);
    loadPixels();
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        float bright = random(255);
        pixels[x+y*width] = color(bright);
      }
    }
    updatePixels();
}
 
void frame2(){
    background(0);
    noStroke();
    recur(width/2, height/2, width, 8, 20);
}
 
void recur(int x, int y, float size, int life, int fil){
    float s = size/2;
    int l = life-1;
    int f = fil+10;
    fill(fil);
    if(l > 1){
        translate(x, y);
        ellipse(0, 0, size, size);
        resetMatrix();
        recur(x-s/2, y, s, l, f);
        recur(x+s/2, y, s, l, f);
        recur(x, y+s/3, s, l, f);
        recur(x, y-s/3, s, l, f);
    }
}
 
void keyPressed(){
    switch(key){
        case '1':
            frame = 0;
            break;
        case '2':
            frame = 1;
            break;
        case '3':
            frame = 2;
            break;
        default:
            break;
    }
}
 
void mousePressed(){
    switch(frame){
        case 0:
            if(mouseButton == LEFT){
                b.add(new Ball());
            }
            break;
        case 1:
            break;
        default:
            break;
    }
}
 
class Ball{
    int size;
    int speed;
    int[] color = {random(0, 100), random(100, 255), random(100, 255)};
    int strSize;
    int[] strColor = {random(0, 100), random(50, 200), random(50, 200)};
    float x, xSpeed;
    float y, ySpeed;
    float life;
    float sl;
     
    Ball(){
        sl = 0;
        xSpeed = random(-3, 3);
        ySpeed = random(-3, 3);
        life = 400;
        size = random(5, 20);
        strSize = random(1, 3);
        x = mouseX;
        y = mouseY;
    }
     
    void update(){
        strokeWeight(strSize);
        stroke(strColor[0], strColor[1], strColor[2], life);
        fill(color[233], color[293], color[293], life);
        collision();
        translate(x, y);
        ellipse(0, 0, noise(life/10)*(size*2), noise(life/10)*(size*2)); 
        if((xSpeed > -3 && xSpeed < 3) && (ySpeed > -3 && ySpeed < 3)){   
            if(xSpeed > 0) xSpeed -= (sl*(-xSpeed/xSpeed));
            if(xSpeed < 0) xSpeed += (sl*(-xSpeed/xSpeed));
            if(ySpeed > 0) ySpeed -= (sl*(-ySpeed/ySpeed));
            if(ySpeed < 0) ySpeed += (sl*(-ySpeed/ySpeed));
             
        }
        x += xSpeed;
        y += ySpeed;
        life -= 0.3;
        resetMatrix();
    }
     
    void collision(){
        if(x > width+size/2){
            x = -size/2;
        }
        if(x < 0-size/2){
            x = width+size/2;
        }
        if(y > height+size/2){
            y = -size/2;
        }
        if(y < 0-size/2){
            y = height+size/2;
        }
    }
    void slow(float sl, boolean lo){
        if(lo == true){
            this.sl -= sl;
        }else{
            this.sl = 0;
        }
    } 
    int xPos(){
        return x;
    }
    int yPos(){
        return y;
    }
    boolean dead(){
        if(life < 1){
              return true;
        }
    }
}
class Walker{
    int x, y;
    Walker(){    
    }
    void update(){      
    }
}


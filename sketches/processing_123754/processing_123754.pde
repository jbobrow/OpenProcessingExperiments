
int[] rad ={0,PI/3,PI/3*2,PI,PI/3*4,PI/3*5};
int[] rad2 ={PI/6,PI/6*3,PI/6*5,PI/6*7,PI/6*9,PI/6*11};
int r = 20,r2 = 40;

void setup(){
    size(256,256);
    frameRate(10);
}

void draw(){
    fill(0,100);
    noStroke();
    rect(0,0,width,height);
    stroke(255,0,255,50);
    hexagon(4,width/2,height/2);
}

void hexagon(int level, float cx, float cy){
    //色塗り
    if(mousePressed && dist(mouseX,mouseY,cx,cy)<40)fill(255);
    else if(random(11)<1)fill(255,0,255,128);
    else noFill();
    
    beginShape();
    for(int i = 0; i<rad.length;i++){
      float x = cx+r*cos(rad[i]);
      float y = cy+r*sin(rad[i]);
      vertex(x,y);
    }
    endShape(CLOSE);
    
    //再帰
    if(level>1){
        for(int i = 0;i<rad2.length;i++){
            if(random(5)<1){
                float x = cx+r2*cos(rad2[i]);
                float y = cy+r2*sin(rad2[i]);
                hexagon(level-1,x,y);
            }
        }
    }
}


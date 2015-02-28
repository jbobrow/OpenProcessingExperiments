
void setup(){
        size(500,500);
        smooth();
        noStroke();
        frameRate(10);
    }
 
    void draw(){
        background(255);
 
        for(int i=50; i>0; i--){
            pushMatrix();
            translate(width/2,height/2);
            rotate(radians((frameCount-1)*i));
            fill((i%2)*100,12,60);
            ellipse(0, 0, 10+(i*10), 30+(i*20));
            popMatrix();
        }
    }



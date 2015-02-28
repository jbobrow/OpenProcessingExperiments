
int counterX = 0;
int counterY = 0;
float[] colorOptions = {244, 35, 0, 130, 200};
void setup(){  
    size(800,800);
    background(255,255,255,100);
    stroke(0,0,0,100);
    strokeWeight(1); 
} 
void draw(){
    int counterInt = (counterX / 30); 
    fill(colorOptions[counterInt % 5], colorOptions[counterInt %4], colorOptions[counterInt % 2], 100);
    rect(counterX + 30, counterY + 30, 20, 20);     
    counterX += 30;
    if (random> 10){
        fill(random(255), colorOptions[counterInt % 4], colorOptions[counterInt % 2], 100);
    }
    if ((counterX + 60) > width){
       counterY += 30;
       counterX = 0;
}
    if (counterX == 0 && counterY + 60 > height){
       noLoop();
    }
}

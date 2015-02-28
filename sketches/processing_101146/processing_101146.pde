
void setup(){
    size(800, 500, P3D);    
    frameRate(5);
    background(0);
    
    strokeWeight(1);
    noFill();
} 
 
var detail = 1;
bool direction = false;
void draw(){
    strokeWeight(1);
    background(); 
    stroke(80, 80, 100);
     
    translate(width/2, height/2, 0);
    rotateY(PI + (frameCount)*.1);
    
    sphereDetail(detail);
    if(!direction){
        detail++;
        direction = detail > 18;
    }else{
        detail--;
        if(detail < 0){
          direction = false;   
        }
    }
    
    box(250);
    
    stroke(detail*100, detail*100, detail*100);
    sphere(100);
    
    stroke(random(255), random(255), random(255));
    line(-200, -200, -200, 200, 200, 200);
    line(-200, 200, -200, 200, -200, 200);
    line(-200, 200, 200, 200, -200, -200);
    line(200, 200, -200, -200, -200, 200);
    
}

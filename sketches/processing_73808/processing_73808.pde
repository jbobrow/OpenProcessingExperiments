
float pointSize = 1.0;
float speed = 0.005;  
void setup() {
  size(1200, 620);
}

void draw() {
    //background(255,255,255);
    fill(0,0,0);
    noStroke();

    pointSize=pointSize+speed;
    
    for(int i = 0; i < height*width; i= i+100){
        rect(random(width),random(height),pointSize,pointSize);
    }
   
    if( pointSize >= 3.0 || pointSize <=1 ){
        speed=speed*-1.0;

    }

}



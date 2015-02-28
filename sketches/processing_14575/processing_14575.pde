
float scale;

void setup() {
  size(450,450);
  background(0);
  scale=width/10;
}

void draw(){
  
  for(int i=0; i<scale; i++){
    line(millis()%random(450), millis()%random(450), millis()%random(450), millis()%random(450));
    strokeWeight(millis()%random(1,5));
    stroke(random(255));
  }
}

                
                

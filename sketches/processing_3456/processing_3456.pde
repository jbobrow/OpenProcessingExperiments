
void setup(){size(300,300);}void draw(){for (int i=0;i<50;i++){rotate(random(PI/2));fill(x());float k=random(20);ellipse(x(),x(),k,k);}filter(BLUR,4);}float x(){return random(255);}


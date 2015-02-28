
float xs;
float t=0, j=0;
void setup() {
        size(640, 480);
        frameRate(60);
        noiseDetail(3);
        smooth();
        fill(0,200,160,30);
        stroke(190);
        xs = width/60;
}
 
void draw() {
        background(255);
        for (int i = 1 ; i <=2 ; ++i){
           beginShape();
           for (float x =-xs; x <= width+xs; x += xs) {
             curveVertex(x, height*2*noise(x*0.002+t*0.618,t+i*0.3)-height/2 );
           }
           vertex(width, height);
           vertex(0, height);
           endShape();
           t = t + tan(noise(j)*PI/2)*0.001;
           println(tan(noise(j)*PI/2));
           j=j+0.003;
        }
}



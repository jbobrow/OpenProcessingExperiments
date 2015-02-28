
float tetik;float tetikSpeed = frameRate;void setup(){
size(700, 650);smooth();
colorMode(HSB, 300);
background(0);}float del= random(20);
void draw(){fill(0,72);noStroke();
rect(0, 0, width, height);float aci=PI;float size = 250;for (int n=1; n<255; n++){stroke(n%2==0?color(255, 100+200, 50+200, n+100):color(50, 100, 255, 255-n));stroke(255-n);fill(n);pushMatrix();translate(width*0.5, height*0.5);stroke(PI/aci/100*75, 150*300/aci, 400,70);rotate(aci);strokeWeight(2.01);line(0, 0, size*(1.0f-1*(float)n/255),size*(1.0f-1*(float)n/155)); popMatrix();aci += del;}del += 0.00001;}void mousePressed(){del=random(20);}

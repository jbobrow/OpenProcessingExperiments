
void setup(){
size(600,600);
colorMode(HSB,360);
smooth();
}


void draw(){
  background(0);


translate(20,sin(frameCount/30.0)*100);
strokeWeight(10);
fill(0);
stroke(200+frameCount%50, 360,360);
ellipse(200,200,30+frameCount%100,30);

translate(30,sin(frameCount/30.0)*100);
strokeWeight(10);
fill(0);
stroke(190+frameCount%50, 360,360);
ellipse(200,200,30,30);

//pushMatrix();
translate(20,sin(frameCount/30.0)*100);
strokeWeight(5);
fill(0);
stroke(170+frameCount%50, 360,360);
ellipse(200,200,30+frameCount%90,30);
//popMatrix();


translate(30,sin(frameCount/30.0)*100);
strokeWeight(10);
fill(0);
stroke(160+frameCount%50, 360,360);
ellipse(200,200,30+frameCount%80,30);

pushMatrix();
translate(30,sin(frameCount/30.0)*100);
strokeWeight(5);
fill(0);
stroke(210+frameCount%50, 360,360);
ellipse(200,200,30+frameCount%70,30);
popMatrix();
}


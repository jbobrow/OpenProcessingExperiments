
int height = 600;
int width = 600;
smooth();
size(width,height, "processing.core.PGraphicsRetina2D");
background(256,256,256);
colorMode(HSB, 100);
//strokeWeight(0.001);
noStroke();
for(float t = 0.0; t< (2.85)*PI; t += 0.005){
//fill(128*(1 + 0.01*floor(100*cos(t))),128*(1 + abs(cos(t+3*PI/4))),128*(1 + abs(cos(t+PI/2))),17 );
fill(20,0,10 ,8);
ellipse(width/2+height/3*cos(3 * t),height/2 + height/3 * sin( 2* t) + 6,height/11 * (1+ sin(4 * t)),height/11 * (1+ sin(4 * t)));

fill(t*100/((3)*PI),100,100 ,60);
ellipse(width/2+height/3*cos(3 * t),height/2 + height/3 * sin( 2* t),height/12 * (1+ sin(4 * t)),height/12 * (1+ sin(4 * t)));

}


import toxi.geom.*;
import toxi.geom.mesh.*;

WiggleField w;
float t;

void setup()
{
    size(600,600,P3D);
    smooth();
    w=new WiggleField(30.0,40,100);
    smooth();
    background(255);
    shininess(16);
    directionalLight(255,255,255,0,1,-1);
    specular(255);
}

void draw()
{
    background(0);
    lights();
    t+=0.004;
    translate(width/2,height,0);
    rotateY(PI);
    rotateX(PI+noise(t)*0.5);
    translate(0,0,-1800);
    scale(1.0,noise(t*2+0.2)+0.8,1.0);
    noStroke();
    w.update();
    w.draw();

    if(random(1.0) > 0.995)w.addGauss(random(0.5,1.3),random(-1,1));
    if(random(1.0) > 0.9)w.addSpike(random(0.5,1.3));
    if(random(1.0) > 0.995)w.addNoise(random(0.3,0.9));
    if(random(1.0) > 0.995)w.addRandom(random(0.3,0.9));
    if(random(1.0) > 0.99)w.addSine(random(3,6),random(0.3,0.9));

}

void keyPressed()
{
    if(key == 'a')w.addGauss(random(0.5,1.3),random(-1,1));
    if(key == 's')w.addSpike(random(0.5,1.3));
    if(key == 'd')w.addNoise(random(0.3,0.9));
    if(key == 'f')w.addRandom(random(0.3,0.9));
    if(key == 'g')w.addSine(random(1,9),random(0.3,0.9));
}



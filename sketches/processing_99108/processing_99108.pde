
/*
Author：Yuan Ren
Blog: www.mynameisryan.net
*/
Particle[] particles;
int numParticles =50;
float distance=230;
float maxDistance=100;
float minDistance=10;
color particleColor=0x88003c68;
 
void setup(){
    size(250,250);
    particles=new Particle[numParticles];
    for (int i=0; i<numParticles; i++) {
        float radius=random(distance);
        float radian=random(TWO_PI);
        float r=50+random(100);
        particles[i] = new Particle(radius*cos(radian),radius*sin(radian),r);
    }
}
void draw(){
    background(0);
    drawCricle();
    drawLines();
    drawPlayStop();
    drawP();
    drawFourCorner();
}
//绘制粒子的大圆和中心圆
void drawCricle() {
    for (int i=0; i<numParticles; i++) {
        particles[i].update();
        noStroke();
        fill(particleColor);
        ellipse(particles[i].x,particles[i].y,particles[i].r,particles[i].r);
 
        stroke(255,200);
        strokeWeight(4);
        point(particles[i].x,particles[i].y);
    }
}
//绘制粒子之间的连线
void drawLines() {
  stroke(255,150);
  strokeWeight(.5);
  for (int i=0; i<numParticles; i++) {
    for(int j=i+1; j<numParticles; j++){
        float d = dist(particles[i].x,particles[i].y,particles[j].x,particles[j].y);
        if (d<maxDistance && d>minDistance) {
            line(particles[i].x, particles[i].y, particles[j].x, particles[j].y);
        }
    }
  }
}
//绘制字母"P"
void drawP(){
    fill(255);
    beginShape();
        vertex(75,37);
        vertex(95,37);
        vertex(95,212);
        vertex(75,212);
    endShape(CLOSE);
    beginShape();
        vertex(95,37);
        vertex(145,37);
        bezierVertex(165,37,165,57,165,57);
        vertex(165,140);
        bezierVertex(165,160,145,160,145,160);
        vertex(95,160);
        vertex(95,140);
        vertex(140,140);
        bezierVertex(145,140,145,135,145,135);
        vertex(145,62);
        bezierVertex(145,57,140,57,140,57);
        vertex(95,57);  
    endShape(CLOSE);
}
//绘制播放和停止图标
void drawPlayStop(){
    noStroke();
    pushMatrix();
        translate(153,200);
        fill(255);
        ellipse(0,0,32,32);
        fill(0);
        translate(2,0);
        triangle(-6,-6,-6,6,5,0);
 
        translate(35,0);
        fill(255);
        ellipse(0,0,32,32);
        fill(0);
        rectMode(RADIUS);
        rect(0,0,5,5);
    popMatrix();
}
//绘制圆角矩形的负形
void drawFourCorner(){
    pushMatrix();
    for(int i=0;i<4;i++){
        translate(width,0);
        rotate(HALF_PI);
        drawCorner();
    }
    popMatrix();
}
void drawCorner(){
    fill(255);
    beginShape();
        vertex(0,0);
        vertex(40,0);
        bezierVertex(0,0,0,40,0,40);
    endShape();
}
//粒子类
class Particle{
    float vx=0;
    float vy=0;
    float x=0;
    float y=0;
    float r=1;
 
    Particle(float x,float y,float r){
        this.x=x;
        this.y=y;
        this.r=r;
        vx=random(-.5,.5);
        vy=random(-.5,.5);
    }
    void update(){
        x+=vx;
        y+=vy;
        if(sqrt(x*x+y*y)>distance){
            vx=-vx;
            vy=-vy;
        }
    }
}

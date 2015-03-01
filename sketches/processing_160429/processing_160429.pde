
PVector p1, p2, p3, p4, p5, p6, p7, p8, p9, p10;
float t;
float soma=0.01;

void setup()
{
    size(700, 400);
    colorMode(HSB, 100);
    background(100);
    p1=new PVector(50, 350);
    p2=new PVector(250, 50);
    p3=new PVector(450, 350);
    p4=new PVector(650, 50);
    p5=new PVector(0, 0);
    p6=new PVector(0, 0);
    p7=new PVector(0, 0);
    p8=new PVector(0, 0);
    p9=new PVector(0, 0);
    p10=new PVector(0, 0);
}

void draw()
{
    background(100);
    noFill();
    stroke(0, 100, 100);
    strokeWeight(3);
    bezier(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y);
    strokeWeight(1);
    if(t>1 || t<0)
    {
        soma=-soma;
    }
    t=t+soma;
    p5.x=lerp(p1.x, p2.x, t);
    p5.y=lerp(p1.y, p2.y, t);
    p6.x=lerp(p2.x, p3.x, t);
    p6.y=lerp(p2.y, p3.y, t);
    p7.x=lerp(p3.x, p4.x, t);
    p7.y=lerp(p3.y, p4.y, t);
    p8.x=lerp(p5.x, p6.x, t);
    p8.y=lerp(p5.y, p6.y, t);
    p9.x=lerp(p6.x, p7.x, t);
    p9.y=lerp(p6.y, p7.y, t);
    p10.x=lerp(p8.x, p9.x, t);
    p10.y=lerp(p8.y, p9.y, t);
    stroke(0, 100, 100);
    line(p1.x, p1.y, p2.x, p2.y);
    line(p2.x, p2.y, p3.x, p3.y);
    line(p3.x, p3.y, p4.x, p4.y);
    line(p5.x, p5.y, p6.x, p6.y);
    line(p6.x, p6.y, p7.x, p7.y);
    line(p8.x, p8.y, p9.x, p9.y);
    fill(0);
    noStroke();
    ellipse(p1.x, p1.y, 5, 5);
    ellipse(p2.x, p2.y, 5, 5);
    ellipse(p3.x, p3.y, 5, 5);
    ellipse(p4.x, p4.y, 5, 5);
    ellipse(p5.x, p5.y, 5, 5);
    ellipse(p6.x, p6.y, 5, 5);
    ellipse(p7.x, p7.y, 5, 5);
    ellipse(p8.x, p8.y, 5, 5);
    ellipse(p9.x, p9.y, 5, 5);
    fill(0, 100, 100);
    ellipse(p10.x, p10.y, 10, 10);
}

void keyPressed()
{
    if(keyCode==RIGHT)
    {
        t=0;
        background(100);
        p1.set(random(20, 120), random(20, height-20));
        p2.set(random(p1.x+100, p1.x+200), random(20, height-20));
        p3.set(random(p2.x+100, p2.x+200), random(20, height-20));
        p4.set(random(p3.x+100, p3.x+200), random(20, height-20));
    }
}

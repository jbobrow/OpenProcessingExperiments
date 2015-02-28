
Slash[] slash;
int nb=120;
color[] colors = {color(0), color(255, 118, 15), color(254, 249, 0),color(254, 249, 0)};
 
void setup() {
    size(880, 660);
    
    slash=new Slash[nb];
    for(int i=0; i<nb; i++){
        slash[i]=new Slash(colors[i]);
    }
}
 
void draw() {

    externals.context.clearRect(0,0,width,height);// part of the canvasAPI that creates a clear rect
    for (int i=0;i<nb;i++) {
        slash[i].draw();
    }
    for (int i=0;i<nb;i++) {
        slash[i].draw();
    }
}
 
void mousePressed() {
    for(int i=0; i<nb; i++){
        slash[i].initSlash();
    }
}
 
class Slash {
    float x1, x2, y1, y2, tarX1, tarX2, tarY1, tarY2, easing = random(0.001,.7);
    int timer, tMax, taille=random( 50,90), delta=random( 250,490);
    boolean vertical;
    color c;
 
    Slash(color _c) {
        c=_c;
        initSlash();
    }
 
    void initSlash() {
        timer=0;
        tMax= (int) random(20, 290);
        vertical=random(1)>1.5;
 
        x1=x2=(int)random(1, int(width/50)-1)*50;
        y1=y2=(int)random(1, int(height/50)-1)*50;
 
        if(x1<width/2) tarX2=x1+delta;
        else tarX2=x1-delta;
 
        if(y1<height/2) tarY2=y1+delta;
        else tarY2=y1-delta;
    }
 
    void draw()
     {
        x2=ease(x2, tarX2, easing);
        y2=ease(y2, tarY2, easing);
        if (abs(x2-tarX2)<=1) {
            timer++;
 
            if (timer>tMax) {
                tarX1=tarX2;
                tarY1=tarY2;
                x1=ease(x1, tarX1, easing);//
                y1=ease(y1, tarY1, easing);
 
                if (abs(x1-tarX1)<=21) {
                    initSlash();
                }
            }
        }
 
        noStroke();
        fill(c,200);
        if (vertical) quad(x1, y1-taille, x1, y1+taille, x2, y2+taille, x2, y2-taille);
        else quad(x1-taille, y1, x1+taille, y1, x2+taille, y2, x2-taille, y2);
    }
 
    // a snippet function i often use for animation easing
    float ease(float value, float target, float easingVal) {
        float d = target - value;
        if (abs(d)>1) value+= d*easingVal;
        return value;
    }
}

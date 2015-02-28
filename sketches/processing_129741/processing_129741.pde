
//HW3 Stephanie Jeong yujeongj copyright 2014
float x,y;
float wd,ht;
float xDist, yDist;
float easingCoef;

void setup()
{
    size(400,400);
    noCursor();
    background(219,109,80);
    easingCoef=.1;
    wd=22;
    ht=22;
}

void draw()
{
    background(219,109,80);
    x=x+xDist*easingCoef;
    y=y+yDist*easingCoef;
    xDist=mouseX-x;
    yDist=mouseY-y;
    wd=300;
    ht=300;

      
        //face
        fill(241,216,181);
        noStroke();
        ellipse(x+.25*wd, y+.25*ht,.25*wd,.25*ht);
        
        //ears
        ellipse(x+.125*wd, y+.25*ht,.05*wd,.075*ht);
        ellipse(x+.375*wd, y+.25*ht,.05*wd,.075*ht);
        
        //moustache
        fill(194,187,168);
        quad(x+.2*wd, y+.325*ht, x+.225*wd, y+.3*ht, x+.275*wd, y+.3*ht, x+.3*wd, y+.325*ht);
        
        
        //nose(initial "J")
        fill(241,216,181);
        stroke(167,147,126);
        strokeWeight(3);
        beginShape();
        curveVertex(x+.25*wd,y);
        curveVertex(x+.25*wd,y+.225*ht);
        curveVertex(x+.26*wd,y+.3*ht);
        curveVertex(x+.235*wd,y+.29*ht);
        curveVertex(x+.225*wd,y+.275*ht);
        endShape();
        
        //glasses
        stroke(93,107,116);
        strokeWeight(5);
        rect(x+.15*wd, y+.225*ht, .075*wd, .05*ht);
        rect(x+.275*wd, y+.225*ht, .075*wd, .05*ht);
        line(x+.275*wd,y+.25*ht,x+.275*wd,y+.25*ht);
        
        //eyes
        fill(44,52,59);
        noStroke();
        ellipse(x+.1875*wd, y+.25*ht,.015*wd,.015*ht);
        ellipse(x+.3125*wd, y+.25*ht,.015*wd,.015*ht);
        
        //hair
        fill(194,187,168);
        beginShape();
        curveVertex(x,y);
        curveVertex(x+.1*wd,y+.16*ht);
        curveVertex(x+.25*wd,y+.2*ht);
        curveVertex(x+.36*wd,y+.16*ht);
        curveVertex(x+.3*wd,y+.115*ht);
        curveVertex(x+.1*wd,y+.16*ht);
        curveVertex(x+.2*wd,y+.16*ht);
        curveVertex(x+.1*wd,y+.16*ht);
        curveVertex(x,y);
        endShape();

}



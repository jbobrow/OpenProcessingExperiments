
void setup(){
    sizex=500;
    sizey=500;
    size(sizex,sizey);
    rx=50;
    ry=50;
    ex=350;
    ey=450;
    
    rectMode(CENTER);
    frameRate(2);
    count=20;
    targetVel=20;
    h=ey-ry;                    //円のy軸から四角のy軸を引いた値    400
    d=ex+targetVel*count-rx;    //円のx軸+20*20-四角のy軸           700
    dh=h/count;                 //円のy軸から四角のy軸を引いた値/20 20
    dd=d/count;　　　　　　　　 //円のx軸+20*20-四角のy軸/20        35
}

void draw(){
    background(225);
    rect(rx,ry,20,20);
    ellipse(ex,ey,20,20);
    if(count!=0){
        count--;
        rx+=dd;
        ry+=dh;
        ex+=targetVel;
        
        rx%=sizex;
        ry%=sizey;
        ex%=sizex;
        ey%=sizey;
    }
}

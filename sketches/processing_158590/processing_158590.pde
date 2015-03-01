
void setup(){
    size(700,600);
    background(10,200,200);
}
void draw(){
    noFill();
    stroke(255,150,60);
    line(490,20,10,10);
    line(500,300,30,250);
    stroke(0,0,0);
    for(int i=0; i<100; i = i+1){
        float r= random(120);
        noFill();
        bezier(100+i,2*(r+(r+25)),r+30,r+(i+5),600,20+r,100*r,400);
        if(r<1){
            fill(random(200),random(250),random(255));
            rect(30,450,60,60);
        }
    }
}

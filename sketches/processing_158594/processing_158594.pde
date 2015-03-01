
void setup(){
size(700,500);
}
    void draw(){
lights();
    fill(255,50);
    rect(0,0,width,height);
        for (int i=0; i<100; i++){
        float r=random(120);
        noFill();
        stroke(random(255),random(25),random(150));
        bezier(100+i,2*r+(r+25),r+30,r+(i+5),600,20+r,100*r,400);


            {if(mousePressed){ 
            stroke(220,random(255),random(150));
            translate(20, 50, 0);
            ellipse(350,250,40,40);
            //translate(60, 0, 0);
            ellipse(450,250,40,40);
            }
        } 
    }
}

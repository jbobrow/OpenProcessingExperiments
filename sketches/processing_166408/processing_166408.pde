
int counter;

void setup() {  //setup function called initially, only once
    size(400,400);
    
    
    stroke(0);
    strokeWeight(20);
    noFill();
    
    //arc(coord x, coord y, base, altezza, start, stop,mode);


}

void draw() {  

    background(255,255,255);
    counter ++;
    
    ellipse(200+cos(counter/5)*10,200,100+cos(counter/10)*10,100);
    arc(200,50,100+cos(counter/10)*10,100,0,PI); //alto
    arc(200,350,100,100+cos(counter/10)*10,PI,TWO_PI); //basso
    arc(50,200,100,100+cos(counter/10)*10,-HALF_PI,HALF_PI); //sinistra
    arc(350,200,100,100+cos(counter/10)*10,HALF_PI,PI+HALF_PI); //destra
}

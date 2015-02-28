
x = 50;
    y = 50;
    r = 0;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
}

void draw() {  //draw function loops 
    r++
    stroke(0);
    strokeWeight(5);
    fill( random(0,255), random(0,255), random(0,255), 155);
    ellipse(x,y,r,r);
    
    if(r>75)
    {
        r = 0;
        x = random(50,200);
        y = random(50,200);
    }
    
    textSize(30);
    fill(0);
    text("hello dancing", 10, 43);  
    
    textSize(30);
    fill(255, 102, 153);

    text("hello dancing", 12, 45);  

}


void setup() {  //setup function called initially, only once
    size(200, 200);
//    background(255);  //set background white
//    colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
//    counter = 0;
//colorMode(RGB,100); // custom color mode
//colorMode(RGB,100,300,10,255); // custom RGB color range
}

void draw() 
{  //draw function loops

    ellipseMode(CENTER);
    rectMode(CENTER);   
    stroke(0);
    fill(150);
    fill(255);
    ellipse(100,100,400/3,400/3);
    
    fill(0);
    ellipse(80,100,50,80);
    ellipse(120,100,50,80);
    fill(255);
    ellipse(80,100,20,35);
    ellipse(120,100,20,35);

    fill(235);
    ellipse(20,140,30,50);
    ellipse(180,140,30,50);
    
    fill(80);
    rect(75,185,40,25);
    noStroke();
    ellipse(55, 186, 25,25);    
    stroke(1);
    fill(80);
    rect(125,185,40,25);
    noStroke();
    ellipse(145, 186, 25,25);   
   
}

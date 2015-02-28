
void setup()
{
    size(700,700);
}

void draw()
{
    background(255);
    
    //legs
    fill(196,0,0);
    quad(290,490, 340,530, 320,600, 290,600);
    quad(510,490, 460,530, 485,600, 510,600);
    quad(380,540, 420,540, 410,570, 390,570);
    ellipse(300, 600, 50, 50);
    ellipse(500, 600, 50, 50);
    ellipse(400, 580, 40, 40);

    //body  
    fill(196,0,0);
    ellipse(400, 400, 300, 300);

    //wind shield
    fill(255,255,255);
    ellipse(400, 400, 250, 100);
    fill(42,160,221);
    ellipse(400, 400, 230, 90);

    //upper lights  
    fill(255,255,0);
    ellipse(310, 330, 40, 40);
    ellipse(490, 330, 40, 40);
   
    //---------
    fill(0,155,39);
    ellipse(350, 320, 20, 20);
    ellipse(450, 320, 20, 20);
    //---------
   
    fill(255,255,0);
    ellipse(375, 317, 20, 20);
    ellipse(425, 317, 20, 20);
    //----------
    fill(0,155,39);
    ellipse(400, 315, 20, 20);
    
    //roof
    fill(0,0,160);
    ellipse(400, 275, 150, 50);
    fill(80,68,155);
    ellipse(400, 260, 100, 40);
    
    //antenna
    strokeWeight(0);
    curve(410,190, 400,250, 410,190, 500,150);
   
    strokeWeight(0);
    fill(0,0,160);
    ellipse(410, 190, 20, 20);

    //nose
    strokeWeight(0);
    fill(111,101,79);
    ellipse(400, 500, 50, 50);
    fill(80,72,56);
    ellipse(400, 520, 20, 20);
    fill(0,0,0);
    ellipse(400, 520, 13, 13);

    //lower lights
    strokeWeight(0);
    fill(42,160,221);
    ellipse(330, 480, 55, 55);
    fill(42,160,221);
    ellipse(470, 480, 55, 55);
    fill(255,255,255);
    ellipse(330, 480, 50, 45);
    fill(255,255,255);
    ellipse(470, 480, 50, 45);
    fill(255,255,0);
    ellipse(330, 480, 40, 40);
    fill(255,255,0);
    ellipse(470, 480, 40, 40);
    
}

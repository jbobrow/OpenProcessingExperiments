
float time, time2, time3, constant, accel, move;
int count, red, blue;
String output;

void setup()
{
    size(400,400);
    noFill();
    time = 0;
    time2 = 0;
    time3 = 0;
    constant = 0.01;
    accel =0;
    red = accel;
    blue = accel;
}

void draw()
{
    red = map(accel,0,.5,0,255);
    blue = map(accel,0,-.5,0,255);
    background(red,0,blue);

//arc code
    strokeWeight(10);
    strokeCap(PROJECT);

    stroke(0,0,0);
    arc(width/2, height/2, width-40, height-40, PI+QUARTER_PI+time, TWO_PI+time);
    arc(width/2, height/2, 100, 100, PI+QUARTER_PI+(time)*-1, TWO_PI+(time)*-1);
    arc(width/2, height/2, 175, 175, PI+QUARTER_PI+time2, TWO_PI+time2);
    arc(width/2, height/2, 250, 250, PI+QUARTER_PI+(time3)*-1, TWO_PI+(time3)*-1);

    stroke(255,255,255);
    arc(width/2, height/2, width-35, height-35, PI+QUARTER_PI+time, TWO_PI+time);
    arc(width/2, height/2, 105, 105, PI+QUARTER_PI+(time)*-1, TWO_PI+(time)*-1);
    arc(width/2, height/2, 180, 180, PI+QUARTER_PI+time2, TWO_PI+time2);
    arc(width/2, height/2, 255, 255, PI+QUARTER_PI+(time3)*-1, TWO_PI+(time3)*-1);

//center text
    time = (time+constant+accel);
    time2 = (time2+constant+accel+.2);
    time3 = (time3+constant+accel+.2);
    
    output = "accel = " + nf(accel,2,3);
    textAlign(CENTER);
    text(output, width/2,height/2);
    textAlign(LEFT);
    text("\nclick to control\n, = decrease\n. = increase",5,5);
}

void keyPressed()
{
    if(key == '.')
      accel = accel + 0.005;
    else if(key == ',')
      accel = accel - 0.005;
}



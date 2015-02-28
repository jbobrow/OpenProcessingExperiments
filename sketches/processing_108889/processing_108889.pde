
//void setup will run only once
void setup () {
    size(500,500);
    background(255,255,255);
}

//void draw will run continuously
void draw () {

    //wall
    fill(220,220,220);
    rectMode(CENTER);
    rect(250,250,300,300);

    //room
    line(0,0,100,100);
    line(500,0,400,100);
    line(0,500,100,400);
    line(500,500,400,400);
}

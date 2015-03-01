
int l, d;
var ratio;
var pos;
var vel;
color c;

void setup() {  //setup function called initially, only once
    size(800, 800);
    l = 150;
    d = 75;
    pos = {x:width/2, y:height/2};
    vel = {x:1, y:-1};
    ratio = {x:4*l, y:3*l};

    c = color(random(255), random(255), random(255));

    noStroke();
    rectMode(CENTER);
}

void draw() {  //draw function loops 
    background(255);
    fill(40);
    rect((width/2), (height/2), ratio.x+10, ratio.y+10);
    fill(0);
    rect((width/2), (height/2), ratio.x, ratio.y);
    fill(c);
    rect(pos.x, pos.y, d, d, 10);
    pos.x+=vel.x;
    pos.y+=vel.y;
    if (pos.y+(d/2) >= (height/2)+(ratio.y/2) || pos.y-(d/2)<= (height/2)-(ratio.y/2)) {
        vel.y = -vel.y;
        c = color(random(255), random(255), random(255));
    }
    if (pos.x+(d/2) >= (width/2)+(ratio.x/2) || pos.x-(d/2)<= (width/2)-(ratio.x/2)) {
        vel.x = -vel.x;
        c = color(random(255), random(255), random(255));
    }
}

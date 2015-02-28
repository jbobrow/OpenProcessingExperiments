
int counter;

void setup() {
    size(470,650);
    background(220);
    smooth();
}

void draw() {
    noStroke();
    fill(240,0,10);
    ellipse(100,100,165,165);
    triangle(120,575,192,389,227,387);
    triangle(120,575,227,387,155,575);
    quad(290,605,306,627,422,557,420,532);
    fill(0,60);
    ellipse(100,100,165,165);
    fill(280,170,0);
    triangle(30,270,34,300,380,240);
    triangle(34,300,380,240,384,270);
    triangle(80,650,100,650,180,415);
    triangle(80,650,180,415,160,415);
    quad(360,604,360,620,455,568,455,549);
    fill(185);
    quad(180,560,240,405,298,405,243,560);
    strokeWeight(10);
    stroke(0,0,250);
    line(220,90,290,560);
    line(200,120,250,105);
    noStroke();
    fill(0);
    triangle(265,103,190,235,400,175);
    triangle(190,235,400,175,332,308);
     arc(260,180,30,30,radians(0),radians(270));
    
}

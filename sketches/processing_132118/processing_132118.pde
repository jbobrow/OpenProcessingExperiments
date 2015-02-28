
void setup(){
  size(400,400);
}

int a = 255;
int b = 254;

void draw(){

//rightfoot/
fill(random(b,a),random(b,a),random(b,a));
quad(170,350,195,350,170,370,145,370);

//leftfoot/
fill(random(b,a),random(b,a),random(b,a));
quad(205,350,230,350,255,370,230,370);

//pants//
fill(random(b,a),random(b,a),random(b,a));
rect(170,250,25,100);

fill(random(b,a),random(b,a),random(b,a));
rect(205,250,25,100);

//torso//
fill(random(b,a),random(b,a),random(b,a));
rect(170,130,60,140,15,15,0,0);

//neckline//
fill(random(b,a),random(b,a),random(b,a));
triangle(180,130,220,130,200,160);

//belt//
fill(random(b,a),random(b,a),random(b,a));
rect(170,230,60,10);

// face //
fill(random(b,a),random(b,a),random(b,a));
ellipse(200,100,50,65);

// left eye //
fill(random(b,a),random(b,a),random(b,a));
ellipse(190,100,10,3);

// right eye //
fill(random(b,a),random(b,a),random(b,a));
ellipse(210,100,10,3);

// hat //
fill(random(b,a),random(b,a),random(b,a));
ellipse(200,80,60,30);

fill(random(b,a),random(b,a),random(b,a));
rect(180,35,40,50,5,5,15,15);

//nose//
fill(random(b,a),random(b,a),random(b,a));
arc(200, 110, 10, 5, 0, PI, OPEN);

//smile//
fill(random(b,a),random(b,a),random(b,a));
arc(200, 120, 20, 10, 0, PI, CHORD);

//righthand//
fill(random(b,a),random(b,a),random(b,a));
ellipse(192,193,20,25);

line(194,192,201,192);
line(194,196,200,196);
line(194,188,200,188);

//lefthand//
fill(random(b,a),random(b,a),random(b,a));
rect(202,160,8,43,60,60,0,20);

//rightarm//
fill(random(b,a),random(b,a),random(b,a));
quad(170,180,170,140,150,200,150,230);

fill(random(b,a),random(b,a),random(b,a));
quad(150,200,150,230,190,210,190,180);

//left arm//
fill(random(b,a),random(b,a),random(b,a));
quad(230,180,230,140,250,200,250,230);

fill(random(b,a),random(b,a),random(b,a));
quad(210,210,210,180,250,200,250,230);

}



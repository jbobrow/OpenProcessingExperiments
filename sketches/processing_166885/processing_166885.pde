
int test = 10;

void setup(){
    size(400, 400);
    myMarioImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario.png");
    myPouncerImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/pouncer.png");
    myBackgroundImage= loadImage("http://minnameier.com/content/03-teaching/04-resources/background1.jpg");
    myBlockImage = loadImage("http://image.made-in-china.com/74f64j00zSItewvKEpkD/Strong-Aluminum-Alloy-EPS-Mould-EPS-Mold-Icf-Building-Block-Mold.jpg");
    x = 40;
    y = 40;
    xP1 = 80;
    xP2 = 280;
    yP1 = 160;
    yP2 = 240;
    xB = 160;
    yB = 240;
    vx = 40;
    vy = 40;
    right = true;
    test(50);
    println(test);
}

void draw(){    
    image(myBackgroundImage, 0, 0);
    if(right){
        image(myMarioImage, x, y);
    } else {
    //flip mario
        pushMatrix();
        scale(-1, 1);
        image(myMarioImage, -x - myMarioImage.width, y);
        popMatrix();
    }
    image(myPouncerImage, xP1, yP1);
    image(myPouncerImage, xP2, yP2);
    image(myBlockImage, xB, yB);
}

void keyPressed(){
    xOld = x;
    yOld = y;
    if((key == 'd' || key == 'j' || (key == CODED && keyCode == RIGHT)) && x < 320){
        x += vx;
        right = true;
    }
    if((key == 'a' || key == 'g' || (key == CODED && keyCode == LEFT)) && x > 40){
        x -= vx;
        right = false;
    }
    if((key == 's' || key == 'h' || (key == CODED && keyCode == DOWN)) && y < 320)
        y += vy;
    if((key == 'w' || key == 'z' || (key == CODED && keyCode == UP)) && y > 40)
        y -= vy;
    
    //collisions
    if(isSameField(x, y, xP1, yP1) || isSameField(x, y, xP2, yP2)){
        setup();
        println("collision");
    }
    if(isSameField(x, y, xB, yB)){
        x = xOld;
        y = yOld;
    }
    
    distance( xP1, yP1, xP2, yP2);
}

var isSameField(x1, y1, x2, y2){
    if(x1 == x2 && y1 == y2)
        return true
    return false
}

void distance(x1, y1, x2, y2){
    distance = Math.sqrt(Math.abs(x1 - x2) ^ 2 + Math.abs(y1 - y2));
    println(distance);
}

void test(int test){
    println(test);
}

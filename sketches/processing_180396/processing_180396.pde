
PImage cookie = loadImage("http://vignette4.wikia.nocookie.net/cookieclicker/images/5/5a/PerfectCookie.png/revision/latest?cb=20130827014912");
int x=0,y=0;
boolean goingRight = true, goingDown = false, goingLeft = false, goingUp = false;

void setup(){
    
    size(600, 600);
    background(255,255,255);
    
}

void draw(){
    imageMode(CORNER);
    image(cookie, x, y);
    move(x,y);
}

void move(int x, int y){
    if(goingRight == true){
        x++;
        if(x>450){
            goingDown = true;
            goingRight = false;
        }
    }
    else if(goingDown == true){
        y++;
        if(y>450){
            goingLeft = true;
            goingDown = false;
        }
    }
    else if(goingLeft == true){
        x--;
        if(x<0){
            goingUp = true;
            goingLeft = false;
        }
    }
    else if(goingUp == true){
        y--;
        if(y<0){
            goingRight = true;
            goingUp = false;
        }
    }
}

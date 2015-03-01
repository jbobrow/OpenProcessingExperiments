
int milliseconds = 4000;
void setup(){
    size(200,200);
    strokeWeight(2);
    strokeCap(SQUARE);
}

void draw(){
    background(255);
    //println(millis()%1000);
    if(millis()%milliseconds <= milliseconds/4){
        if(mousePressed){
            noStroke();
            fill(0,150,0);
            quad(25,25,25,175,175,175,175,25);
            stroke(0);
        }
        line(25,25,175,25);
        line(25,25,25,175);
        line(175,25,175,175);
        line(25,175,175,175);
    }
    else if(millis()%milliseconds <= milliseconds/2){
        if(mousePressed){
            noStroke();
            fill(0,0,150);
            quad(25,65,25,135,175,135,175,65);
            stroke(0);
        }
        line(25,65,175,65);
        line(25,65,25,135);
        line(175,65,175,135);
        line(25,135,175,135);
    }
    else if(millis()%milliseconds <= (milliseconds/4)+(milliseconds/2)){
        if(mousePressed){
            noStroke();
            fill(150,0,0);
            quad(65,25,25,175,175,175,135,25);
            stroke(0);
        }
        line(65,25,135,25);
        line(65,25,25,175);
        line(135,25,175,175);
        line(25,175,175,175);
    }
    else if(millis()%milliseconds <= milliseconds){
        if(mousePressed){
            noStroke();
            fill(150,0,200);
            quad(50,25,0,175,150,175,200,25);
            stroke(0);
        }
        line(50,25,200,25);
        line(50,25,0,175);
        line(200,25,150,175);
        line(0,175,150,175);
    }
}

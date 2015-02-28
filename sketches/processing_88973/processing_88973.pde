
//Lluís Rebull Requena
PImage donut;
float x = 0.0;
float y = 0.0;
float donutSpeed = 1;

void setup() {
  size(192, 157); 
  donut = loadImage("http://www.vul.bc.ca/v3/team/pictures/just_donut.gif");
}

void draw () {
    background(1);
    //creating some stars 
    stroke(255);
    for(int i = 1; i < 10; i++) {
        point(random(width), random(height));
    }
        
    image(donut,x,y);
    x=x+donutSpeed;
    if(x > width){
        x = 0;
        y = random(height);
}
}



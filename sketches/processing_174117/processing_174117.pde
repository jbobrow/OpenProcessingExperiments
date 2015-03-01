
float radius;
float xCen, yCen;
Hand secondsHand, minuteHand, hourHand;
String[] numerals= {"XII", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI"};



void setup(){
    size(600, 600);
    smooth();
    xCen  = width/2;
    yCen = height/2;
    radius = min(width, height)/3;
    //numerals = new String[12];
    //numerals  = {"12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"};
    //numerals  = {"XII", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI"};    
    secondsHand = new Hand(0.8*radius, 0.01 * radius, color(230, 60, 61));
    minuteHand = new Hand(0.8*radius, 0.03 * radius,color(43, 95, 238));
    hourHand = new Hand(0.6*radius, 0.05 * radius, color(43, 95, 238, 100));
}

void draw(){
    background(0);
    fill(255);
    stroke(255);
    pushMatrix();
        translate(xCen, yCen);
        strokeWeight(3);
        fill(0, 200, 200, 100);
        stroke(33, 250, 193);
        ellipse(0, 0, 2*radius, 2*radius);
    popMatrix();
    //text(second(), 300, 200);
    textSize(40);
    fill(33, 250, 193);
    textAlign(CENTER);
    pushMatrix();
        translate(xCen, yCen);
        //rotate(-PI/2);
        for(int i = 0; i < 12; i++){
            //text(numerals[i], radius - textWidth(numerals[i]) - 10, 0);   
            //rotate(radians(360/12));
            text(numerals[i], (radius - textWidth(numerals[i])/2 - 10)*cos(radians(i*360/12 - 90)), 20+(radius - textWidth(numerals[i])/2 - 10)*sin(radians(i*360/12 - 90)));
        }
    popMatrix(); 
    hourHand.display();
    minuteHand.display();
    secondsHand.display();
    minuteHand.update(minute()*6 -90);
    secondsHand.update(second()*6 - 90);
    hourHand.update((hour()%12) * 360/12 + minute()* 360/60/12 - 90);
    pushMatrix();
        translate(xCen, yCen);
        strokeWeight(8);
        stroke(33, 250, 193);
        point(0, 0);
    popMatrix();
}

class Hand{
    float handLength;
    float handWidth;
    float angle;
    color handColor;
    
    Hand(float handLength_, float handWidth_, color handColor_){
        handLength = handLength_;
        handWidth = handWidth_;
        handColor = handColor_;       
    } 
    
    void update(float angle_){
        angle  = angle_;
    } 
    
    void display(){
    
        pushMatrix();
        translate(xCen, yCen);
        rotate(radians(angle));
        fill(handColor, 170);
        stroke(handColor, 250);
        strokeWeight(1);
        //line(0, 0, handLength, 0);
        beginShape();
            vertex(0, handWidth);
            vertex(handLength, 0);
            vertex(0, -handWidth);
        endShape();
        arc(0, 0, 2*handWidth, 2*handWidth, PI/2, 3*PI/2);
        popMatrix();
    } 
    }



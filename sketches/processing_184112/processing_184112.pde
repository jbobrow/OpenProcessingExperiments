
void setup(){
        size(400,200);
        background(255);
        colorMode(HSB);
}
void draw(){
        float speed=abs(mouseX-pmouseX) +abs(mouseY-pmouseY);
        if(mousePressed){  //only draw if the mouse is pressed
                pushMatrix();
                translate(mouseX, mouseY);
                fill(40 +(speed*.95), 200+(random(-10,10)),200+(random(-10,10)),100 +(speed*.55));  //use speed to modify fill
                stroke(60 +(speed*.95), 200+(random(-10,10)),200+(random(-10,10)),100 +(speed*.55));  //use speed to modify stroke
                ellipse(0,0,2+(speed*.25),6-(speed*.25)); //use speed to modify width, height
                ellipse(3+random(-5,5),5+random(-5,5),5+(speed*.25),6-(speed*.25)); //use speed to modify width, height
                popMatrix();
        }
}

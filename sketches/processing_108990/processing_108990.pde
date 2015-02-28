
//simple sketch using transalate and rotate
int angle = 0.2;

void setup(){
    size(400,400);
    //fill(255);
    //noLoop();
    //frameRate(10);
    stroke(30,40);
    rectMode(CENTER);
}

void draw(){

    translate(width/2,height/2);
    for(int i = 200; i > 0; i = i - 10){
        fill(255,255-i,255-i);
        //stroke(255 - i, 100 - i); 
        strokeWeight(i/10 - 10);
        stroke((i - 10), i - 10);
        rotate((mouseX + mouseY)/400);
        rect(0,0,i,i);

    }
    angle += 0.2;


   /*translate(width/2,height/2);
    for(int i = 0; i < 200;i++){
        rotate(0.1);
        ellipse(i,0,10,10);
    }*/
    //angle += 0.1;

}//end of draw

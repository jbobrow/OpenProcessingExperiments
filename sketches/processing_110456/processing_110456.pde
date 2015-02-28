
float space = 0.4;
float rotation = 0.01;
float radius = 10;
float magnify = 200;
boolean clicked = false;


void setup(){

    size(600,400);
    background(0);
    noFill();
    stroke(255);
    strokeWeight(2);

}//end of setup

void draw(){
    translate(width/2,height/2);
    background(0);
    
    for(int i = 0; i < 700; i++){
        pushMatrix();
        rotate(90 * i);
        stroke(map(mouseX,0 , width , 0 , 255) , map(mouseY, 0 , height , 0 , 255) , i/255);
        translate(10 + sin(i * space * radius) * magnify , 0);
        ellipse(0, 0, 2 , 2);
        stroke(map(mouseX,0 , width , 0 , 255) , map(mouseY, 0 , height , 0 , 255) , i/255 , 100 - i/10);
        rect( 0 , 0 , 10 , 10);
        //line(0 , 0 , 10 , 10);
        popMatrix();
    }
    
    radius = map(mouseX , 0 , width , 2, 200);
    space = map( mouseX/mouseY, 0 , 0.5 , -0.05 , 0.05);
    magnify = map(mouseY , 0 , height , 10 , 200);
    

}//end of draw

void mousePressed(){
    clicked = !clicked;
    if(clicked)
        noLoop();
    else
        loop();
}

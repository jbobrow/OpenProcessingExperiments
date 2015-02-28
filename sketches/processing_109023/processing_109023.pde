
//Another example using transalate and rotation

void setup(){
    
    size(400,400);
    stroke(100);
    smooth();
    //noLoop();
    //ellipse(200,200,50,50);
}

void draw(){

    translate(width/2,height/2);
    
    for(int i = 200; i > 0; i = i - 10){
        stroke(0,i);
        fill(i - 10,255, i - 10,i);
        rotate(mouseX/400);
        ellipse(0,0,mouseX,mouseY);
        rect(0,0,mouseY - i,mouseY - i);
        //ellipse(0,0,pmouseX,pmouseY);
        
    }

}

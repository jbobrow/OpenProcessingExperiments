
void setup(){
    size(500,500);
     background(0);
     fill(255,255,255);
    ellipse(100,100,50,50);
    fill(255,255,255);
    ellipse(400,100,50,50);
    fill(255,255,255);
    rect(150,300,200,150);    
}

void draw (){
    if(mousePressed == true){
    fill(0,200,200);
    noStroke();
    ellipse(mouseX,mouseY,20,20);
    }
}




int w= width;
int h= height;


void setup(){
size(200,200);
background(255); //background color (doesn't appply really)

}

void draw(){
if (keyPressed){
line(mouseX,mouseY,random(w && h)); //line drawn in random places when key is pressed 
    stroke(random(0,255),random(0,255), random(0,255));  //different color line strokes
    }
else{
    background(random(0,255),random(0,255), random(0,255)); //changes background different colors randomly

}

if(mouseX <= 100 || mouseY <= 100){

cursor(CROSS);
}
else{
cursor(ARROW);
}
    }

void mousePressed(){
background(255); //when mouse pressed changes background to white  

}

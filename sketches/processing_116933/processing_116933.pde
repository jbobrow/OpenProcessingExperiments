

float counter = 0;


void setup() {   
    size(500, 500);
    frameRate(60);
    textFont(createFont("Times New Roman",32));
    background(0);
}   
void draw() {

ellipse(mouseX, mouseY, 10, 10);

triangle(200, 200, 300, 300, 400, 400);

String W = "YOU WIN";
String L = "YOU LOSE";  
String A = "TIME : " + counter;
counter = counter +0.0167;
text(A, 15, 30);
if(counter >= 10){
        fill(255, 0, 0);
        text(A, 15, 30);
        text(L, 225, 225);
    }
    else {
        background(0);
        counter = counter +0.0167;
        fill(255, 255, 255);
        text(A, 15, 30);
        
 
       
    }
}
    




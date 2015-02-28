

//what happens if you change these both to 50? what are they doingtothe pattern?
int patternSeperationX = 75;
int patternSeperationY = 75;


void setup(){
 size(300,600);
 smooth();
 //the white box simply shows you the space your pattern gets drawn in
 fill(255);
 noStroke();
 rect(0,0,patternSeperationX,patternSeperationY);
 stroke(0);
 background(255);
 for(int i = 0; i < width/patternSeperationX; i++){
    for(int j = 0; j < height/patternSeperationY; j++){
      pushMatrix();
      translate(i*patternSeperationX, j*patternSeperationY);
      yourFunction();
      popMatrix();
    }
 }

}




void yourFunction(){

 //-------------------------------------YOUR PATTERN GOESINHERE-------------------------------
 //try making pleasant designs :-)


 noFill();
 stroke(0, 0, 255, 45);
 rect(0, 3, 40, 35);
 rect(15, 30, 70, 60);
 stroke(0, 0, 255, 25);
 rect(30, 50, 50, 20);

 int a = 0;
 int b = 8;

 while(a < 10)
{


 stroke(0, 0, 255, b);
 strokeWeight(2);
 b = b+5;
 line(0, 11*a, width, 11*a);
 a = a+1;
}


}




void draw(){
 noLoop();
 fill(116, 96, 57, 35);
 noStroke();
 rect(0, 0, 150, 80);
 rect(40, 0, 60, 160);
 rect(0, 0, 30, 40);
 rect(7, 7, 45, 60);
 rect(40, 50, 50, 30);
 rect(90, 0, 50, 40);
 fill(250, 194, 91, 45);
 rect(0, 50, 50, 30);
 rect(50, 20, 30, 90);
 fill(255, 154, 52, 45);
 rect(70, 90, 30, 70);
 rect(100, 0, 50, 60);

 fill(116, 96, 57, 45);
 rect(240, 0, 60, 530);
 rect(240, 50, 40, 70);
 rect(260, 70, 40, 20);
 rect(250, 200, 40, 70);
 rect(240, 240, 30, 90);
 rect(270, 400, 30, 90);
 rect(240, 470, 60, 40);
 fill(250, 194, 91, 45);
 rect(240, 0, 20, 70);
 rect(260, 100, 30, 90);
 rect(250, 300, 40, 100);
 rect(240, 500, 50, 30);
 fill(250, 224, 93, 50);
 rect(270, 20, 30, 70);
 rect(240, 430, 40, 40);

 fill(116, 96, 57, 45);
 rect(40, 530, 190, 70);
 rect(40, 570, 50, 30);
 rect(70, 540, 30, 40);
 rect(80, 530, 60, 20);
 rect(150, 540, 50, 20);
 rect(190, 500, 40, 80);
 fill(250, 194, 91, 45);
 rect(40, 530, 50, 40);
 rect(80, 560, 90, 40);
 rect(190, 500, 20, 90);
 fill(255, 154, 52, 45);
 rect(50, 560, 50, 40);
 rect(90, 530, 90, 40);


 fill(116, 96, 57, 45);
 rect(0, 200, 200, 100);
 fill(255, 154, 52, 45);
 rect(0, 200, 50, 50);
 rect(70, 240, 70, 30);
 rect(160, 220, 40, 50);
 fill(250, 154, 93, 45);
 rect(0, 230, 90, 20);
 rect(130, 210, 70, 50);
 rect(0, 260, 70, 40);
 fill(250, 194, 91, 45);
 rect(150, 200, 50, 100);


 fill(0, 0, 255, 25);
 rect(0, 75, 200, 450);
 rect(0, 148, 260, 363);

 stroke(0, 0, 255, 69);
 line(0, 45, 50, 45);
 line(0, 76, 60, 76);
 line(0, 99, 50, 99);
 line(0, 120, 65, 120);
 line(0, 135, 55, 135);
 line(0, 150, 45, 150);

 line(0, 215, 50, 215);
 line(0, 226, 60, 226);
 line(0, 248, 55, 248);
 line(0, 270, 65, 270);
 line(0, 323, 50, 323);
 line(0, 365, 65, 365);
 line(0, 390, 50, 390);


}





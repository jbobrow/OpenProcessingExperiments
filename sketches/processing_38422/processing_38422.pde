
float y_position = 500;
float x_position = 0;
float x_speed = +4;
float y_speed = -4;

void setup(){
size(500,500);
background(0);
}

void draw(){

smooth();
strokeWeight(1);

stroke(230);

y_position = y_position + y_speed;
x_position = x_position + x_speed;

//if x_position>500,it should go back to 0
if(x_position > 500){
x_speed = -4;
}
//if x_position<=0,it should go back to 500
if(x_position <=0){
x_speed = +4;
}


//if y_position < 0,it should go back to 500
if(y_position < 0){
y_speed = +4;
}
//if y_position >=500,it should go back to 0
if(y_position >=500){
y_speed = -4;}




fill(122,186,221);
triangle(500,437.5,x_position,y_position,500,500);

fill(114,168,224);
triangle(500,375,x_position,y_position,500,437.5);

fill(107,145,224);
triangle(500,312.5,x_position,y_position,500,375);

fill(102,122,227);
triangle(500,250,x_position,y_position,500,312.5);

fill(95,95,227);
triangle(500,187.5,x_position,y_position,500,250);

fill(108,87,229);
triangle(500,125,x_position,y_position,500,187.5);

fill(126,81,232);
triangle(500,62.5,x_position,y_position,500,125);

fill(148,73,232);
triangle(500,0,x_position,y_position,500,62.5);

fill(171,67,234);
triangle(437.5,0,x_position,y_position,500,0);

fill(196,58,237);
triangle(375,0,x_position,y_position,437.5,0);

fill(226,51,237);
triangle(312.5,0,x_position,y_position,375,0);

fill(244,45,226);
triangle(250,0,x_position,y_position,312.5,0);

fill(244,38,192);
triangle(187.5,0,x_position,y_position,250,0);

fill(246,31,180);
triangle(125,0,x_position,y_position,187.5,0);

fill(249,31,160);
triangle(62.5,0,x_position,y_position,125,0);

fill(249,16,120);
triangle(0,0,x_position,y_position,62.5,0);

}           

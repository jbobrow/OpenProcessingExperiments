
void setup(){
size(500,500);
background(255);
}

void draw(){

smooth();
strokeWeight(1);

stroke(random(200,230));
fill(122,186,221);
triangle(500,437.5,0,500,500,500);

fill(114,168,224);
triangle(500,375,0,500,500,437.5);

fill(107,145,224);
triangle(500,312.5,0,500,500,375);

fill(102,122,227);
triangle(500,250,0,500,500,312.5);

fill(95,95,227);
triangle(500,187.5,0,500,500,250);

fill(108,87,229);
triangle(500,125,0,500,500,187.5);

fill(126,81,232);
triangle(500,62.5,0,500,500,125);

fill(148,73,232);
triangle(500,0,0,500,500,62.5);

fill(171,67,234);
triangle(437.5,0,0,500,500,0);

fill(196,58,237);
triangle(375,0,0,500,437.5,0);

fill(226,51,237);
triangle(312.5,0,0,500,375,0);

fill(244,45,226);
triangle(250,0,0,500,312.5,0);

fill(244,38,192);
triangle(187.5,0,0,500,250,0);

fill(246,31,180);
triangle(125,0,0,500,187.5,0);

fill(249,31,160);
triangle(62.5,0,0,500,125,0);

fill(249,16,120);
triangle(0,0,0,500,62.5,0);

}
                

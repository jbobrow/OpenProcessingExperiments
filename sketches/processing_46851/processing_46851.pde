
float ranStroke;

void setup () {
size(610,610) ;

}

void draw() {
}

void mousePressed () {
if (mousePressed == true){
ranStroke = random(1,7) ;
strokeWeight (ranStroke) ;
rect (mouseX,mouseY,100,100) ;
}
}

void mouseReleased () {
ranStroke = random(1,255);
fill (ranStroke,100,100,191);

}



// Asignment 5: Initials Function
//Max Perim, Andrew ID: mperim copyright 2012
void setup(){ 
size(400, 400);
smooth();
noStroke();
}

void draw(){
  background (255);
  symbol(mouseX,mouseY);
}

void symbol(float x, float y){
fill (#6FEDFA);
ellipse (x, y-35, 400, 200);
fill(#FF8F1F);
arc (x-115, y, 100, 200, radians(180), radians(360));
arc (x-65, y, 100, 200, radians(180), radians(360));
arc (x+10, y-65, 100, 65, radians (270), radians (450));
quad (x-10, y-98, x+10, y-98, x+75, y, x-10, y);
arc (x+110, y-65,100, 65, radians (270), radians (450));
rect (x+77, y-97.5, 40, 98);
}


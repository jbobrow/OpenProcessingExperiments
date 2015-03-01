
void setup () {
  size(800, 600);
}

void draw() {
if (keyPressed) {
switch(key){
case 'v':
fill(#FBF307);
break;
default:
fill(255);
break;
}
rect(599, 500, 200, 400);

switch(key){
case 'z':
fill(0);
break;
default:
fill(255);
break;
}
rect(1, 500, 200, 400);

switch(key){
case 'c':
fill(#660AFA);
break;
default:
fill(255);
break;
}
rect(400, 500, 200, 400);

switch(key){
case 'x':
fill(#FF040C);
break;
default:
fill(255);
break;
}
rect(200, 500, 200, 400);
}
}







PFont f;

void setup(){
size(500,500);
smooth();
f = createFont("Arial", 72, false);
}

void draw(){

 background(200);
 
  if (keyPressed) {
    if (key == '1'){
       String str = "Hello world!";
       text(str,40,30,70,80);
    }
  }
}


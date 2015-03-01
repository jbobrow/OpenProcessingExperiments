
int x;
void setup() {
  size(500, 500);
  smooth();
  background(255);
  x=1;
}

void draw() {
 }

void mouseDragged() {
  strokeWeight(x);
  line(mouseX, mouseY, pmouseX, pmouseY);
}


void keyPressed() { 

//size up

if(keyCode == UP) { 

x += 1; 

if(x >= 20) { 

x = 20; 

} 

//size down
} else if(keyCode == DOWN) { 

 x -= 1; 

if(x <= 1) { 
x = 1;   
} 

} 

//iro
switch(key) {
    //ao
  case 'b':
    stroke(0, 0, 255);
    println("b");
    break;

    //aka
  case'r':
    stroke(255, 0, 0);
    println("r");
    break;

    //midori
  case'g':
    stroke(0, 255, 0);
    println("g");
    break;

    //kuro
  case'z':
    stroke(0);
    println("z");
    break;
 
 //siro
  case'w':
    stroke(255);
    println("w");
    break;
 //kesu
  case'd':
    background(255);
    println("d");
    break;
  
  //haikei kuro
 case'k':
    background(0);
    println("k");
    break;

}
 

}



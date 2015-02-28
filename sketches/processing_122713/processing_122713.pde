
int x, y;
int r, g, b;

void setup(){
  size(600, 600);
  background(255, 0, 190);
  noStroke();
  fill(0, 100, 0);
}

void draw(){
}

void mouseDragged(){
  ellipse(mouseX, mouseY, 20, 20);//oekaki
}

void keyPressed(){

switch(key) {
    
    case'o'://orange
    noStroke();
    fill(255, 110, 0);
    break;
  
    case'b'://blue
    noStroke();
    fill(0, 0, 255);
    break;
  
    case'g'://green
    noStroke();
    fill(0, 100, 0);
    break;
 
    case'r'://red
    noStroke();
    fill(255, 0, 0);
    break;
 
    case 'x'://deleat
    background(255, 0, 190);
    break;

    case 'e'://keshigomu
    noStroke();
    fill(255, 0, 190);
    break;
     
    case'1'://line
    stroke(0);
    strokeWeight(10);
    line(0, 100, 600, 100);
    break;

    case'2':
    strokeWeight(10);
    line(0, 200, 600, 200);
    break;

    case'3':
    strokeWeight(10);
    line(0, 300, 600, 300);
    break;
    
    case'4':
    strokeWeight(10);
    line(0, 400, 600, 400);
    break;
    
    case'5':
    strokeWeight(10);
    line(0, 500, 600, 500);
    break;
    
    case'6':
    strokeWeight(10);
    line(100, 0, 100, 600);
    break;
    
    case'7':
    strokeWeight(10);
    line(200, 0, 200, 600);
    break;
    
    case'8':
    strokeWeight(10);
    line(300, 0, 300, 600);
    break;
    
    case'9':
    strokeWeight(10);
    line(400, 0, 400, 600);
    break;

    case'0':
    strokeWeight(10);
    line(500, 0, 500, 600);
    break;


}


}



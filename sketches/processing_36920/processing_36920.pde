
int x;
int y;
int x1;
int y1;
int x2;
int y2;
color Red = color(255,0,0);
color Blue = color(0,0,255);
int[] circles = new int[3];
circles[0] = 50;
circles[1] = 150;
circles[2] = 250;
int[] clicked = new int[2];
clicked[0] = x;



void setup(){  //setup function called initially, only once
  size(300,300);
  background(255);  //set background white
  stroke(0);
  line(0,100,300,100);
  line(0,200,300,200);
  line(100,0,100,300);
  line(200,0,200,300);
}

void draw(){ 
  if(mousePressed){
    get(mouseX,mouseY);
    if(mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 100){
      x1 = 50;
      y1 = 50;
    
    }
    else if(mouseX > 100 && mouseX < 200 && mouseY > 0 && mouseY < 100){}
  } 
  
  

}

void calculation(){

}

void first(){
  fill(Red);
  ellipseMode(CENTER);
  ellipse(x1,y1,30,30);
}

void second(){
  fill(Blue)
  ellipseMode(CENTER);
  ellipse(x2,y2,30,30);
}

                
                                                                                                                                                                                                

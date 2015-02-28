
//this is the first hello
//by KokFu Lok

void setup(){
  size(640,480);
  background(200,0,0);

}

void draw(){
ellipse(60,50,600,800);
stroke(mouseX, mouseY, 200);
strokeWeight(4); 
ellipse(320,240,300,300);
stroke(165);
strokeWeight(1);
rect(500,12,100,20);
line(320,240,600,450);
line(600,450,500,12);
line(500,12,320,240);
}




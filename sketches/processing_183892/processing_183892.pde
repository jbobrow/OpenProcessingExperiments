
int f=400;
int speed=10;


void setup(){
  size(400,400);
  smooth();
  frameRate(3);
}

void draw(){
  
  for(int x=0;x<800;x=x+10){
    for(int y=0;y<800;y=y+50){
      backGround(x,y);
    }
  }
  myLine();

  
  float o=random(255);
  fill(255,0,0);
  
  //body
  ellipse(200,f,70,180);
  rectMode(CENTER); 
  fill(193,205,193);
  rect(170,f+30,50,70);
  rect(230,f+30,50,70);
  fill(110,123,139);
  rect(175,f+30,20,70);
  rect(225,f+30,20,70);
  
  //small window
  fill(205,197,191);
  ellipse(200,f-35,40,40);
  fill(135,206,250);
  ellipse(200,f-35,20,20);
  //rect(175,f+70,50,30);
 
  
  f=f-speed;
  if(f<0){
    f=400;
  }
}

void myLine(){
  float g=random(255);
  stroke(0);
   strokeWeight(6);
  fill(255,255,g);
  rectMode(CENTER);
  rect(180,f+70,10,60);
  rect(190,f+70,10,60);
  rect(200,f+70,10,60);
  rect(210,f+70,10,60);
  rect(220,f+70,10,60);
  
  
  f=f-speed;
  if(f<-70){
    f=400;
  }
}



void backGround(int a, int b){
  float c=random(400);
   float d=random(255);
 
   fill(0,d,255);
   //noStroke();
  ellipse(b,a,a,c);
}




void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}

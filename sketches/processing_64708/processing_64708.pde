
void setup(){
    size (500,500);
    background (255);
    smooth();
    colorMode(RGB);
  
    //drawing the snowglobe
    stroke(180,220,255);
    strokeWeight(3);
    fill(200,235,255);
    ellipse(250,225,400,400);
  
    //drawing a tree
    stroke(90,65,35);
    fill(110,75,35);
    rect(310,325,20,40);
    stroke(35,110,40);
    fill(60,135,65);
  
    //drawing the tree branches
    int b = 300;
    for(int a=75; a>10; a=a-6){
      triangle(320,b,320-a,b+25,320+a,b+25);
       b=b-20;
    }
  
    //drawing a snowman
    fill(255);
    stroke(235);
    ellipse(175,325,80,80);
    ellipse(175,270,60,60);
    ellipse(175,230,40,40);
  
    //drawing the hat
    fill(0);
    stroke(0);
    rect(165,193,20,20);
    line(160,213,190,213);
  
    //drawing his face
    ellipse(168,225,3,3);
    ellipse(182,225,3,3);
    ellipse(175,260,4,4);
    ellipse(175,271,4,4);
    stroke(250,150,30);
    fill(250,150,30);
    ellipse(175,233,4,4);
    
    //drawing the snow at the bottom
    stroke(255);
    fill(255);
    arc(330,500,290,300,PI,TWO_PI);
    arc(190,500,320,310,PI,TWO_PI);
    arc(260,400,100,100,PI,TWO_PI);
    arc(110,400,100,100,PI,TWO_PI);
    arc(380,400,100,100,PI,TWO_PI);
  
    //redwawing the outline
    stroke(180,220,255);
    strokeWeight(3);
    noFill();
    ellipse(250,225,400,400);
  
    //drawing the base
    stroke(80,60,30);
    fill(100,65,20);
    quad(115,375,385,375,400,440,100,440);

}

void draw(){
  if(keyPressed) {
   if(key == 's' || key == 's'){
     for(int s = 50; s>0; s=s-1){
      float a = random (2,7);
      fill(255);
      noStroke();
      ellipse(random(50,450), random(25,370), a,a); 
     
     }
   }
  }

  if(keyPressed){ //to make him smile
    if(key == 'h' || key == 'H'){
      fill(0);
      noStroke();
      ellipse(175, 242,3,3);
      ellipse(170, 240,3,3);
      ellipse(180, 240,3,3);
      ellipse(166, 237,3,3);
      ellipse(184, 237,3,3);
      
    }
  }

  if (mousePressed){//to add lights
    noStroke();
    fill(random(0,255),random(0,255),random(0,255));
    float x = random(5,10);
    ellipse(mouseX, mouseY, x,x);    
  }

  if(keyPressed){ //to clear the screen
    if (key == 'c' || key == 'C') {
    background(255);
    smooth();
    colorMode(RGB);
  
    //drawing the snowglobe
    stroke(180,220,255);
    strokeWeight(3);
    fill(200,235,255);
    ellipse(250,225,400,400);
  
    //drawing a tree
    stroke(90,65,35);
    fill(110,75,35);
    rect(310,325,20,40);
    stroke(35,110,40);
    fill(60,135,65);
  
    //drawing the tree branches
    int b = 300;
    for(int a=75; a>10; a=a-6){
      triangle(320,b,320-a,b+25,320+a,b+25);
       b=b-20;
    }
  
    //drawing a snowman
    fill(255);
    stroke(235);
    ellipse(175,325,80,80);
    ellipse(175,270,60,60);
    ellipse(175,230,40,40);
  
    //drawing the hat
    fill(0);
    stroke(0);
    rect(165,193,20,20);
    line(160,213,190,213);
  
    //drawing his face
    ellipse(168,225,3,3);
    ellipse(182,225,3,3);
    ellipse(175,260,4,4);
    ellipse(175,271,4,4);
    stroke(250,150,30);
    fill(250,150,30);
    ellipse(175,233,4,4);
    
    //drawing the snow at the bottom
    stroke(255);
    fill(255);
    arc(330,500,290,300,PI,TWO_PI);
    arc(190,500,320,310,PI,TWO_PI);
    arc(260,400,100,100,PI,TWO_PI);
    arc(110,400,100,100,PI,TWO_PI);
    arc(380,400,100,100,PI,TWO_PI);
  
    //redwawing the outline
    stroke(180,220,255);
    strokeWeight(3);
    noFill();
    ellipse(250,225,400,400);
  
    //drawing the base
    stroke(80,60,30);
    fill(100,65,20);
    quad(115,375,385,375,400,440,100,440);
    
      
    }
  }

}


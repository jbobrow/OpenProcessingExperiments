
float x, y;
int i;
int angle;
int j;



void setup(){
  size(800,800);
  background(184,245,235);
  smooth();
  strokeWeight(.1); 
  x = 0;
  y = 0;
}



void draw(){
  strokeWeight(1);
   stroke(178,34,34,30);
   line(height/2,width/2, random(800), random(800));
    lluvia();
    torus();
    flaca();
    medio();
    fruta();
    
    
  //translate(height/2,width/2);
   if(mousePressed == true){
    higo();
  }


angle += 34;

}

// function 1 white lines
void torus(){
 
  strokeWeight(1);
  stroke(250, 30);
  ellipse(height/2, width/2, random(350, 730), random(350, 730));{
  }
}

// function 2 rectangles in the center(not visible)
void lluvia(){
  rectMode(CENTER);
  noFill();
  stroke(34, 45, random(223),5);
  rect(height/2, width/2, random(400), random(400));
}

//function 3 trigonometry fog
void fruta(){
    translate(height/2,width/2);
  for(int j=0;j<45;j++){
  
  float t = j*5*cos(radians(angle)/cos(angle));
  float v = j*5*sin(radians(angle)*tan(angle));
  
  noStroke();
  fill(255,2);
  ellipse(t, v, 15, 15);
  
  noStroke();
  fill(54,76,134,1);
  ellipse(t,v, 25, 25);
  
  angle++;
  }
}

//function 4 trigonometry when moussePressed
void higo(){
  for(int i=0;i<100;i++){
 
  float x = i*3.5*cos(radians(angle));
  float y = i*3.5*sin(radians(angle));
  
  noStroke();
  fill(234,random(56),156, 2);
  ellipse(x,y, 10, 10);
  
 noStroke();
  fill(23,58,156, 2);
  ellipse(x,y, 30, 30);
  
  noStroke();
  fill(125,45,26, 2);
  ellipse(x,y, 50, 20);
  
  angle++;
  }
}


//function 5 blue lines
void flaca(){
 
  noFill();
  strokeWeight(1);
  stroke(70, 130, 180, 30);
  ellipse(height/2, width/2, random(150, 350), random(150, 350));{
  if(mousePressed == true){
  
  }
  }
}

//function 6 yellow lines
void medio(){
 
  strokeWeight(1);
  stroke(255, 215,0,30);
  ellipse(height/2, width/2, random(230, 530), random(230, 530));{
  
  }
}

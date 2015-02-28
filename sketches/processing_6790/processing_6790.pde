

//|||||||||||||||||||||||||||||||||||||\\
//||                                 ||\\
//||  Sunil vallu                    ||\\
//||  New Media Design               ||\\  
//||  National Institute Of Deaign   ||\\
//||                                 ||\\
//|||||||||||||||||||||||||||||||||||||\\


float x = random(400,width);
float y = random(300,height);
float w = random(0,200);
float h = random(0,200);
float d = random(0,200);

float x1 ;
float y1 ;
float x2 ;
float y2 ;
float x3 ;
float y3 ;

void setup(){
  size(800,600);
  frameRate(30);
  background(255);
  smooth(); 
   // move this to draw if you want to see animated version
}

void draw(){
//background(255);

  if(mousePressed){
    color c = color(random(10,125),150,random(200,250),random(100,255));
        tri(c);
    stick(); // draw lines
    shake(60);
  }
  else{
    color c = color(random(200,255),150,random(10,150),random(100,255));
    tri(c); // draw triangles
    stick();
    shake(20);
  }




}

/// triangle drawing function
void tri(color c){
  colorMode(HSB);
  noStroke();
  fill(c);
  triangle(x1,y1,x2,y2,x3,y3); 
}


// line drawing function
void stick(){
  stroke(0,50);
  strokeWeight(random(1,1));
  line(x,y,w,h); 
}

// to make movement with slight variation
void shake(float speed){
  x = x+random(-1,1)*speed;
  y = y+random(-1,1)*speed;
  w = x+random(-1,1)*speed;
  h = y+random(-1,1)*speed;

  // constrain
  x = constrain(x,0,width);
  y = constrain(y,0,height);
  w = constrain(w,0,width);
  h = constrain(h,0,height);

  // for triangle

  x1 = abs(x+random(-1,100));
  y1 = abs(y+random(-1,50));
  x2 = abs(x+random(-1,50));
  y2 = abs(y+random(-1,100));
  x3 = abs(x+random(-1,50));
  y3 = abs(y+random(-1,50));

}

void keyPressed(){
 background(255); 
}







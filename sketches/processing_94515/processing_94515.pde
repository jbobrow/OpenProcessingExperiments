
float x,y; 

int r=40; 

float easing=0.1; 

float placex=random(50,450); 

float placey=random(50,450); 

  

void setup(){ 

  size(500,500); 

  frameRate(30); 

  background(0); 

  strokeWeight(5); 

  smooth(); 

  stroke(255,120); 

} 

  

void draw(){ 

  float targetX = mouseX; 

  float targetY = mouseY; 

    

  if(mousePressed==true) 

    { 

    if(mouseButton==LEFT) 

    { 

      x += (targetX-x)*easing; 

      y += (targetY-y)*easing; 

      int c=int(random(3.1)); 

      if(c==0) 

      { 

        stroke(218,112,214); 

        fill(255); 

        ellipse(x,y,random(40),random(40)); 

         c=int(random(3.1)); 

      } 

      else 

      { 

        if(c==1) 

        { 

          stroke(255,0,255); 

          fill(255); 

          ellipse(x,y,random(40),random(40)); 

          c=int(random(3.1)); 

        } 

      else 

      { 

        if(c>=2) 

        { 

          stroke(148,0,211); 

          fill(255); 

          ellipse(x,y,random(40),random(40)); 

          c=int(random(3.1)); 

        } 

  

      } 

    } 

} 

    } 

    else 

    { 

    if (keyPressed==true) 

    { 

      noStroke(); 

      fill(0); 

      rect(0,0,500,500); 

    } 

    } 

}

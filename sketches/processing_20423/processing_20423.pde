

// triangle(70, 50, 100, 0, 130, 50);
float counter;
float y = 50;
float a = 0;
float b = 50;

float ya = y + 150;
float aa = a + 150;
float ba = b + 150;


void setup() 
{
  size(500, 200);
  counter=0.0;
  smooth();
  frameRate(30);
}

void drawBoxGradient(int x, int y, int w, int h, color startColor, color stopColor) {
  for(int myX = x; myX < (x + w); myX+=10) {

    color resultColor = lerpColor(startColor, stopColor, norm(myX, x, (x+w)));

    resultColor = lerpColor(resultColor, color(0,0,255,127), norm(myX, x, (x+w)));

    //stroke(resultColor);
    noStroke();
    fill(resultColor);
    //   line(myX, y, myX, (y+h));
    rect(myX, y, 10, y+h);
  }
}

void draw() {

  color myColor1 = color(255,0,0,127);
  color myColor2 = color(255,255,0,255);
  drawBoxGradient(0,0,width,height,myColor1, myColor2);

  noStroke();
  fill(75,50,0,40); 
  triangle(0, y, 30, a, 60, b);
  triangle(50, ya, 80, aa, 110, ba);
  triangle(100, y, 130, a, 160, b);
  triangle(150, ya, 180, aa, 210, ba);
  triangle(200, y, 230, a, 260, b);
  triangle(250, ya, 280, aa, 310, ba);
  triangle(300, y, 330, a, 360, b);
  triangle(350, ya, 380, aa, 410, ba);
  triangle(400, y, 430, a, 460, b);
  triangle(450, ya, 480, aa, 510, ba);

  y = y + .5; 
  if (y > 250) { 
    y = 0;
  } 
  a = a + .5; 
  if (a > 200) { 
    a = -50;
  } 
  b = b + .5; 
  if (b > 250) { 
    b = 0;
  }   
  
  
  
  
    ya = ya + .5; 
  if (ya > 250) { 
    ya = 0;
  } 
  aa = aa + .5; 
  if (aa > 200) { 
    aa = -50;
  } 
  ba = ba + .5; 
  if (ba > 250) { 
    ba = 0;
  }   


  counter++;
  translate(width/2, height/2);
  noStroke();

  fill(175); 
  float radius = 1.0;
  //float centerX = 33;
  //float centerY = 66;


  for (int deg = 0; deg < 360*3; deg += 15) {

    float angle = radians(deg);
    float x = 75 + (cos(angle) * radius);
    float y = 42 + (sin(angle) * radius);



   rotate(counter*PI);

    noStroke();
    fill(175);
    ellipse (x,y, 6, 6);
    fill(255,0,0,75);
    ellipse(x,y, 3,3);

    noStroke();
    fill(175);
    ellipse(x-300,y, 6,6);
    fill(255,0,0,75);
    ellipse (x-300,y, 3, 3);

    noStroke();
    fill(175);
    ellipse (x+100,y+50, 6, 6);
    fill(255,0,0,75);
    ellipse(x+100,y+50, 3,3);
    
            noStroke();
    fill(175);
    ellipse (x+80,y-75, 6, 6);
    fill(255,0,0,75);
    ellipse(x+80,y-75, 3,3);
    
    
        noStroke();
    fill(175);
    ellipse (x-100,y-50, 6, 6);
    fill(255,0,0,75);
    ellipse(x-100,y-50, 3,3);
    
            noStroke();
    fill(175);
    ellipse (x-200,y-30, 6, 6);
    fill(255,0,0,75);
    ellipse(x-200,y-30, 3,3);
    
          noStroke();
    fill(175);
    ellipse (x-250,y-100, 6, 6);
    fill(255,0,0,75);
    ellipse(x-250,y-100, 3,3);
    
    fill(175);
    ellipse (x+150,y-20, 6, 6);
    fill(255,0,0,75);
    ellipse(x+150,y-20, 3,3);
    
    
   
    

    radius = radius + .35;
  }
}



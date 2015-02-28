
float x, y, xn, yn, a, b, c, d, step;
int radius;
boolean trails;
 
void setup() { 
  colorMode(HSB, 360, 100, 100);
  noStroke();
  background(0); 
  smooth();
  frameRate(15); 
  noiseSeed(0);
  size (900, 556); 
  x = 0; 
  y = 0;
  preset('1');
} 

void seedem() {
  a = random(-PI, PI);
  b = random(-TWO_PI, TWO_PI);
  c = random(-PI, PI);
  d = random(-TWO_PI, TWO_PI); 
  println("a = " + a + "; b = " + b + "; c = " + c + "; d = " + d + ";");
}

void draw() { 
  step += 0.01; 
  if(trails) {
    fill(0,13);
    rect(0,0,width-1,height-1);
  }
  else {
    background(0);   
  }
  
  d = (noise(step) * 2 - 1) * 5; 
  
  for(int i=0; i<2000; i++) { 
    xn = x; 
    yn = y; 
    x = sin(a*yn) - cos(b*xn); 
    y = sin(c*xn) + cos(d*yn); 
    fill(noise(x, y) * 360, 100, 100, 31);
    ellipse(int(width/2+width/5*x),int(height/2+height/5*y), radius, radius);
  } 
} 

void keyPressed() {
  switch(key) {
    case 'j':  step += 1; println("step = " + step + ";"); break;
    case '+':  radius++;         break;
    case '-':  radius--;         break;
    case 't':  trails = !trails; break;
    case 'r':  seedem();         break;
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
      preset(key);
      break;
  }
}

void preset(char inkey) {
  switch(inkey) {
     case '1':
        radius = 2;
        trails = true;
        step = 42;
        a = 0.38017607; b = -1.7459617; c = -1.912152; d = 1.9914489;
        break;
      
     case '2':
        radius = 11;
        trails = false;
        step = 13;
        a = 1.2567215; b = 0.5829123; c = 0.9197792; d = 3.3462088;  
        break;
        
     case '3':
        radius = 11;
        trails = false;
        step = 29;
        a = 0.9166148; b = -1.8232875; c = -0.2687571; d = 0.13697433;
        break;

     case '4':
        radius = 11;
        trails = false;
        step = 21;
        a = 2.6498835; b = 1.3636484; c = -1.1778816; d = 3.828174;

        break;

     case '5':
        radius = 11;
        trails = false;
        step = 21;
        a = 2.079007; b = -0.44759798; c = -0.30358768; d = 0.22594976;
        break;
        
     case '6':
        radius = 2;
        trails = true;
        step = 42;
        a = -2.4638858; b = 1.6006508; c = 0.49559164; d = 0.67652893;
        break;

     case '7':
        radius = 2;
        trails = true;
        step = 42;
        a = -2.0635095; b = 1.1612196; c = 0.106108665; d = 0.15071678;
        break;
  }
  
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}


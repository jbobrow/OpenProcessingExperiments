
int lineLength = 100;
int [] x = new int [lineLength];
int [] y = new int [lineLength];
color[] c = new color[lineLength];
int [] s = new int[lineLength];



void setup () {
  size(600, 600);
  background(255);
  smooth();
  
}

void draw () {
  stroke(50, 50, 150);


  int i = 0;
  int counter = 0;
  int thesize = 100;
  while ( i < x.length) {
    noStroke();
    ellipse (x[i], y[i], thesize, thesize);
    i= i +1;
  }
  if (mousePressed ) {
    if (counter >= x.length) {
      x= expand (x);
      y= expand (y);
    }
    x[counter] =mouseX;
    y[counter] =mouseY;
    
    if (key == 'u' ) { 
      c[counter] =mouseX; 
      c[counter] =mouseY;
      fill(random(0,255),100,100,10);
    }
    
    if(key == 's') {
      s[counter] =mouseX;
      s[counter] =mouseY;
      thesize = 400; 
      
    } 


    counter= counter +1;
  }
}





int radius = 250;  

/*Create the arrays for x position and y position of points around our circle */
float [] xPos = new float [360];  
float [] yPos = new float [360];


void setup() {       
  size(600, 600);      
  smooth();          
  background(0);    


  /*Fill the arrays with coordinates around circle using cosine and sine */
  for (int i = 0; i < 360; i++) {
    int deg = i * 1;
    float angle = radians(deg);
    xPos[i] = cos(angle) * radius;
    yPos[i] = sin(angle) * radius;
  }
}

void draw() {     
  translate(width/2, height/2); // Move origin to middle of canvas. 

  for (int i = 0; i < 360; i++) {
    stroke(random(255), random(255), random(255));  //randomize color of lines
    int random1= (int)random(359); //choose random coordinates for point A
    int random2= (int)random(359); //choose random coordinates for point B

    line(xPos[random1], yPos[random1], xPos[random2], yPos[random2]); //draw line from point A to point B
  }
}



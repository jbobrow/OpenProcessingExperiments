
float x, y, myRotate;
int numAssets = 345;
int startX = 25;
int startY = 25;
int spacingX = 25;
int spacingY = 25;
int gridCols = 23;
int weight = 0;




void setup(){
	size(600, 400);
	background(#000000);
	smooth();
}

void draw() {
  
        strokeWeight(.5);
	fill(#000000);
  
  background(#000000);
  
  for (int i = 0; i<numAssets; i++){
		int row = floor( i/gridCols ); 
		int col = i % gridCols;
                
                noStroke();//(random(255), random(255)); //if u want each box to have a seperate colour,alpha put within forLoop
		fill(#ff9600, random(255));

                rectMode(CENTER);
		
		x = startX + (col * spacingX);
		y = startY + (row * spacingY);

              rect(x,y,5, 5);
              

  }
  
  
  for (int i = 0; i<numAssets; i++){
		int row = floor( i/gridCols ); 
		int col = i % gridCols;
                
                strokeWeight(0.5);
                stroke(#d1fbff, 60); 
		
                
		
		x = startX + (col * spacingX);
		y = startY + (row * spacingY);

             line(x,y,pmouseX, pmouseY);
              
  }
             
    if (mousePressed) { 
    background(0);
  }
  
  
  
  
  
  
  
  
}


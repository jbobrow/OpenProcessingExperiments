
// A Drawing Tool, by Drew Mokris, 7/14/2012

color[][] colors = new color[2][5];

void setup() {

  size(600, 500);
  smooth();
  fill(#FFFFFF);
  rect(0, 0, width, height);
  colors[0][0] = #000000;
  colors[1][0] = #FFFFFF;
  colors[0][1] = #FF0000;
  colors[1][1] = #00FF00;
  colors[0][2] = #0000FF;
  colors[1][2] = #FFFF00;
  colors[0][3] = #00FFFF;
  colors[1][3] = #FF00FF;
  colors[0][4] = #956D23;
  colors[1][4] = #888888;
  
}

int chosen_color_i=0;
int chosen_color_j=0;


float thick = 24;
float medium = 12;
float thin = 3;

float thickness = thin;

boolean drawing = false;

void draw() {

  fill(#FFFFFF);
  stroke(0);
  strokeWeight(2);
  rect(0,0,70,220);
  
  // Draw the chosen color highlight
  fill(#00FF00);
  noStroke();
  rect(7+25*chosen_color_i,
       7+25*chosen_color_j,
       27, 27);
  // Draw the palette
  stroke(0);
  strokeWeight(1);
  for(int i = 0; i < 2; ++i){
    for(int j = 0; j < 5; ++j){
       fill(colors[i][j]);
       rect(10+25*i,10+25*j,20,20);
    }
  }
  
  // Draw the thicknesses
  fill(#00FF00);
  noStroke();
  if(thickness == thick) ellipse(30, 160, thick+5, thick+5);
  else if(thickness == medium) ellipse(30, 180, medium+5, medium+5);
  else ellipse(30, 200, thin+5, thin+5);
  fill(colors[chosen_color_i][chosen_color_j]);
  noStroke();
  ellipse(30, 160, thick, thick);
  ellipse(30, 180, medium, medium);
  ellipse(30, 200, thin, thin);
  
  if(mousePressed){
    // Check to see if we're picking a color
    if(mouseX > 6 && mouseX < 60 &&
       mouseY > 6 && mouseY < 141)
    {
       chosen_color_i = (mouseX - 6) / 27;
       chosen_color_j = (mouseY - 6) / 27;
    }
    else if(mouseX > 10 && mouseX < 40 &&
            mouseY > 140 && mouseY < 220)
    {
       if(mouseY > 140 && mouseY < 170) {
         thickness = thick;
       }
       else if (mouseY > 170 && mouseY < 190){
         thickness = medium;
       }
       else {
         thickness = thin; 
       }
    }
    else {
       if(drawing){
         // draw a line from previous to here...
         strokeWeight(thickness);
         stroke(colors[chosen_color_i][chosen_color_j]);
         line(pmouseX,pmouseY,mouseX,mouseY);
       }
       else { 
         drawing = true;
       }
    }
  }
  else {
     drawing = false; 
  }
}



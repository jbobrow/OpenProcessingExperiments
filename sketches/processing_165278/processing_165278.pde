
int[] population = {37239000, 26746000, 22868000,
                    22826000, 21766000, 21241000,
                    20877000,20673000, 20568000,
                    20032000};

String[] name = {"Tokyo", "Jakarta", "Seoul",
                 "Delhi", "Shanghai", "Manila",
                 "Karachi", "New York", "Sao Paulo",
                 "Mexico City"};

float Margin = 100;

//Boolean variables for buttons
boolean changeColor, chartType, changeScale, isHovering1, isHovering2, isHovering3;

//Hue for buttons and bars, brightness for buttons
int hue1 = 40;
int hue2 = 100; 
int btnBrightness1, btnBrightness2, btnBrightness3, btnHue;

void setup(){
  size(500, 500);
  colorMode(HSB);
}

void draw(){
  background(0);

  drawScale();  
  drawChart();
  drawButtons();
  
  //Chart Title
  fill(255, 0, 255);
  textSize(16);
  text("Most Populated Cities of the World", width/2, 10);
}

void drawButtons(){
  
  //Creating buttons
  noStroke();
  fill(btnHue, 255, btnBrightness1);
  rect(Margin, Margin/3, Margin-10, Margin/3, 10);
  fill(btnHue, 255, btnBrightness2);
  rect(Margin*2, Margin/3, Margin-10, Margin/3, 10);
  //need to fix button coordinates, and create the function to change scales, 
  fill(btnHue, 255, btnBrightness3);
  rect(Margin*3, Margin/3, Margin-10, Margin/3, 10);
  fill(0);
  textSize(12);
  textAlign(CENTER, CENTER);
  text("Change Color", Margin, Margin/3, Margin-10, Margin/3);
  text("ChartType", Margin*2, Margin/3, Margin-10, Margin/3);
  text("ChangeScale", Margin*3, Margin/3, Margin-10, Margin/3);
  
  // Changing style based on interaction
    if(isHovering1 == true){
      btnBrightness1 = 240;  
      }else{
      btnBrightness1 = 190;  
      }  
       if(isHovering2 == true){
       btnBrightness2 = 240;  
    }else{
       btnBrightness2 = 190;  
    }  
     if(isHovering3 == true){
       btnBrightness3 = 240;  
    }else{
       btnBrightness3 = 190;  
    }  
    
    //Changing the color of the Buttons to match color of chart
 if(changeColor == true){
    btnHue = hue1;
    }else{
    btnHue = hue2;
    }
}

void drawScale(){
  // creating common parameters for both scale options
 float x1, y1, x2; 
 x1 = Margin;
 x2 = width - Margin;
 stroke(200);
 textSize(12);
 textAlign(RIGHT);
 fill(255);
 
// interaction to change scale
 if(changeScale == true){
   for(int i = 0; i < max(population); i += 5000000){
 //   float x1, y1, x2, y2; 
    y1 = map(i,
             0, max(population),
             height - Margin, Margin);               
    line(x1, y1, x2, y1);
    text(i, x1 - 10, y1);
   }}else{
   for(int i = 0; i < max(population)/1000000; i += 5){
  //  float x1, y1, x2, y2; 
    y1 = map(i,
             0, max(population)/1000000,
             height - Margin, Margin);               
    line(x1, y1, x2, y1);
    text(i, x1 - 20, y1);  
    textAlign(CENTER, CENTER);
    text("Population in Millions", width/2, Margin -10);
   }
   }
}
  

void drawChart(){
  // Drawing the chart
  for(int i = 0; i < population.length; i++){
    float stemX, stemY, stemWidth, stemHeight, lolliTop;
    lolliTop = 20;
    stemWidth = 4;
    stemHeight = map(population[i],
                    0, max(population),
                    0, height - 2 * Margin);
    stemX = map(i,
               0, population.length - 1,
               0 + Margin, width - lolliTop - Margin);
    stemY = height - Margin;
    noStroke();
    float brightness = map(population[i],
                           0, max(population),
                           0, 255);
                           
//user interaction option to change the color by clicking on button
if(changeColor == true){
    fill(hue1, 225, brightness);
    }else{
    fill(hue2, 225, brightness);
  }
  
  //user interaction option to change whether bars or lollipops are displayed
 if(chartType == true){  
     stemWidth = 20;
    rect(stemX, stemY, stemWidth, -stemHeight);
 }else{
    rect(stemX, stemY, stemWidth, -stemHeight);
    ellipseMode(CENTER);
    ellipse(stemX + stemWidth/2, height - stemHeight - Margin, lolliTop, lolliTop);
 }
 
//labeling the X axis    
    pushMatrix();
      translate(stemX + stemWidth/2, height - Margin + lolliTop);
      rotate(radians(-45));
      textAlign(RIGHT);
      fill(255);
      text(name[i], 0, 0);
      popMatrix();   
  }
}

void mouseMoved(){
  // Makes each button brighter while mouse hovers over it
 //   rect(Margin, Margin/3, Margin-10, Margin/3, 10); 
  if(mouseX >= Margin && mouseX <= Margin * 2 -10 &&
  mouseY >= Margin/3 && mouseY <= Margin/3 * 2){
    isHovering1 = true;
  }else{
    isHovering1 = false;
    }
    
 //  rect(Margin * 2, Margin/3, Margin-10, Margin/3, 10);   
      if(mouseX >= Margin * 2 && mouseX <= Margin * 3 -10 &&
  mouseY >= Margin/3 && mouseY <= Margin / 3 * 2){
      isHovering2 = true;
  }else{
    isHovering2 = false;
    }
 // rect(Margin*3, Margin/3, Margin-10, Margin/3, 10);
      if(mouseX >= Margin * 3 && mouseX <= (Margin * 4) -10 && 
      mouseY >= Margin / 3 && mouseY <= Margin / 3 * 2){
      isHovering3 = true;
  }else{
    isHovering3 = false;
    }
  }


void mouseReleased(){
  //initiates change in color, chart type or scale based on user interaction
  if(isHovering1){
    if(!changeColor){
     changeColor = true;
  }else{
    changeColor = false;
  }
  }
 if(isHovering2){
    if(!chartType){
      chartType = true;
    }else{
      chartType = false;
    }}
 if(isHovering3){
    if(!changeScale){
      changeScale = true;
    }else{
      changeScale = false;
    }}
}




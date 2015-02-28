
//Emily Gorman
//HW DUE: sep 29th
//Crude Oil Price Forecast (http://www.forecasts.org/oil.htm)

float data[] = {86.33,87.0,85.2,78.4,73.6,67.1,62.6,59.2,59.6};

void setup(){
  background(0);
  size(1000,400);
  smooth();
  
}


void draw(){
  background(0);
  for(int i = 0; i < data.length; i++){
    float rectSize = map(data[i],59.2,87.0,0,100);
    rect(i*150+100,100-30,rectSize,rectSize);
    fill(255,255,255);
     fill(252,250,250);
  text("Crude Oil Price Forecast",100,300);
  text("West Texas Intermediate Spot Price. USD/bbl. Average of Month.",100,320);
    text(data[i],i*150+100,100-30);
    fill(252,33,213);
    
  }
}


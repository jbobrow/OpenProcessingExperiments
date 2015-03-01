
// Because this data is not directed towards a 
//particular audience, don't worry that much
//about the best way to visualize it for 
//now. Instead, think of a form you find 
//interesting and that could help you in 
//future projects. Take a look at Jer
//Thorp's example for technical help.

//A bubble chart where the size of the bubble
//represents the population


int[] data; //placeholder for the population data
String[] labels; //placeholder for city labels

//define margins
int[] margins = {80,80,50,120};



void setup() {
  size(320,1200);
  colorMode(HSB);
  labels = loadStrings("cities.txt");
  //load the population data and pass it to a string
  //assign the string to the data array
  String[] stringData = loadStrings("population.txt");
  data = new int[stringData.length];
  
  for(int i = 0; i <= stringData.length - 1; i += 1){
    data[i] = parseInt(stringData[i]);
    println(data[i]);
  }
}

//where the functions get called!
void draw() {
  background(255);
  drawCircles();
  drawAxis();
  title();
  stop();
}

//draw the Y axis
void drawAxis(){
  int offset = 10;
  // start, stop, increment
  for(int i = 0; i < max(data); i=i+5000000){
    float x1 = margins[3] - offset;
    float x2 = width - margins[1] + offset;
    float y1 = height - margins[2] - scaleY(i);
    float y2 = y1;
    
    // grayscale, alpha
    stroke(120, 100);
    line(x1, y1, x2, y2);
    
    //labels
    fill(200);
    textAlign(RIGHT);
    text(i, x1 - offset, y1+5);
  }
}

//loop through the data array and draw each circle with
//size equal to the value in the array
void drawCircles() {
  
 for(int i = 0; i <= data.length-1;i++) {
   float diameter = sqrt(data[i]/PI)/50;
   noStroke();
   fill(i*30,i*30,i*30,50); //color circles
   ellipse(scaleX(width/2), height-scaleY(data[i]), diameter, diameter); //draw circle
   
     // text for city labels
   fill(i*30,i*30,i*30);
    
   if(i%2 <= 0){ //alternate label position
    textAlign(LEFT);
    text(labels[i], scaleX(width/2) + 50, height-scaleY(data[i]));
    } else {
      textAlign(RIGHT);
    text(labels[i], scaleX(width/2) - 50, height-scaleY(data[i]));
    }
 }
}

//TITLE THE CHART
void title() {
  String title ="Population of International Cities";
  fill(0);
  textAlign(LEFT);
  textSize(14);
  text(title, 25,50);
}

float scaleY(int n){
  return map(n,                                   // input
             0, max(data),                   // input range
             0, height - margins[0] - margins[2]);//output range
}

float scaleX(int n){ //ensures circles are always centered in chart area
  return map(n,                                   // input
             0, width,                   // input range
             margins[3], width - margins[1]);//output range
}




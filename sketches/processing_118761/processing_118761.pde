
// How to read CSV files using the Table class

PFont f;
PFont g;
int counter = 0;
Table data;

float rot = 0;
float speed =  TWO_PI/666;

void setup() {
  size(850, 850);   
  background(0);
  data = loadTable("co2.csv", "header,csv");
  f = createFont("Cambria", 20);
  textAlign(LEFT);
  textFont(f);
 
  g = createFont("Cambria", 20);
  textFont(g);
  
  
}
//---------------------------------------------------------------------------



void draw() {
  
  text("TRENDS OBSERVED", 10, 60);
  fill(255, 0, 0);
  text("AVERAGE LEVELS", 10, 90);
  fill(0, 0, 255); 
  text("INTERPOLATED POINTS", 10, 120);
  fill(0, 255, 0); 
 
  
  // get the "current" row
  TableRow row = data.getRow(counter); 

  // Pull out the data 
  float average = row.getFloat("average");
  float trend = row.getFloat("trend");
  float interpolated = row.getFloat("interpolated"); 

  // Let's draw it 
  translate(width/2, height/2);
  rotate(rot);
  //average values (red)
  stroke(255, 0, 0, 128);
 
  //maps the negative values
  float averageX = map(average, 200, 350, 50, 275);
  line(0, 0, averageX, 50);
  stroke (averageX, 0, 0, 0);

  //trend values(green)
  stroke(0, 255, 0, 128);
  line(0, 0, trend, 0);      
 
  //interpolated values(blue)
  stroke(0, 0, 255, 140);
  line(0, 0, interpolated, 0); 


  /// Go to the next row 
  counter ++; 

  // Increase the angle
  rot = rot+speed;

  if (counter == 666);
  redraw();
} // end draw





String [] Job = new String[8];
String [] words = new String[0]; // empty 0 len array for words
String n = "Anna Felix Lucas Michael Phelan Roman";

void setup() {

  size(430, 300); 
  background(0);
  fill(255);
  textSize(32);
  //fill(255);
  text(n, 10, 10, 150, 350);  // Text wraps within text box
/* 
  Job[0]="Küche Klolinks Klorechts Saugen Ofen Kühlschrank Wohnzimmer Badezimmer"; 

   */
   Job[1]="Badezimmer"; 
   Job[2]="Klolinks"; 
   Job[3]="Klorechts"; 
   Job[4]="Saugen"; 
   Job[5]="Ofen"; 
   Job[6]="Kühlschrank"; 
   Job[7]="Wohnzimmer"; 
}

void draw() {

}

void mousePressed() {
  String newJob=""; // empty string for new peom
  // choose some random length and loop that many times
  for (int i=0;i<int(random(6,6));i++) {
    // add new word to string with a space imbetween - pick at random from array
    newJob += Job[int(random(Job.length))] + "    ";
  }
  text(newJob, 180, 10, 220, 390);
}


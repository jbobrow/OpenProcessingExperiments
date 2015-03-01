
People [] allPeople;
boolean mode = false;

void setup() {
  size(800, 600);
  
  String dataCSV[] = loadStrings ("Titanic.csv");
  println(dataCSV);
  allPeople = new People[dataCSV.length];
  
  for (int i=1; i<dataCSV.length; i++) { 
  String[] onePersonData = split (dataCSV[i], ",");
  
  allPeople [i] = new People(onePersonData[0], (onePersonData[1]), (onePersonData[2]), (onePersonData[3]), float(onePersonData[4]));
  
  println(onePersonData[0]);
  println(onePersonData[1]);
  println(onePersonData[2]);
  println(onePersonData[3]);
  println(onePersonData[4]);

  }

}

void draw() {
  background(255);
  
  if(mode == false){
    for (int i=1; i<allPeople.length; i++) {
       allPeople[i].display();
       
    }
  }
  else{
    for (int i=1; i<allPeople.length; i++) {
      if(allPeople[i].survival.equals("Yes")){
        allPeople[i].display();
      }
    }
    fill(0);
    stroke(3);
    textSize(12);
    text("Total Survivors: 711", 40, 575);
  }
  
  fill(0);
  stroke(3);
  textSize(12);
  text("Total On Board Titanic: 2201", 40, 475);
  text("Passenger Class: 1st, 2nd, 3rd, Crew", 40, 550);
  text("Total", 40, 500);
  text("On Board:", 127, 500);
  text("On Board:", 115, 525);
  text("Total", 40, 525);
  fill(50, 100, 200);
  text("Children", 73, 500);
  text("284", 188, 500);
  fill(113, 149, 145);
  text("Adults", 74, 525);
  text("1917", 175, 525);
  fill(0);
  textSize(10);
  text("click mouse", 10, 15);

}

void mouseClicked(){
  mode = !mode;
}



class People {
  
  float freq;
  String survival;
  String age;
  String sex;
  String status;
  
  PVector location;
  
  People (String _status, String _sex, String _age, String _survival, float _freq) {

    status = _status;
    sex = _sex;
    age = _age;
    survival = _survival;
    freq = _freq;
    
    location = new PVector(random(width), random(height));
    
  }
  void display() {
   
   if(age.equals("Child")){
     fill(50, 100, 200, 70);
   }else{
     fill(113, 149, 145, 50);
   }
   
   ellipse(this.location.x, this.location.y, freq, freq);
   //textAlign(CENTER, CENTER);
   fill(0);
   textSize(13);
   if(this.freq != 0) {
   text(this.status, this.location.x, this.location.y);
   }
  }
  
}



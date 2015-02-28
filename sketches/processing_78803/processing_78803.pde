
//Working Title: Bitten 
//Discription: The infographic will take the useres through various visualizations that will allow them to view the data through various comparative views. 
//Technical problems: Being able to graph and inturpert the data in various ways.

int margin = 50;

Dog [] dogs;
Dog mins;
Dog maxs;


void setup() {
  String[] data=loadStrings("dog_bite.csv");

  dogs = new Dog[data.length];

  for (int i=0; i<data.length; i++) {
    dogs[i]=new Dog(data[i]);
  }

  noLoop();
  size(1000, 600);
  noStroke();
  smooth();
  noLoop();
  background(#FFFFFF);
}

void draw() {

  for (int i=0; i<dogs.length; i++) {


    float x=i*12;
    float dataPoint=map(dogs[i].children, 0, 63, 0, height);
    text(dogs[i].breed,x,height-dataPoint);
    fill(#6F6F6F);   
    rect(x, height-dataPoint, 4, dataPoint);
  }
}

void findMins(){
  
  //for (int i=0; i<data.length; i++) {
    //
 // }
}

class Dog {
  //fields
  String breed;
  int attacks;
  int children;
  int adults;
  int deaths;
  PImage img;

  //constructor
  Dog(String data) {
    String [] pieces=split(data, ",");
    breed = pieces[0];
    attacks= (int)parseFloat(pieces[1]);
    children= (int)parseFloat(pieces[2]);
    adults= (int)parseFloat(pieces[3]);
    deaths= (int)parseFloat(pieces[4]);
  }
  
  //methods
  void setImage(String file){
    img = loadImage(file);
  }
}



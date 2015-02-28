
//Anthony Hernandez, "US Nuclear Weapon Stockpile 1945-2000"
//Second Edition
//October 11, 2011

//Nick- I am having trouble with the location of the data and how to align it with the text.
//Also, how to align the rectangles with the data and text.
 
  int data[] = {6, 369, 3057, 20435, 31642, 26119, 27052, 23764, 23135, 21211, 10953, 10615};
 // string dates[]= {"1945","1959","1955"."1969","1965","1970","1980","1990","1995","2000"};
  
void setup(){
  background(0);
  size(300,650);
  smooth(); 
}
 
 
void draw(){
  background(0);
  for(int i = 0; i < data.length; i++){
    float ellSize = map(data[i],6,31642,0,50);
    rect(100,i*50,ellSize,ellSize);
    fill(255,255,255);
   
  text("2000",15,600);
  text("1995",15,550);
  text("1990",15,500);
  text("1985",15,450);
  text("1980",15,400);
  text("1975",15,350);
  text("1970",15,300);
  text("1965",15,250);
  text("1960",15,200);
  text("1955",15,150);
  text("1950",15,100);
  text("1945",15,50);
  
    text("US Nuclear Weapon Stockpile",60,620);
    text("1945-2000",110,640);
    text(data[i],250,i*50);
    fill(random(0,255),random(0),random(0));
     
  }
  

}



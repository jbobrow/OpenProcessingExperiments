
//Anthony Hernandez, "US Nuclear Weapon Stockpile 1945-2000"
//September 28, 2011

 
  int data[] = {6, 369, 3057, 20435, 31642, 26119, 27052, 23764, 23135, 21211, 10953, 10615};
 
void setup(){
  
  background(0);
  size(2000,400);
  smooth();
   
}
 
 
void draw(){
  
  background(0);
  
  for(int i = 0; i < data.length; i++){
    float ellSize = map(data[i],6,31642,0,100);
    ellipse(i*150+100,200,ellSize,ellSize);
    fill(255,255,255);
   
  text("1945",95,300);
  text("1950",245,300);
  text("1955",395,300);
  text("1960",550,300);
  text("1965",700,300);
  text("1970",855,300);
  text("1975",1005,300);
  text("1980",1155,300);
  text("1985",1305,300);
  text("1990",1455,300);
  text("1995",1600,300);
  text("2000",1750,300);
  
    text("US Nuclear Weapon Stockpile",854,350);
    text("1945-2000",907,370);
    text("A.Hernandez 2011",1860,385);
 
    text(data[i],i*150+100,100-50);
    fill(random(0,255),random(0),random(0));
     
  }
}


